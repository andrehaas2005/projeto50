import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';
import 'measurements_form_screen.dart';

class WeightScreen extends ConsumerWidget {
  const WeightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(measurementsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Peso')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const MeasurementsFormScreen())),
        icon: const Icon(Icons.add),
        label: const Text('Checkpoint'),
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
        data: (list) {
          final withWeight =
              list.where((m) => m.weight != null).toList(growable: false);
          if (withWeight.isEmpty) {
            return const Center(child: Text('Nenhum peso registrado ainda.'));
          }
          return _WeightBody(list: withWeight);
        },
      ),
    );
  }
}

class _WeightBody extends StatelessWidget {
  final List<BodyMeasurement> list;
  const _WeightBody({required this.list});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final weights = list.map((m) => m.weight!).toList();
    final initial = weights.first;
    final current = weights.last;
    final lowest = weights.reduce((a, b) => a < b ? a : b);
    final avg7 = weights.length <= 7
        ? weights.reduce((a, b) => a + b) / weights.length
        : weights.sublist(weights.length - 7).reduce((a, b) => a + b) / 7;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 96),
      children: [
        AppCard(
          padding: const EdgeInsets.fromLTRB(12, 16, 16, 8),
          child: SizedBox(
            height: 190,
            child: weights.length < 2
                ? Center(
                    child: Text('Registre mais um checkpoint para ver a tendência.',
                        style: GoogleFonts.montserrat(color: c.textMuted)))
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 2,
                        getDrawingHorizontalLine: (_) =>
                            FlLine(color: c.border, strokeWidth: 1),
                      ),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 34,
                            getTitlesWidget: (v, _) => Text(v.toStringAsFixed(0),
                                style: GoogleFonts.ibmPlexMono(fontSize: 9.5, color: c.textFaint)),
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            for (var i = 0; i < weights.length; i++)
                              FlSpot(i.toDouble(), weights[i]),
                          ],
                          isCurved: true,
                          color: c.accent,
                          barWidth: 2.5,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: c.accent.withValues(alpha: 0.12),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 14),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.4,
          children: [
            MetricCard(label: 'Inicial', value: initial.toStringAsFixed(1), unit: 'kg'),
            MetricCard(label: 'Atual', value: current.toStringAsFixed(1), unit: 'kg'),
            MetricCard(label: 'Menor', value: lowest.toStringAsFixed(1), unit: 'kg'),
            MetricCard(label: 'Média 7d', value: avg7.toStringAsFixed(1), unit: 'kg'),
          ],
        ),
        const SizedBox(height: 14),
        AppCard(
          child: Text(
            'O peso diário pode variar por água, glicogênio e conteúdo intestinal. '
            'A tendência — não uma medição isolada — é o que importa.',
            style: GoogleFonts.montserrat(fontSize: 12.5, color: context.colors.textMuted),
          ),
        ),
        const SizedBox(height: 14),
        Text('HISTÓRICO',
            style: GoogleFonts.ibmPlexMono(fontSize: 10.5, letterSpacing: 1, color: c.textFaint)),
        const SizedBox(height: 8),
        ...list.reversed.map((m) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppCard(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${m.date.day.toString().padLeft(2, '0')}/'
                        '${m.date.month.toString().padLeft(2, '0')}/${m.date.year}',
                        style: GoogleFonts.ibmPlexMono(fontSize: 12, color: c.textMuted)),
                    Text('${m.weight?.toStringAsFixed(1)} kg',
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: c.text)),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
