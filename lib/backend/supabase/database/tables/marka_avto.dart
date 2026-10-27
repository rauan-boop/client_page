import '../database.dart';

class MarkaAvtoTable extends SupabaseTable<MarkaAvtoRow> {
  @override
  String get tableName => 'markaAvto';

  @override
  MarkaAvtoRow createRow(Map<String, dynamic> data) => MarkaAvtoRow(data);
}

class MarkaAvtoRow extends SupabaseDataRow {
  MarkaAvtoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MarkaAvtoTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get marka => getField<String>('marka');
  set marka(String? value) => setField<String>('marka', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
