import '../database.dart';

class AdmRashodyTable extends SupabaseTable<AdmRashodyRow> {
  @override
  String get tableName => 'adm_rashody';

  @override
  AdmRashodyRow createRow(Map<String, dynamic> data) => AdmRashodyRow(data);
}

class AdmRashodyRow extends SupabaseDataRow {
  AdmRashodyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdmRashodyTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameAdmRashoda => getField<String>('name_adm_rashoda');
  set nameAdmRashoda(String? value) =>
      setField<String>('name_adm_rashoda', value);
}
