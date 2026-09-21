import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class CheckinScreen extends ConsumerStatefulWidget {
  const CheckinScreen({super.key});

  @override
  ConsumerState<CheckinScreen> createState() => _CheckinScreenState();
}

class _CheckinScreenState extends ConsumerState<CheckinScreen> {
  double _sleep = 7, _energy = 6, _pain = 2, _mood = 7, _nutrition = 6;
  bool _strength = false, _cardio = false;
  final _weightCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  bool _loaded = false;
  String? _existingId;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadToday);
  }

  Future<void> _loadToday() async {
    final db = ref.read(databaseProvider);
    final today = await db.checkinForDate(DateTime.now());
    if (today != null && mounted) {
      setState(() {
        _existingId = today.id;
        _sleep = (today.sleep ?? 7).toDouble();
        _energy = (today.energy ?? 6).toDouble();
        _pain = (today.pain ?? 2).toDouble();
        _mood = (today.mood ?? 7).toDouble();
        _nutrition = (today.nutrition ?? 6).toDouble();
        _strength = today.trainedStrength;
        _cardio = today.trainedCardio;
        _weightCtrl.text = today.weight?.toString() ?? '';
        _notesCtrl.text = today.notes ?? '';
      });
    }
    setState(() => _loaded = true);
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final db = ref.read(databaseProvider);
    final w = double.tryParse(_weightCtrl.text.trim().replaceAll(',', '.'));
    await db.upsertCheckin(
      DailyCheckinsCompanion.insert(
        date: DateTime.now(),
        weight: Value(w),
        sleep: Value(_sleep.round()),
        energy: Value(_energy.round()),
        pain: Value(_pain.round()),
        mood: Value(_mood.round()),
        trainedStrength: Value(_strength),
        trainedCardio: Value(_cardio),
        nutrition: Value(_nutrition.round()),
        notes: Value(_notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim()),
      ),
      existingId: _existingId,
    );
    if (!mounted) return;
    setState(() => _saving = false);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Check-in registrado. Menos de 60s — como deve ser.')),
    );
  }

  @override
  void dispose() {
    _weightCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    if (!_loaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Como você está hoje?')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
        children: [
          Text('Menos de 60 segundos.',
              style: GoogleFonts.ibmPlexMono(fontSize: 11, color: c.textFaint)),
          const SizedBox(height: 16),
          TextField(
            controller: _weightCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Peso (kg) — opcional'),
          ),
          const SizedBox(height: 18),
          _SliderField(label: 'Sono', value: _sleep, onChanged: (v) => setState(() => _sleep = v)),
          _SliderField(label: 'Energia', value: _energy, onChanged: (v) => setState(() => _energy = v)),
          _SliderField(label: 'Dor', value: _pain, onChanged: (v) => setState(() => _pain = v)),
          _SliderField(label: 'Humor', value: _mood, onChanged: (v) => setState(() => _mood = v)),
          _SliderField(label: 'Alimentação', value: _nutrition, onChanged: (v) => setState(() => _nutrition = v)),
          const SizedBox(height: 8),
          AppCard(
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Treino de força hoje'),
                  value: _strength,
                  onChanged: (v) => setState(() => _strength = v),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Cardio hoje'),
                  value: _cardio,
                  onChanged: (v) => setState(() => _cardio = v),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _notesCtrl,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Observação (opcional)'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saving ? null : _save,
              child: Text(_saving ? 'Salvando…' : 'Registrar dia'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliderField extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;
  const _SliderField({required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
              width: 84,
              child: Text(label, style: GoogleFonts.montserrat(fontSize: 13, color: c.text))),
          Expanded(
            child: Slider(
              value: value,
              min: 0,
              max: 10,
              divisions: 10,
              activeColor: c.accent,
              onChanged: onChanged,
            ),
          ),
          SizedBox(
            width: 34,
            child: Text('${value.round()}/10',
                textAlign: TextAlign.right,
                style: GoogleFonts.ibmPlexMono(fontSize: 11, color: c.textMuted)),
          ),
        ],
      ),
    );
  }
}
