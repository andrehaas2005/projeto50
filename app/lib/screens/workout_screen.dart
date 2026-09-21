import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';
import 'exercise_execution_screen.dart';

class WorkoutScreen extends ConsumerWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(templatesProvider);
    return templatesAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Erro: $e'))),
      data: (templates) {
        if (templates.isEmpty) {
          return const Scaffold(body: Center(child: Text('Nenhum protocolo cadastrado.')));
        }
        return DefaultTabController(
          length: templates.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Treinamento'),
              bottom: TabBar(
                isScrollable: true,
                tabs: [for (final t in templates) Tab(text: t.name)],
              ),
            ),
            body: TabBarView(
              children: [
                for (final t in templates) _TemplateExerciseList(template: t),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TemplateExerciseList extends ConsumerWidget {
  final WorkoutTemplate template;
  const _TemplateExerciseList({required this.template});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final exercisesAsync = ref.watch(templateExercisesProvider(template.id));
    return exercisesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erro: $e')),
      data: (exercises) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: c.accentSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(template.name.toUpperCase(),
                          style: AppTheme.display(c.text).copyWith(fontSize: 20)),
                      Text(template.focus,
                          style: GoogleFonts.ibmPlexMono(
                              fontSize: 10.5, color: c.accent, letterSpacing: .5)),
                    ],
                  ),
                ),
                Text('${exercises.length} estações',
                    style: GoogleFonts.ibmPlexMono(fontSize: 11, color: c.textMuted)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                for (var i = 0; i < exercises.length; i++)
                  _ExerciseRow(
                    index: i + 1,
                    exercise: exercises[i],
                    isLast: i == exercises.length - 1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExerciseRow extends StatelessWidget {
  final int index;
  final WorkoutTemplateExercise exercise;
  final bool isLast;
  const _ExerciseRow({required this.index, required this.exercise, required this.isLast});

  String get _meta {
    if (exercise.metricType == MetricType.time) {
      final seconds = exercise.targetSeconds ?? 0;
      if (seconds >= 60) return '${(seconds / 60).round()} min';
      return exercise.targetSets != null
          ? '${exercise.targetSets}×${seconds}s'
          : '${seconds}s';
    }
    return '${exercise.targetSets}×${exercise.targetReps}';
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ExerciseExecutionScreen(
          exercise: exercise,
          templateId: exercise.templateId,
          stationIndex: index,
        ),
      )),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          border: isLast ? null : Border(bottom: BorderSide(color: c.surface3)),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: c.surface2,
                shape: BoxShape.circle,
                border: Border.all(color: c.border),
              ),
              child: Text('$index',
                  style: GoogleFonts.ibmPlexMono(fontSize: 10, color: c.textMuted)),
            ),
            const SizedBox(width: 10),
            ExerciseCategoryIcon(exercise.category),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.exercise,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 13, color: c.text)),
                  Text(exercise.cue,
                      style: GoogleFonts.montserrat(fontSize: 11, color: c.textFaint)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(_meta,
                    style: GoogleFonts.ibmPlexMono(fontSize: 11, color: c.textMuted)),
                if (exercise.restSeconds > 0)
                  Text('${exercise.restSeconds}s desc.',
                      style: GoogleFonts.ibmPlexMono(fontSize: 9.5, color: c.textFaint)),
              ],
            ),
            const SizedBox(width: 4),
            Icon(Icons.chevron_right_rounded, color: c.textFaint, size: 20),
          ],
        ),
      ),
    );
  }
}
