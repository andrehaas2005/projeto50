import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

const _uuid = Uuid();

/// Origem do dado — Motor de Confiança (ver arquitetura-projeto50.html, 01.3).
class DataSource {
  static const medido = 'medido';
  static const informado = 'informado';
  static const calculado = 'calculado';
}

class BodyMeasurements extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  DateTimeColumn get date => dateTime()();
  RealColumn get weight => real().nullable()();
  RealColumn get neck => real().nullable()();
  RealColumn get chest => real().nullable()();
  RealColumn get waist => real().nullable()();
  RealColumn get hip => real().nullable()();
  RealColumn get armRight => real().nullable()();
  RealColumn get armLeft => real().nullable()();
  RealColumn get thighRight => real().nullable()();
  RealColumn get thighLeft => real().nullable()();
  RealColumn get calfRight => real().nullable()();
  RealColumn get calfLeft => real().nullable()();
  TextColumn get source => text().withDefault(const Constant(DataSource.medido))();

  @override
  Set<Column> get primaryKey => {id};
}

class DailyCheckins extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  DateTimeColumn get date => dateTime()();
  RealColumn get weight => real().nullable()();
  IntColumn get sleep => integer().nullable()();
  IntColumn get energy => integer().nullable()();
  IntColumn get pain => integer().nullable()();
  IntColumn get mood => integer().nullable()();
  BoolColumn get trainedStrength =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get trainedCardio =>
      boolean().withDefault(const Constant(false))();
  IntColumn get nutrition => integer().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class WorkoutTemplates extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get name => text()();
  IntColumn get sortOrder => integer()();
  TextColumn get focus => text()();

  @override
  Set<Column> get primaryKey => {id};
}

/// strength = ícone de haltere · cardio = ícone de corrida (ver seção 02.1)
class ExerciseCategory {
  static const strength = 'strength';
  static const cardio = 'cardio';
}

/// reps = registra séries×reps · time = registra duração (ex.: prancha)
class MetricType {
  static const reps = 'reps';
  static const time = 'time';
}

class WorkoutTemplateExercises extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get templateId =>
      text().references(WorkoutTemplates, #id)();
  IntColumn get sortOrder => integer()();
  TextColumn get exercise => text()();
  TextColumn get cue => text()();
  TextColumn get category => text()();
  TextColumn get metricType => text().withDefault(const Constant(MetricType.reps))();
  IntColumn get targetSets => integer().nullable()();
  IntColumn get targetReps => integer().nullable()();
  IntColumn get targetSeconds => integer().nullable()();
  IntColumn get restSeconds => integer().withDefault(const Constant(50))();
  // Imagem/gif de execução — no MVP fica nulo (usa o ícone de categoria);
  // campo pronto para quando a biblioteca de mídia for adicionada.
  TextColumn get demoImagePath => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Workouts extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get templateId =>
      text().nullable().references(WorkoutTemplates, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class StrengthLogs extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get workoutId => text().references(Workouts, #id)();
  TextColumn get templateExerciseId =>
      text().nullable().references(WorkoutTemplateExercises, #id)();
  TextColumn get exercise => text()();
  RealColumn get weight => real().nullable()();
  IntColumn get reps => integer().nullable()();
  IntColumn get setNumber => integer().withDefault(const Constant(1))();
  IntColumn get rpe => integer().nullable()();
  DateTimeColumn get loggedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

/// curto (7–30d) · médio (1–6m) · longo (6–24m) — ver seção 22 da especificação.
class GoalHorizon {
  static const curto = 'curto';
  static const medio = 'medio';
  static const longo = 'longo';
}

class GoalCategory {
  static const peso = 'peso';
  static const cintura = 'cintura';
  static const forca = 'forca';
  static const cardio = 'cardio';
  static const habito = 'habito';
  static const outro = 'outro';
}

class GoalStatus {
  static const ativa = 'ativa';
  static const concluida = 'concluida';
  static const pausada = 'pausada';
}

class Goals extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get horizon => text()();
  RealColumn get startValue => real().nullable()();
  RealColumn get targetValue => real().nullable()();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant(GoalStatus.ativa))();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

/// Fotos ficam como blob local no próprio banco (sem upload — ver seção 13 e
/// 33 da especificação: nada de reconhecimento facial ou envio externo).
class PhotoCheckpoints extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  DateTimeColumn get date => dateTime()();
  BlobColumn get front => blob().nullable()();
  BlobColumn get side => blob().nullable()();
  BlobColumn get back => blob().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  BodyMeasurements,
  DailyCheckins,
  WorkoutTemplates,
  WorkoutTemplateExercises,
  Workouts,
  StrengthLogs,
  Goals,
  PhotoCheckpoints,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(goals);
            await m.createTable(photoCheckpoints);
          }
        },
      );

  /// Baseline registrada em 14/09/2026 (ver arquitetura-projeto50.html, seção 4
  /// da especificação original) + os 3 treinos reais extraídos de asserts/.
  Future<void> seedIfEmpty() async {
    final hasMeasurement = await select(bodyMeasurements).get();
    if (hasMeasurement.isEmpty) {
      await into(bodyMeasurements).insert(BodyMeasurementsCompanion.insert(
        date: DateTime(2026, 9, 14),
        weight: const Value(134.5),
        neck: const Value(48),
        chest: const Value(142.5),
        waist: const Value(143),
        hip: const Value(123),
        armRight: const Value(42.5),
        armLeft: const Value(40),
        thighRight: const Value(69),
        thighLeft: const Value(68),
        calfRight: const Value(46),
        calfLeft: const Value(45.5),
        source: const Value(DataSource.medido),
      ));
    }

    final hasTemplates = await select(workoutTemplates).get();
    if (hasTemplates.isNotEmpty) return;

    for (final t in _seedTemplates) {
      final templateId = _uuid.v4();
      await into(workoutTemplates).insert(WorkoutTemplatesCompanion.insert(
        id: Value(templateId),
        name: t.name,
        sortOrder: t.order,
        focus: t.focus,
      ));
      var order = 0;
      for (final e in t.exercises) {
        order++;
        await into(workoutTemplateExercises)
            .insert(WorkoutTemplateExercisesCompanion.insert(
          templateId: templateId,
          sortOrder: order,
          exercise: e.name,
          cue: e.cue,
          category: e.category,
          metricType: Value(e.metricType),
          targetSets: Value(e.sets),
          targetReps: Value(e.reps),
          targetSeconds: Value(e.seconds),
          restSeconds: Value(e.rest),
        ));
      }
    }
  }

  // ---------- Peso & medidas ----------

  Stream<List<BodyMeasurement>> watchMeasurements() {
    return (select(bodyMeasurements)
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .watch();
  }

  Future<BodyMeasurement?> latestMeasurement() async {
    final rows = await (select(bodyMeasurements)
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(1))
        .get();
    return rows.isEmpty ? null : rows.first;
  }

  Future<void> addMeasurement(BodyMeasurementsCompanion entry) {
    return into(bodyMeasurements).insert(entry);
  }

  // ---------- Check-in diário ----------

  Stream<List<DailyCheckin>> watchCheckins() {
    return (select(dailyCheckins)
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .watch();
  }

  Future<DailyCheckin?> checkinForDate(DateTime day) async {
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));
    final rows = await (select(dailyCheckins)
          ..where((t) => t.date.isBiggerOrEqualValue(start) & t.date.isSmallerThanValue(end)))
        .get();
    return rows.isEmpty ? null : rows.first;
  }

  Future<void> upsertCheckin(DailyCheckinsCompanion entry, {String? existingId}) async {
    if (existingId != null) {
      await (update(dailyCheckins)..where((t) => t.id.equals(existingId)))
          .write(entry);
    } else {
      await into(dailyCheckins).insert(entry);
    }
  }

  // ---------- Treino ----------

  Stream<List<WorkoutTemplate>> watchTemplates() {
    return (select(workoutTemplates)
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .watch();
  }

  Stream<List<WorkoutTemplateExercise>> watchTemplateExercises(String templateId) {
    return (select(workoutTemplateExercises)
          ..where((t) => t.templateId.equals(templateId))
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .watch();
  }

  /// Cria (ou reaproveita) a sessão do dia para o template escolhido.
  Future<String> ensureWorkoutForToday(String templateId) async {
    final today = DateTime.now();
    final start = DateTime(today.year, today.month, today.day);
    final end = start.add(const Duration(days: 1));
    final existing = await (select(workouts)
          ..where((t) =>
              t.templateId.equals(templateId) &
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerThanValue(end)))
        .get();
    if (existing.isNotEmpty) return existing.first.id;
    final id = _uuid.v4();
    await into(workouts).insert(WorkoutsCompanion.insert(
      id: Value(id),
      templateId: Value(templateId),
      date: today,
    ));
    return id;
  }

  Future<StrengthLog?> lastLogForExercise(String exerciseName) async {
    final rows = await (select(strengthLogs)
          ..where((t) => t.exercise.equals(exerciseName))
          ..orderBy([(t) => OrderingTerm.desc(t.loggedAt)])
          ..limit(1))
        .get();
    return rows.isEmpty ? null : rows.first;
  }

  Future<void> logSet({
    required String workoutId,
    String? templateExerciseId,
    required String exercise,
    double? weight,
    int? reps,
    int setNumber = 1,
    int? rpe,
  }) {
    return into(strengthLogs).insert(StrengthLogsCompanion.insert(
      workoutId: workoutId,
      templateExerciseId: Value(templateExerciseId),
      exercise: exercise,
      weight: Value(weight),
      reps: Value(reps),
      setNumber: Value(setNumber),
      rpe: Value(rpe),
    ));
  }

  Stream<List<StrengthLog>> watchLogsForWorkout(String workoutId) {
    return (select(strengthLogs)
          ..where((t) => t.workoutId.equals(workoutId))
          ..orderBy([(t) => OrderingTerm.asc(t.loggedAt)]))
        .watch();
  }

  // ---------- Metas ----------

  Stream<List<Goal>> watchGoals() {
    return (select(goals)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  Future<void> addGoal(GoalsCompanion entry) => into(goals).insert(entry);

  Future<void> setGoalStatus(String id, String status) {
    return (update(goals)..where((t) => t.id.equals(id)))
        .write(GoalsCompanion(status: Value(status)));
  }

  Future<void> deleteGoal(String id) {
    return (delete(goals)..where((t) => t.id.equals(id))).go();
  }

  // ---------- Fotos ----------

  Stream<List<PhotoCheckpoint>> watchPhotoCheckpoints() {
    return (select(photoCheckpoints)
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .watch();
  }

  Future<void> addPhotoCheckpoint(PhotoCheckpointsCompanion entry) {
    return into(photoCheckpoints).insert(entry);
  }

  Future<void> updatePhotoCheckpoint(String id, PhotoCheckpointsCompanion entry) {
    return (update(photoCheckpoints)..where((t) => t.id.equals(id))).write(entry);
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'projeto50',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.dart.js'),
    ),
  );
}

class _SeedExercise {
  final String name;
  final String cue;
  final String category;
  final String metricType;
  final int? sets;
  final int? reps;
  final int? seconds;
  final int rest;
  const _SeedExercise(this.name, this.cue, this.category,
      {this.metricType = MetricType.reps,
      this.sets,
      this.reps,
      this.seconds,
      this.rest = 50});
}

class _SeedTemplate {
  final String name;
  final int order;
  final String focus;
  final List<_SeedExercise> exercises;
  const _SeedTemplate(this.name, this.order, this.focus, this.exercises);
}

const _aquecimento = _SeedExercise(
  'Aquecimento', 'Esteira, bike ou elíptico — como preferir',
  ExerciseCategory.cardio,
  metricType: MetricType.time, seconds: 240, rest: 0,
);
const _cardioFinal = _SeedExercise(
  'Cardio', 'Esteira, bike ou elíptico — ritmo constante',
  ExerciseCategory.cardio,
  metricType: MetricType.time, seconds: 900, rest: 0,
);

final _seedTemplates = [
  _SeedTemplate('Treino 1', 1, 'Peito · Costas · Perna (Smith)', [
    _aquecimento,
    const _SeedExercise('Abdominal crunch na máquina', 'Controle o movimento',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Agachamento no Smith', 'Amplo e controlado',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Puxada frontal aberta', 'Peitoral aberto, tronco estável',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Supino reto com halteres', 'Ombros pra trás',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Rosca direta com barra', 'Cotovelos fixos',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Tríceps corda no pulley', 'Extensão completa',
        ExerciseCategory.strength, sets: 3, reps: 12),
    _cardioFinal,
  ]),
  _SeedTemplate('Treino 2', 2, 'Perna (Leg Press) · Costas · Peito', [
    _aquecimento,
    const _SeedExercise('Prancha abdominal', 'Tronco reto e estável',
        ExerciseCategory.strength,
        metricType: MetricType.time, sets: 3, seconds: 30),
    const _SeedExercise('Leg press', 'Joelhos alinhados',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Panturrilha no leg press', 'Amplitude completa',
        ExerciseCategory.strength, sets: 3, reps: 15),
    const _SeedExercise('Remada baixa com triângulo', 'Cotovelos próximos',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Supino inclinado na máquina', 'Foco no peitoral superior',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise(
        'Elevação lateral com halteres', 'Movimentos lentos e controlados',
        ExerciseCategory.strength, sets: 3, reps: 12),
    _cardioFinal,
  ]),
  _SeedTemplate('Treino 3', 3, 'Perna (halter) · Costas · Ombro', [
    _aquecimento,
    const _SeedExercise('Abdominal deitado', 'Mexa o tronco, e não a cabeça',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Agachamento com halter', 'Pés afastados, pontas pra fora',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise(
        'Puxada frontal pegada fechada', 'Costas retas, alongamento completo',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Crucifixo na máquina', 'Movimento em arco, alongue o peitoral',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise('Desenvolvimento na máquina', 'Ombros alinhados',
        ExerciseCategory.strength, sets: 3, reps: 12),
    const _SeedExercise(
        'Tríceps testa com halter', 'Cotovelos fixos alinhados aos ombros',
        ExerciseCategory.strength, sets: 3, reps: 12),
    _cardioFinal,
  ]),
];
