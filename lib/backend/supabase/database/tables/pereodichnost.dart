import '../database.dart';

class PereodichnostTable extends SupabaseTable<PereodichnostRow> {
  @override
  String get tableName => 'pereodichnost';

  @override
  PereodichnostRow createRow(Map<String, dynamic> data) =>
      PereodichnostRow(data);
}

class PereodichnostRow extends SupabaseDataRow {
  PereodichnostRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PereodichnostTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get period => getField<String>('period');
  set period(String? value) => setField<String>('period', value);
}
