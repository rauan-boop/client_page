import '../database.dart';

class KolichestvoMestTable extends SupabaseTable<KolichestvoMestRow> {
  @override
  String get tableName => 'kolichestvoMest';

  @override
  KolichestvoMestRow createRow(Map<String, dynamic> data) =>
      KolichestvoMestRow(data);
}

class KolichestvoMestRow extends SupabaseDataRow {
  KolichestvoMestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KolichestvoMestTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get kolichestvo => getField<String>('kolichestvo');
  set kolichestvo(String? value) => setField<String>('kolichestvo', value);
}
