import '../database.dart';

class ToplivoTable extends SupabaseTable<ToplivoRow> {
  @override
  String get tableName => 'toplivo';

  @override
  ToplivoRow createRow(Map<String, dynamic> data) => ToplivoRow(data);
}

class ToplivoRow extends SupabaseDataRow {
  ToplivoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ToplivoTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get vidTopliva => getField<String>('vidTopliva');
  set vidTopliva(String? value) => setField<String>('vidTopliva', value);
}
