import '../database.dart';

class DashboardStatsTable extends SupabaseTable<DashboardStatsRow> {
  @override
  String get tableName => 'dashboard_stats';

  @override
  DashboardStatsRow createRow(Map<String, dynamic> data) =>
      DashboardStatsRow(data);
}

class DashboardStatsRow extends SupabaseDataRow {
  DashboardStatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DashboardStatsTable();

  String? get kompaniyaId => getField<String>('kompaniya_id');
  set kompaniyaId(String? value) => setField<String>('kompaniya_id', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  int? get totalCars => getField<int>('total_cars');
  set totalCars(int? value) => setField<int>('total_cars', value);

  int? get availableCars => getField<int>('available_cars');
  set availableCars(int? value) => setField<int>('available_cars', value);

  int? get rentedCars => getField<int>('rented_cars');
  set rentedCars(int? value) => setField<int>('rented_cars', value);

  int? get repairCars => getField<int>('repair_cars');
  set repairCars(int? value) => setField<int>('repair_cars', value);
}
