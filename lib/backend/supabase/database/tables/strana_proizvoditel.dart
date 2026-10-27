import '../database.dart';

class StranaProizvoditelTable extends SupabaseTable<StranaProizvoditelRow> {
  @override
  String get tableName => 'stranaProizvoditel';

  @override
  StranaProizvoditelRow createRow(Map<String, dynamic> data) =>
      StranaProizvoditelRow(data);
}

class StranaProizvoditelRow extends SupabaseDataRow {
  StranaProizvoditelRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StranaProizvoditelTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get strana => getField<String>('strana');
  set strana(String? value) => setField<String>('strana', value);
}
