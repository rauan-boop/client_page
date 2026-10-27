import '../database.dart';

class PrivodTable extends SupabaseTable<PrivodRow> {
  @override
  String get tableName => 'privod';

  @override
  PrivodRow createRow(Map<String, dynamic> data) => PrivodRow(data);
}

class PrivodRow extends SupabaseDataRow {
  PrivodRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PrivodTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get vidPrivoda => getField<String>('vidPrivoda');
  set vidPrivoda(String? value) => setField<String>('vidPrivoda', value);
}
