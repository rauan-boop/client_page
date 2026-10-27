import '../database.dart';

class CityTable extends SupabaseTable<CityRow> {
  @override
  String get tableName => 'city';

  @override
  CityRow createRow(Map<String, dynamic> data) => CityRow(data);
}

class CityRow extends SupabaseDataRow {
  CityRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CityTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);
}
