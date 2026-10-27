import '../database.dart';

class KuzovTable extends SupabaseTable<KuzovRow> {
  @override
  String get tableName => 'kuzov';

  @override
  KuzovRow createRow(Map<String, dynamic> data) => KuzovRow(data);
}

class KuzovRow extends SupabaseDataRow {
  KuzovRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KuzovTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get tipKuzova => getField<String>('tipKuzova');
  set tipKuzova(String? value) => setField<String>('tipKuzova', value);
}
