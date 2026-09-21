import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class ExerciseExecutionScreen extends ConsumerStatefulWidget {
  final WorkoutTemplateExercise exercise;
  final String templateId;
  final int stationIndex;
  const ExerciseExecutionScreen({
    super.key,
    required this.exercise,
    required this.templateId,
    required this.stationIndex,
  });

  @override
  ConsumerState<ExerciseExecutionScreen> createState() =>
      _ExerciseExecutionScreenState();
}

class _ExerciseExecutionScreenState
    extends ConsumerState<ExerciseExecutionScreen> {
  double _weight = 0;
  int _reps = 0;
  int _currentSet = 1;
  StrengthLog? _lastLog;
  bool _loaded = false;
  bool _saving = false;

  int get _targetSets => widget.exercise.targetSets ?? 3;

  @override
  void initState() {
    super.initState();
    Future.microtask(_load);
  }

  Future<void> _load() async {
    final db = ref.read(databaseProvider);
    final last = await db.lastLogForExercise(widget.exercise.exercise);
    if (!mounted) return;
    setState(() {
      _lastLog = last;
      _weight = last?.weight ?? 0;
      _reps = last?.reps ?? widget.exercise.targetReps ?? 0;
      _loaded = true;
    });
  }

  Future<void> _completeSet() async {
    setState(() => _saving = true);
    final db = ref.read(databaseProvider);
    final workoutId = await db.ensureWorkoutForToday(widget.templateId);
    await db.logSet(
      workoutId: workoutId,
      templateExerciseId: widget.exercise.id,
      exercise: widget.exercise.exercise,
      weight: _weight == 0 ? null : _weight,
      reps: _reps == 0 ? null : _reps,
      setNumber: _currentSet,
    );
    if (!mounted) return;
    setState(() => _saving = false);
    if (_currentSet >= _targetSets) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.exercise.exercise} concluído · $_targetSets séries')),
      );
    } else {
      setState(() => _currentSet++);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final e = widget.exercise;
    return Scaffold(
      appBar: AppBar(
        title: Text('Estação ${widget.stationIndex}/8'),
      ),
      body: !_loaded
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
              children: [
                Text(e.exercise,
                    style: AppTheme.display(c.text).copyWith(fontSize: 26)),
                const SizedBox(height: 2),
                Text(e.cue,
                    style: GoogleFonts.montserrat(color: c.textMuted, fontSize: 13)),
                const SizedBox(height: 16),
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: c.surface2,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: c.border),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          e.category == 'cardio'
                              ? Icons.directions_run_rounded
                              : Icons.fitness_center_rounded,
                          size: 48,
                          color: c.textFaint,
                        ),
                        Positioned(
                          bottom: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: c.surface,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: c.border),
                            ),
                            child: Text('imagem/gif de execução',
                                style: GoogleFonts.ibmPlexMono(
                                    fontSize: 9.5, color: c.textFaint)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: _StepperCard(
                        label: 'Carga',
                        value: '${_weight.toStringAsFixed(1)} kg',
                        onMinus: () => setState(() => _weight = (_weight - 2.5).clamp(0, 500)),
                        onPlus: () => setState(() => _weight = (_weight + 2.5).clamp(0, 500)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StepperCard(
                        label: e.metricType == MetricType.time ? 'Segundos' : 'Reps',
                        value: '$_reps',
                        onMinus: () => setState(() => _reps = (_reps - 1).clamp(0, 200)),
                        onPlus: () => setState(() => _reps = (_reps + 1).clamp(0, 200)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saving ? null : _completeSet,
                    child: Text(_saving
                        ? 'Salvando…'
                        : 'Concluir série · $_currentSet/$_targetSets'),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    _lastLog == null
                        ? 'primeira vez registrando este exercício'
                        : 'última vez: ${_lastLog!.weight?.toStringAsFixed(1) ?? '—'}kg × ${_lastLog!.reps ?? '—'}'
                            '${_lastLog!.rpe != null ? ' · RPE ${_lastLog!.rpe}' : ''}',
                    style: GoogleFonts.ibmPlexMono(fontSize: 11, color: c.textFaint),
                  ),
                ),
              ],
            ),
    );
  }
}

class _StepperCard extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;
  const _StepperCard({
    required this.label,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MonoLabel(label),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StepButton(icon: Icons.remove_rounded, onTap: onMinus),
              Text(value, style: AppTheme.display(c.text).copyWith(fontSize: 18)),
              _StepButton(icon: Icons.add_rounded, onTap: onPlus),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _StepButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: c.surface2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: c.border),
        ),
        child: Icon(icon, size: 16, color: c.accent),
      ),
    );
  }
}
