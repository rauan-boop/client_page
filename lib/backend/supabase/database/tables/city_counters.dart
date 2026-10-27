import '../database.dart';

class CityCountersTable extends SupabaseTable<CityCountersRow> {
  @override
  String get tableName => 'city_counters';

  @override
  CityCountersRow createRow(Map<String, dynamic> data) => CityCountersRow(data);
}

class CityCountersRow extends SupabaseDataRow {
  CityCountersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CityCountersTable();

  String get cityPrefix => getField<String>('city_prefix')!;
  set cityPrefix(String value) => setField<String>('city_prefix', value);

  int get lastNumber => getField<int>('last_number')!;
  set lastNumber(int value) => setField<int>('last_number', value);
}
