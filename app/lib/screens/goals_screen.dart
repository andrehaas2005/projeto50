import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

const _horizons = [GoalHorizon.curto, GoalHorizon.medio, GoalHorizon.longo];
const _horizonLabels = {
  GoalHorizon.curto: 'Curto',
  GoalHorizon.medio: 'Médio',
  GoalHorizon.longo: 'Longo',
};
const _categoryLabels = {
  GoalCategory.peso: 'Peso',
  GoalCategory.cintura: 'Cintura',
  GoalCategory.forca: 'Força',
  GoalCategory.cardio: 'Cardio',
  GoalCategory.habito: 'Hábito',
  GoalCategory.outro: 'Outro',
};

class GoalsScreen extends ConsumerWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(goalsProvider);
    final measurementsAsync = ref.watch(measurementsProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Metas'),
          bottom: TabBar(
            tabs: [for (final h in _horizons) Tab(text: _horizonLabels[h])],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _openNewGoalSheet(context, ref),
          icon: const Icon(Icons.add),
          label: const Text('Nova meta'),
        ),
        body: goalsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Erro: $e')),
          data: (goals) {
            final latest = measurementsAsync.valueOrNull?.lastOrNull;
            return TabBarView(
              children: [
                for (final h in _horizons)
                  _GoalList(
                    goals: goals.where((g) => g.horizon == h).toList(),
                    latest: latest,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _openNewGoalSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const _NewGoalSheet(),
    );
  }
}

class _GoalList extends ConsumerWidget {
  final List<Goal> goals;
  final BodyMeasurement? latest;
  const _GoalList({required this.goals, required this.latest});

  double? _currentValue(Goal g) {
    if (latest == null) return null;
    switch (g.category) {
      case GoalCategory.peso:
        return latest!.weight;
      case GoalCategory.cintura:
        return latest!.waist;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    if (goals.isEmpty) {
      return Center(
        child: Text('Nenhuma meta neste horizonte ainda.',
            style: GoogleFonts.montserrat(color: c.textMuted)),
      );
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
      children: [
        for (final g in goals) _GoalCard(goal: g, currentValue: _currentValue(g)),
      ],
    );
  }
}

class _GoalCard extends ConsumerWidget {
  final Goal goal;
  final double? currentValue;
  const _GoalCard({required this.goal, required this.currentValue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final start = goal.startValue;
    final target = goal.targetValue;
    double? pct;
    String? progressLabel;
    if (start != null && target != null && currentValue != null && start != target) {
      pct = ((currentValue! - start) / (target - start)).clamp(0, 1);
      progressLabel =
          '${currentValue!.toStringAsFixed(1)} → alvo ${target.toStringAsFixed(1)}';
    } else if (goal.status == GoalStatus.concluida) {
      pct = 1;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(goal.name,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 14, color: c.text)),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_horiz, color: c.textFaint, size: 20),
                  onSelected: (v) async {
                    final db = ref.read(databaseProvider);
                    if (v == 'done') {
                      await db.setGoalStatus(goal.id, GoalStatus.concluida);
                    } else if (v == 'delete') {
                      await db.deleteGoal(goal.id);
                    }
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'done', child: Text('Marcar concluída')),
                    PopupMenuItem(value: 'delete', child: Text('Excluir')),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ConfidencePill(_categoryLabels[goal.category] ?? goal.category, c.accent),
                if (goal.status == GoalStatus.concluida) ...[
                  const SizedBox(width: 6),
                  ConfidencePill('concluída', c.good),
                ],
                const Spacer(),
                if (goal.deadline != null)
                  Text(DateFormat('dd/MM/yyyy').format(goal.deadline!),
                      style: GoogleFonts.ibmPlexMono(fontSize: 10.5, color: c.textFaint)),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: pct,
                minHeight: 6,
                backgroundColor: c.surface2,
                valueColor: AlwaysStoppedAnimation(
                    goal.status == GoalStatus.concluida ? c.good : c.accent),
              ),
            ),
            if (progressLabel != null) ...[
              const SizedBox(height: 6),
              Text(progressLabel,
                  style: GoogleFonts.ibmPlexMono(fontSize: 10.5, color: c.textMuted)),
            ] else if (start != null && target != null) ...[
              const SizedBox(height: 6),
              Text('${start.toStringAsFixed(1)} → ${target.toStringAsFixed(1)}',
                  style: GoogleFonts.ibmPlexMono(fontSize: 10.5, color: c.textFaint)),
            ],
          ],
        ),
      ),
    );
  }
}

class _NewGoalSheet extends ConsumerStatefulWidget {
  const _NewGoalSheet();

  @override
  ConsumerState<_NewGoalSheet> createState() => _NewGoalSheetState();
}

class _NewGoalSheetState extends ConsumerState<_NewGoalSheet> {
  final _nameCtrl = TextEditingController();
  final _startCtrl = TextEditingController();
  final _targetCtrl = TextEditingController();
  String _category = GoalCategory.peso;
  String _horizon = GoalHorizon.curto;
  DateTime? _deadline;
  bool _saving = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _startCtrl.dispose();
    _targetCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_nameCtrl.text.trim().isEmpty) return;
    setState(() => _saving = true);
    final db = ref.read(databaseProvider);
    await db.addGoal(GoalsCompanion.insert(
      name: _nameCtrl.text.trim(),
      category: _category,
      horizon: _horizon,
      startValue: Value(double.tryParse(_startCtrl.text.trim().replaceAll(',', '.'))),
      targetValue: Value(double.tryParse(_targetCtrl.text.trim().replaceAll(',', '.'))),
      deadline: Value(_deadline),
    ));
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 4, 20, MediaQuery.of(context).viewInsets.bottom + 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nova meta', style: AppTheme.display(c.text).copyWith(fontSize: 22)),
            const SizedBox(height: 14),
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _category,
                    decoration: const InputDecoration(labelText: 'Categoria'),
                    items: [
                      for (final e in _categoryLabels.entries)
                        DropdownMenuItem(value: e.key, child: Text(e.value)),
                    ],
                    onChanged: (v) => setState(() => _category = v!),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _horizon,
                    decoration: const InputDecoration(labelText: 'Horizonte'),
                    items: [
                      for (final e in _horizonLabels.entries)
                        DropdownMenuItem(value: e.key, child: Text(e.value)),
                    ],
                    onChanged: (v) => setState(() => _horizon = v!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _startCtrl,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'Valor inicial'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _targetCtrl,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'Valor desejado'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 30)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2035),
                );
                if (picked != null) setState(() => _deadline = picked);
              },
              child: AppCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MonoLabel('Prazo'),
                    Text(_deadline == null ? 'escolher data' : DateFormat('dd/MM/yyyy').format(_deadline!),
                        style: GoogleFonts.ibmPlexMono(color: c.text)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saving ? null : _save,
                child: Text(_saving ? 'Salvando…' : 'Criar meta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
