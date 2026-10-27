import '../database.dart';

class CarStatisticsTable extends SupabaseTable<CarStatisticsRow> {
  @override
  String get tableName => 'car_statistics';

  @override
  CarStatisticsRow createRow(Map<String, dynamic> data) =>
      CarStatisticsRow(data);
}

class CarStatisticsRow extends SupabaseDataRow {
  CarStatisticsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarStatisticsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get kompaniyaId => getField<String>('kompaniya_id');
  set kompaniyaId(String? value) => setField<String>('kompaniya_id', value);

  String? get cityID => getField<String>('cityID');
  set cityID(String? value) => setField<String>('cityID', value);

  int get inGarageCount => getField<int>('in_garage_count')!;
  set inGarageCount(int value) => setField<int>('in_garage_count', value);

  int get inRentCount => getField<int>('in_rent_count')!;
  set inRentCount(int value) => setField<int>('in_rent_count', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
