import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

/// Uma região do corpo — algumas têm par direito/esquerdo (ver seção 10 da
/// especificação: assimetrias), outras um valor só.
class _Region {
  final String label;
  final Offset position; // fração 0..1 sobre a silhueta
  final double Function(BodyMeasurement) right;
  final double Function(BodyMeasurement)? left;
  const _Region(this.label, this.position, this.right, {this.left});
}

final _regions = <_Region>[
  _Region('Pescoço', const Offset(0.5, 0.16), (m) => m.neck ?? 0),
  _Region('Tórax', const Offset(0.5, 0.30), (m) => m.chest ?? 0),
  _Region('Cintura', const Offset(0.5, 0.42), (m) => m.waist ?? 0),
  _Region('Quadril', const Offset(0.5, 0.50), (m) => m.hip ?? 0),
  _Region('Braços', const Offset(0.18, 0.32), (m) => m.armRight ?? 0,
      left: (m) => m.armLeft ?? 0),
  _Region('Coxas', const Offset(0.38, 0.68), (m) => m.thighRight ?? 0,
      left: (m) => m.thighLeft ?? 0),
  _Region('Panturrilhas', const Offset(0.38, 0.90), (m) => m.calfRight ?? 0,
      left: (m) => m.calfLeft ?? 0),
];

class BodyScreen extends ConsumerWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(measurementsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Meu corpo')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text('Registre um checkpoint para ver seu corpo.'));
          }
          return _BodyBody(list: list);
        },
      ),
    );
  }
}

class _BodyBody extends StatelessWidget {
  final List<BodyMeasurement> list;
  const _BodyBody({required this.list});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final baseline = list.first;
    final latest = list.last;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        Text('Toque numa região',
            style: GoogleFonts.ibmPlexMono(fontSize: 11, color: c.textFaint)),
        const SizedBox(height: 14),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 260, maxHeight: 420),
            child: AspectRatio(
              aspectRatio: 0.62,
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(painter: _SilhouettePainter(color: c.surface2, border: c.border)),
                    ),
                    for (final region in _regions)
                      Positioned(
                        left: constraints.maxWidth * region.position.dx - 11,
                        top: constraints.maxHeight * region.position.dy - 11,
                        child: _RegionDot(
                          onTap: () => _openDetail(context, region, baseline, latest, list),
                        ),
                      ),
                  ],
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final region in _regions)
              ActionChip(
                label: Text(region.label),
                labelStyle: GoogleFonts.montserrat(fontSize: 12, color: c.text),
                backgroundColor: c.surface2,
                side: BorderSide(color: c.border),
                onPressed: () => _openDetail(context, region, baseline, latest, list),
              ),
          ],
        ),
      ],
    );
  }

  void _openDetail(BuildContext context, _Region region, BodyMeasurement baseline,
      BodyMeasurement latest, List<BodyMeasurement> history) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) => _RegionDetailSheet(region: region, baseline: baseline, latest: latest, history: history),
    );
  }
}

class _RegionDot extends StatelessWidget {
  final VoidCallback onTap;
  const _RegionDot({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: c.accent,
          shape: BoxShape.circle,
          border: Border.all(color: c.bg, width: 2),
          boxShadow: [BoxShadow(color: c.accent.withValues(alpha: 0.5), blurRadius: 6)],
        ),
      ),
    );
  }
}

class _SilhouettePainter extends CustomPainter {
  final Color color;
  final Color border;
  const _SilhouettePainter({required this.color, required this.border});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final fill = Paint()..color = color;
    final stroke = Paint()
      ..color = border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Cabeça
    final head = Offset(w * 0.5, h * 0.08);
    canvas.drawCircle(head, w * 0.11, fill);
    canvas.drawCircle(head, w * 0.11, stroke);

    // Tronco
    final torso = Path()
      ..moveTo(w * 0.32, h * 0.18)
      ..quadraticBezierTo(w * 0.5, h * 0.14, w * 0.68, h * 0.18)
      ..lineTo(w * 0.74, h * 0.50)
      ..quadraticBezierTo(w * 0.5, h * 0.58, w * 0.26, h * 0.50)
      ..close();
    canvas.drawPath(torso, fill);
    canvas.drawPath(torso, stroke);

    // Braços
    final armPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.09
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(w * 0.28, h * 0.21), Offset(w * 0.16, h * 0.48), armPaint);
    canvas.drawLine(Offset(w * 0.72, h * 0.21), Offset(w * 0.84, h * 0.48), armPaint);
    final armStroke = Paint()
      ..color = border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawLine(Offset(w * 0.28, h * 0.21), Offset(w * 0.16, h * 0.48), armStroke);
    canvas.drawLine(Offset(w * 0.72, h * 0.21), Offset(w * 0.84, h * 0.48), armStroke);

    // Pernas
    final legPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.13
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(w * 0.40, h * 0.56), Offset(w * 0.38, h * 0.96), legPaint);
    canvas.drawLine(Offset(w * 0.60, h * 0.56), Offset(w * 0.62, h * 0.96), legPaint);
    canvas.drawLine(Offset(w * 0.40, h * 0.56), Offset(w * 0.38, h * 0.96), armStroke);
    canvas.drawLine(Offset(w * 0.60, h * 0.56), Offset(w * 0.62, h * 0.96), armStroke);
  }

  @override
  bool shouldRepaint(covariant _SilhouettePainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.border != border;
}

class _RegionDetailSheet extends StatelessWidget {
  final _Region region;
  final BodyMeasurement baseline;
  final BodyMeasurement latest;
  final List<BodyMeasurement> history;
  const _RegionDetailSheet({
    required this.region,
    required this.baseline,
    required this.latest,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final currentR = region.right(latest);
    final baselineR = region.right(baseline);
    final hasLeft = region.left != null;
    final currentL = hasLeft ? region.left!(latest) : null;
    final baselineL = hasLeft ? region.left!(baseline) : null;

    final points = history.map((m) => region.right(m)).where((v) => v > 0).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(region.label, style: AppTheme.display(c.text).copyWith(fontSize: 24)),
          Text('Última medição · ${latest.date.day.toString().padLeft(2, '0')}/'
              '${latest.date.month.toString().padLeft(2, '0')}/${latest.date.year}',
              style: GoogleFonts.ibmPlexMono(fontSize: 11, color: c.textFaint)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _ValueBlock(
                  label: hasLeft ? 'Direito · atual' : 'Atual',
                  value: currentR,
                  color: c.accent,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ValueBlock(
                  label: hasLeft ? 'Direito · baseline' : 'Baseline',
                  value: baselineR,
                  color: c.textMuted,
                ),
              ),
            ],
          ),
          if (hasLeft) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _ValueBlock(label: 'Esquerdo · atual', value: currentL!, color: c.accent),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ValueBlock(label: 'Esquerdo · baseline', value: baselineL!, color: c.textMuted),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: c.surface2, borderRadius: BorderRadius.circular(8)),
              child: Text(
                'Diferença entre lados: ${(currentR - currentL).abs().toStringAsFixed(1)} cm',
                style: GoogleFonts.montserrat(fontSize: 12, color: c.textMuted),
              ),
            ),
          ],
          const SizedBox(height: 16),
          if (points.length > 1) ...[
            Text('HISTÓRICO', style: GoogleFonts.ibmPlexMono(fontSize: 10, letterSpacing: 1, color: c.textFaint)),
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              child: CustomPaint(
                size: const Size(double.infinity, 48),
                painter: _SparklinePainter(points: points, color: c.accent),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ValueBlock extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  const _ValueBlock({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: c.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MonoLabel(label),
          const SizedBox(height: 4),
          Text('${value.toStringAsFixed(1)} cm',
              style: AppTheme.display(color).copyWith(fontSize: 18)),
        ],
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> points;
  final Color color;
  const _SparklinePainter({required this.points, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;
    final minV = points.reduce((a, b) => a < b ? a : b);
    final maxV = points.reduce((a, b) => a > b ? a : b);
    final range = (maxV - minV).abs() < 0.01 ? 1 : (maxV - minV);
    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final x = size.width * i / (points.length - 1);
      final y = size.height - ((points[i] - minV) / range) * size.height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) => oldDelegate.points != points;
}
