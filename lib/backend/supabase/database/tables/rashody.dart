import '../database.dart';

class RashodyTable extends SupabaseTable<RashodyRow> {
  @override
  String get tableName => 'rashody';

  @override
  RashodyRow createRow(Map<String, dynamic> data) => RashodyRow(data);
}

class RashodyRow extends SupabaseDataRow {
  RashodyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RashodyTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get typeRashody => getField<String>('type_rashody');
  set typeRashody(String? value) => setField<String>('type_rashody', value);

  bool? get rashodNezavisimyi => getField<bool>('rashod_nezavisimyi');
  set rashodNezavisimyi(bool? value) =>
      setField<bool>('rashod_nezavisimyi', value);

  String? get idCar => getField<String>('id_car');
  set idCar(String? value) => setField<String>('id_car', value);

  String? get carData => getField<String>('car_data');
  set carData(String? value) => setField<String>('car_data', value);

  String? get opisanieRashodov => getField<String>('opisanie_rashodov');
  set opisanieRashodov(String? value) =>
      setField<String>('opisanie_rashodov', value);

  int? get stoimostRashodov => getField<int>('stoimost_rashodov');
  set stoimostRashodov(int? value) => setField<int>('stoimost_rashodov', value);

  String? get avtorId => getField<String>('avtor_id');
  set avtorId(String? value) => setField<String>('avtor_id', value);

  String? get avtorImya => getField<String>('avtor_imya');
  set avtorImya(String? value) => setField<String>('avtor_imya', value);

  List<String> get photo => getListField<String>('photo');
  set photo(List<String>? value) => setListField<String>('photo', value);

  List<String> get video => getListField<String>('video');
  set video(List<String>? value) => setListField<String>('video', value);

  String? get idCompani => getField<String>('id_compani');
  set idCompani(String? value) => setField<String>('id_compani', value);

  String? get idCity => getField<String>('id_city');
  set idCity(String? value) => setField<String>('id_city', value);
}
