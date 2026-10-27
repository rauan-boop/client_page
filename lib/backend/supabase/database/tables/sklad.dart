import '../database.dart';

class SkladTable extends SupabaseTable<SkladRow> {
  @override
  String get tableName => 'sklad';

  @override
  SkladRow createRow(Map<String, dynamic> data) => SkladRow(data);
}

class SkladRow extends SupabaseDataRow {
  SkladRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SkladTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get naimenovanie => getField<String>('naimenovanie');
  set naimenovanie(String? value) => setField<String>('naimenovanie', value);

  String? get number => getField<String>('number');
  set number(String? value) => setField<String>('number', value);

  String? get kolVo => getField<String>('kol_vo');
  set kolVo(String? value) => setField<String>('kol_vo', value);

  int? get cena => getField<int>('cena');
  set cena(int? value) => setField<int>('cena', value);

  String? get kategogiya => getField<String>('kategogiya');
  set kategogiya(String? value) => setField<String>('kategogiya', value);

  String? get otvetstvennyi => getField<String>('otvetstvennyi');
  set otvetstvennyi(String? value) => setField<String>('otvetstvennyi', value);

  String? get mestoHraneniya => getField<String>('mesto_hraneniya');
  set mestoHraneniya(String? value) =>
      setField<String>('mesto_hraneniya', value);

  String? get pfoto => getField<String>('pfoto');
  set pfoto(String? value) => setField<String>('pfoto', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get company => getField<String>('company');
  set company(String? value) => setField<String>('company', value);

  String? get companiId => getField<String>('compani_id');
  set companiId(String? value) => setField<String>('compani_id', value);
}
