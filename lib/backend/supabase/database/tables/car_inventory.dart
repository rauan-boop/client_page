import '../database.dart';

class CarInventoryTable extends SupabaseTable<CarInventoryRow> {
  @override
  String get tableName => 'car_inventory';

  @override
  CarInventoryRow createRow(Map<String, dynamic> data) => CarInventoryRow(data);
}

class CarInventoryRow extends SupabaseDataRow {
  CarInventoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarInventoryTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get count => getField<int>('count');
  set count(int? value) => setField<int>('count', value);

  bool? get isDefault => getField<bool>('is_default');
  set isDefault(bool? value) => setField<bool>('is_default', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get companiId => getField<String>('compani_id');
  set companiId(String? value) => setField<String>('compani_id', value);
}
