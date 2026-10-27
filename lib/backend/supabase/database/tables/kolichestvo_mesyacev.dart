import '../database.dart';

class KolichestvoMesyacevTable extends SupabaseTable<KolichestvoMesyacevRow> {
  @override
  String get tableName => 'kolichestvo_mesyacev';

  @override
  KolichestvoMesyacevRow createRow(Map<String, dynamic> data) =>
      KolichestvoMesyacevRow(data);
}

class KolichestvoMesyacevRow extends SupabaseDataRow {
  KolichestvoMesyacevRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KolichestvoMesyacevTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get kolichestvo => getField<int>('kolichestvo');
  set kolichestvo(int? value) => setField<int>('kolichestvo', value);
}
