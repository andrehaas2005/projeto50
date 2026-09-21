import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Container padrão de seção — mesmo tratamento de .card no doc web.
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  const AppCard(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(16)});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.border),
      ),
      child: child,
    );
  }
}

/// Rótulo mono, uppercase, letter-spacing — usado como "wlabel"/eyebrow.
class MonoLabel extends StatelessWidget {
  final String text;
  final Color? color;
  const MonoLabel(this.text, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.ibmPlexMono(
        fontSize: 10.5,
        letterSpacing: 1.0,
        color: color ?? c.textFaint,
      ),
    );
  }
}

/// Card de métrica grande (peso atual, cintura...) — espelha CARD 1/2 do
/// dashboard na especificação original.
class MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String? unit;
  final String? delta;
  final Color? deltaColor;
  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    this.unit,
    this.delta,
    this.deltaColor,
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
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: AppTheme.display(c.text).copyWith(fontSize: 34)),
              if (unit != null) ...[
                const SizedBox(width: 4),
                Text(unit!,
                    style: GoogleFonts.montserrat(
                        color: c.textFaint, fontSize: 13)),
              ],
            ],
          ),
          if (delta != null) ...[
            const SizedBox(height: 4),
            Text(delta!,
                style: GoogleFonts.ibmPlexMono(
                    fontSize: 11.5, color: deltaColor ?? c.textMuted)),
          ],
        ],
      ),
    );
  }
}

/// Pill de status (medido/calculado/estimado...) — Motor de Confiança.
class ConfidencePill extends StatelessWidget {
  final String text;
  final Color color;
  const ConfidencePill(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.ibmPlexMono(
            fontSize: 9.5, letterSpacing: .6, color: color),
      ),
    );
  }
}

/// Ícone simples de categoria de exercício (haltere / corrida) — mesmo par
/// usado no wireframe (seção 02.1), sem depender de imagem real.
class ExerciseCategoryIcon extends StatelessWidget {
  final String category; // 'strength' | 'cardio'
  const ExerciseCategoryIcon(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: c.surface2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.border),
      ),
      child: Icon(
        category == 'cardio'
            ? Icons.directions_run_rounded
            : Icons.fitness_center_rounded,
        size: 17,
        color: c.textFaint,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const SectionTitle(this.title, {super.key, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(),
            style: AppTheme.display(c.text).copyWith(fontSize: 20)),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(subtitle!,
              style: GoogleFonts.montserrat(color: c.textMuted, fontSize: 12.5)),
        ],
      ],
    );
  }
}
