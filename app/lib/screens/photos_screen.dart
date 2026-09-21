import 'dart:typed_data';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../data/database.dart';
import '../data/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class PhotosScreen extends ConsumerWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(photoCheckpointsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Evolução visual')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const _NewCheckpointScreen())),
        icon: const Icon(Icons.add_a_photo_outlined),
        label: const Text('Novo checkpoint'),
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
        data: (list) => _PhotosBody(list: list),
      ),
    );
  }
}

class _PhotosBody extends StatelessWidget {
  final List<PhotoCheckpoint> list;
  const _PhotosBody({required this.list});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final withFront = list.where((p) => p.front != null).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
      children: [
        AppCard(
          child: Row(
            children: [
              Icon(Icons.lock_outline_rounded, size: 16, color: c.textFaint),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Privado — sem reconhecimento facial, sem envio automático a servidores.',
                  style: GoogleFonts.montserrat(fontSize: 11.5, color: c.textMuted),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (withFront.length >= 2) ...[
          Text('BASELINE × ATUAL',
              style: GoogleFonts.ibmPlexMono(fontSize: 10.5, letterSpacing: 1, color: c.textFaint)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _PhotoTile(bytes: withFront.first.front, label: 'baseline')),
              const SizedBox(width: 10),
              Expanded(child: _PhotoTile(bytes: withFront.last.front, label: 'atual')),
            ],
          ),
          const SizedBox(height: 20),
        ],
        Text('CHECKPOINTS',
            style: GoogleFonts.ibmPlexMono(fontSize: 10.5, letterSpacing: 1, color: c.textFaint)),
        const SizedBox(height: 8),
        if (list.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text('Nenhuma foto registrada ainda.',
                  style: GoogleFonts.montserrat(color: c.textMuted)),
            ),
          )
        else
          for (final p in list.reversed) _CheckpointRow(checkpoint: p),
      ],
    );
  }
}

class _CheckpointRow extends StatelessWidget {
  final PhotoCheckpoint checkpoint;
  const _CheckpointRow({required this.checkpoint});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('dd/MM/yyyy').format(checkpoint.date),
                style: GoogleFonts.ibmPlexMono(fontSize: 11, color: c.textMuted)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _PhotoTile(bytes: checkpoint.front, label: 'frente')),
                const SizedBox(width: 8),
                Expanded(child: _PhotoTile(bytes: checkpoint.side, label: 'lado')),
                const SizedBox(width: 8),
                Expanded(child: _PhotoTile(bytes: checkpoint.back, label: 'costas')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoTile extends StatelessWidget {
  final Uint8List? bytes;
  final String label;
  const _PhotoTile({required this.bytes, required this.label});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: c.surface2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: c.border),
          image: bytes != null
              ? DecorationImage(image: MemoryImage(bytes!), fit: BoxFit.cover)
              : null,
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(4),
        child: bytes == null
            ? Icon(Icons.person_outline_rounded, color: c.textFaint, size: 22)
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: c.surface.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(label,
                    style: GoogleFonts.ibmPlexMono(fontSize: 8.5, color: c.textMuted)),
              ),
      ),
    );
  }
}

class _NewCheckpointScreen extends ConsumerStatefulWidget {
  const _NewCheckpointScreen();

  @override
  ConsumerState<_NewCheckpointScreen> createState() => _NewCheckpointScreenState();
}

class _NewCheckpointScreenState extends ConsumerState<_NewCheckpointScreen> {
  Uint8List? _front, _side, _back;
  bool _saving = false;
  final _picker = ImagePicker();

  Future<void> _pick(String slot) async {
    final file = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (file == null) return;
    final bytes = await file.readAsBytes();
    setState(() {
      switch (slot) {
        case 'front':
          _front = bytes;
        case 'side':
          _side = bytes;
        case 'back':
          _back = bytes;
      }
    });
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final db = ref.read(databaseProvider);
    await db.addPhotoCheckpoint(PhotoCheckpointsCompanion.insert(
      date: DateTime.now(),
      front: Value(_front),
      side: Value(_side),
      back: Value(_back),
    ));
    if (!mounted) return;
    setState(() => _saving = false);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final hasAny = _front != null || _side != null || _back != null;
    return Scaffold(
      appBar: AppBar(title: const Text('Novo checkpoint')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
        children: [
          Text(
            'Mesma distância, enquadramento e iluminação sempre que possível — '
            'isso é o que torna a comparação confiável.',
            style: GoogleFonts.montserrat(fontSize: 12.5, color: c.textMuted),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _PickTile(label: 'Frente', bytes: _front, onTap: () => _pick('front'))),
              const SizedBox(width: 10),
              Expanded(child: _PickTile(label: 'Lado', bytes: _side, onTap: () => _pick('side'))),
              const SizedBox(width: 10),
              Expanded(child: _PickTile(label: 'Costas', bytes: _back, onTap: () => _pick('back'))),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (!hasAny || _saving) ? null : _save,
              child: Text(_saving ? 'Salvando…' : 'Salvar checkpoint'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PickTile extends StatelessWidget {
  final String label;
  final Uint8List? bytes;
  final VoidCallback onTap;
  const _PickTile({required this.label, required this.bytes, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Container(
          decoration: BoxDecoration(
            color: c.surface2,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: c.border),
            image: bytes != null
                ? DecorationImage(image: MemoryImage(bytes!), fit: BoxFit.cover)
                : null,
          ),
          alignment: Alignment.center,
          child: bytes == null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_a_photo_outlined, color: c.textFaint, size: 20),
                    const SizedBox(height: 6),
                    Text(label, style: GoogleFonts.ibmPlexMono(fontSize: 10, color: c.textFaint)),
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
