import '../database.dart';

class CarsSostoyanieTable extends SupabaseTable<CarsSostoyanieRow> {
  @override
  String get tableName => 'cars_sostoyanie';

  @override
  CarsSostoyanieRow createRow(Map<String, dynamic> data) =>
      CarsSostoyanieRow(data);
}

class CarsSostoyanieRow extends SupabaseDataRow {
  CarsSostoyanieRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarsSostoyanieTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get date => getField<DateTime>('date')!;
  set date(DateTime value) => setField<DateTime>('date', value);

  String? get carsId => getField<String>('cars_id');
  set carsId(String? value) => setField<String>('cars_id', value);

  String? get dataCars => getField<String>('data_cars');
  set dataCars(String? value) => setField<String>('data_cars', value);

  String? get companiId => getField<String>('compani_id');
  set companiId(String? value) => setField<String>('compani_id', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);
}
