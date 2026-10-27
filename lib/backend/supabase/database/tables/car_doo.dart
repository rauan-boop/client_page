import '../database.dart';

class CarDooTable extends SupabaseTable<CarDooRow> {
  @override
  String get tableName => 'car_doo';

  @override
  CarDooRow createRow(Map<String, dynamic> data) => CarDooRow(data);
}

class CarDooRow extends SupabaseDataRow {
  CarDooRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarDooTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get cena => getField<int>('cena');
  set cena(int? value) => setField<int>('cena', value);
}
