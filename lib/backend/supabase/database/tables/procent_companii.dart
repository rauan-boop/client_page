import '../database.dart';

class ProcentCompaniiTable extends SupabaseTable<ProcentCompaniiRow> {
  @override
  String get tableName => 'procentCompanii';

  @override
  ProcentCompaniiRow createRow(Map<String, dynamic> data) =>
      ProcentCompaniiRow(data);
}

class ProcentCompaniiRow extends SupabaseDataRow {
  ProcentCompaniiRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProcentCompaniiTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get procent => getField<String>('procent');
  set procent(String? value) => setField<String>('procent', value);
}
