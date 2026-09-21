import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class MeasurementsFormScreen extends ConsumerStatefulWidget {
  const MeasurementsFormScreen({super.key});

  @override
  ConsumerState<MeasurementsFormScreen> createState() =>
      _MeasurementsFormScreenState();
}

class _Field {
  final String label;
  final String key;
  final TextEditingController controller = TextEditingController();
  _Field(this.label, this.key);
}

class _MeasurementsFormScreenState
    extends ConsumerState<MeasurementsFormScreen> {
  DateTime _date = DateTime.now();
  late final List<_Field> _fields = [
    _Field('Peso (kg)', 'weight'),
    _Field('Pescoço (cm)', 'neck'),
    _Field('Tórax (cm)', 'chest'),
    _Field('Cintura (cm)', 'waist'),
    _Field('Quadril (cm)', 'hip'),
    _Field('Braço direito (cm)', 'armRight'),
    _Field('Braço esquerdo (cm)', 'armLeft'),
    _Field('Coxa direita (cm)', 'thighRight'),
    _Field('Coxa esquerda (cm)', 'thighLeft'),
    _Field('Panturrilha direita (cm)', 'calfRight'),
    _Field('Panturrilha esquerda (cm)', 'calfLeft'),
  ];
  bool _saving = false;

  double? _num(String key) {
    final f = _fields.firstWhere((f) => f.key == key);
    final raw = f.controller.text.trim().replaceAll(',', '.');
    return raw.isEmpty ? null : double.tryParse(raw);
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final db = ref.read(databaseProvider);
    await db.addMeasurement(BodyMeasurementsCompanion.insert(
      date: _date,
      weight: Value(_num('weight')),
      neck: Value(_num('neck')),
      chest: Value(_num('chest')),
      waist: Value(_num('waist')),
      hip: Value(_num('hip')),
      armRight: Value(_num('armRight')),
      armLeft: Value(_num('armLeft')),
      thighRight: Value(_num('thighRight')),
      thighLeft: Value(_num('thighLeft')),
      calfRight: Value(_num('calfRight')),
      calfLeft: Value(_num('calfLeft')),
      source: const Value(DataSource.medido),
    ));
    if (!mounted) return;
    setState(() => _saving = false);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Checkpoint corporal salvo.')),
    );
  }

  @override
  void dispose() {
    for (final f in _fields) {
      f.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar medidas')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
        children: [
          Text('Checkpoint corporal',
              style: GoogleFonts.montserrat(color: c.textMuted, fontSize: 13)),
          const SizedBox(height: 14),
          InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _date,
                firstDate: DateTime(2020),
                lastDate: DateTime(2035),
              );
              if (picked != null) setState(() => _date = picked);
            },
            child: AppCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MonoLabel('Data'),
                  Text(DateFormat('dd/MM/yyyy').format(_date),
                      style: GoogleFonts.ibmPlexMono(color: c.text)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ..._fields.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  controller: f.controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: f.label),
                ),
              )),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saving ? null : _save,
              child: Text(_saving ? 'Salvando…' : 'Salvar como checkpoint'),
            ),
          ),
        ],
      ),
    );
  }
}
