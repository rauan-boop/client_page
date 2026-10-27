import '../database.dart';

class ModelAvtoTable extends SupabaseTable<ModelAvtoRow> {
  @override
  String get tableName => 'modelAvto';

  @override
  ModelAvtoRow createRow(Map<String, dynamic> data) => ModelAvtoRow(data);
}

class ModelAvtoRow extends SupabaseDataRow {
  ModelAvtoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ModelAvtoTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idmarki => getField<String>('idmarki');
  set idmarki(String? value) => setField<String>('idmarki', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
