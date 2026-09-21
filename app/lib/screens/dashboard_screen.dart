import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';
import 'checkin_screen.dart';
import 'measurements_form_screen.dart';

final _projectStart = DateTime(2026, 9, 5);
final _projectMilestone = DateTime(2027, 2, 5);

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final measurementsAsync = ref.watch(measurementsProvider);
    final checkinsAsync = ref.watch(checkinsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROJETO 50'),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
          children: [
            Text('Engenharia da melhor versão de mim',
                style: GoogleFonts.ibmPlexMono(
                    fontSize: 11.5, color: c.textFaint, letterSpacing: .4)),
            const SizedBox(height: 18),
            measurementsAsync.when(
              data: (list) => _WeightWaistRow(list: list),
              loading: () => const _CardsSkeleton(),
              error: (e, _) => Text('Erro: $e'),
            ),
            const SizedBox(height: 12),
            const _MilestoneCard(),
            const SizedBox(height: 12),
            checkinsAsync.when(
              data: (list) => _TodayCard(checkins: list),
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CheckinScreen())),
                    icon: const Icon(Icons.bolt_rounded, size: 18),
                    label: const Text('Check-in de hoje'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: c.border),
                      foregroundColor: c.text,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const MeasurementsFormScreen())),
                    icon: const Icon(Icons.straighten_rounded, size: 18),
                    label: const Text('Novo checkpoint'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: c.border),
                      foregroundColor: c.text,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CardsSkeleton extends StatelessWidget {
  const _CardsSkeleton();
  @override
  Widget build(BuildContext context) => Row(children: const [
        Expanded(child: SizedBox(height: 96)),
      ]);
}

class _WeightWaistRow extends StatelessWidget {
  final List<BodyMeasurement> list;
  const _WeightWaistRow({required this.list});

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return const AppCard(child: Text('Sem medidas registradas ainda.'));
    }
    final baseline = list.first;
    final latest = list.last;
    final weightDelta = (latest.weight ?? 0) - (baseline.weight ?? 0);
    final waistDelta = (latest.waist ?? 0) - (baseline.waist ?? 0);
    final c = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MetricCard(
            label: 'Peso atual',
            value: latest.weight?.toStringAsFixed(1) ?? '—',
            unit: 'kg',
            delta: list.length > 1
                ? '${weightDelta <= 0 ? '' : '+'}${weightDelta.toStringAsFixed(1)} kg desde início'
                : 'baseline registrada',
            deltaColor: weightDelta < 0 ? c.good : c.textMuted,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: MetricCard(
            label: 'Cintura',
            value: latest.waist?.toStringAsFixed(0) ?? '—',
            unit: 'cm',
            delta: list.length > 1
                ? '${waistDelta <= 0 ? '' : '+'}${waistDelta.toStringAsFixed(1)} cm desde início'
                : 'baseline registrada',
            deltaColor: waistDelta < 0 ? c.good : c.textMuted,
          ),
        ),
      ],
    );
  }
}

class _MilestoneCard extends StatelessWidget {
  const _MilestoneCard();

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final now = DateTime.now();
    final totalDays = _projectMilestone.difference(_projectStart).inDays;
    final elapsed = now.difference(_projectStart).inDays.clamp(0, totalDays);
    final remaining = _projectMilestone.difference(now).inDays;
    final pct = totalDays == 0 ? 0.0 : elapsed / totalDays;
    final fmt = DateFormat("dd 'de' MMMM 'de' yyyy", 'pt_BR');

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MonoLabel('Próximo marco'),
              Text(remaining > 0 ? '$remaining dias restantes' : 'marco atingido',
                  style: GoogleFonts.ibmPlexMono(
                      fontSize: 11, color: c.accent)),
            ],
          ),
          const SizedBox(height: 6),
          Text(fmt.format(_projectMilestone),
              style: AppTheme.display(c.text).copyWith(fontSize: 22)),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: pct.clamp(0, 1),
              minHeight: 6,
              backgroundColor: c.surface2,
              valueColor: AlwaysStoppedAnimation(c.accent),
            ),
          ),
          const SizedBox(height: 6),
          Text('${(pct * 100).toStringAsFixed(0)}% do período concluído',
              style: GoogleFonts.montserrat(fontSize: 11.5, color: c.textFaint)),
        ],
      ),
    );
  }
}

class _TodayCard extends StatelessWidget {
  final List<DailyCheckin> checkins;
  const _TodayCard({required this.checkins});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final now = DateTime.now();
    DailyCheckin? today;
    for (final chk in checkins) {
      if (chk.date.year == now.year &&
          chk.date.month == now.month &&
          chk.date.day == now.day) {
        today = chk;
        break;
      }
    }

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MonoLabel('Hoje'),
          const SizedBox(height: 10),
          if (today == null)
            Text('Nenhum check-in registrado hoje.',
                style: GoogleFonts.montserrat(color: c.textMuted, fontSize: 13))
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MiniStat('Sono', today.sleep),
                _MiniStat('Energia', today.energy),
                _MiniStat('Dor', today.pain),
                _MiniStat('Humor', today.mood),
              ],
            ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final int? value;
  const _MiniStat(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      children: [
        Text(value != null ? '$value/10' : '—',
            style: AppTheme.display(c.text).copyWith(fontSize: 18)),
        Text(label,
            style: GoogleFonts.ibmPlexMono(fontSize: 9.5, color: c.textFaint)),
      ],
    );
  }
}
