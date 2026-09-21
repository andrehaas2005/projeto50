import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// Garante que o seed (baseline + Treino 1/2/3) rodou antes de qualquer tela
/// tentar ler dados.
final seedProvider = FutureProvider<void>((ref) async {
  final db = ref.watch(databaseProvider);
  await db.seedIfEmpty();
});

final measurementsProvider =
    StreamProvider<List<BodyMeasurement>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchMeasurements();
});

final checkinsProvider = StreamProvider<List<DailyCheckin>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchCheckins();
});

final templatesProvider = StreamProvider<List<WorkoutTemplate>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchTemplates();
});

final templateExercisesProvider =
    StreamProvider.family<List<WorkoutTemplateExercise>, String>(
        (ref, templateId) {
  final db = ref.watch(databaseProvider);
  return db.watchTemplateExercises(templateId);
});

final goalsProvider = StreamProvider<List<Goal>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchGoals();
});

final photoCheckpointsProvider = StreamProvider<List<PhotoCheckpoint>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchPhotoCheckpoints();
});
