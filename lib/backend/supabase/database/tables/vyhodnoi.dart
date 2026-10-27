import '../database.dart';

class VyhodnoiTable extends SupabaseTable<VyhodnoiRow> {
  @override
  String get tableName => 'vyhodnoi';

  @override
  VyhodnoiRow createRow(Map<String, dynamic> data) => VyhodnoiRow(data);
}

class VyhodnoiRow extends SupabaseDataRow {
  VyhodnoiRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VyhodnoiTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
