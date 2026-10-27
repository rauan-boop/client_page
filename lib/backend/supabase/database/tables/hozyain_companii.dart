import '../database.dart';

class HozyainCompaniiTable extends SupabaseTable<HozyainCompaniiRow> {
  @override
  String get tableName => 'hozyain_companii';

  @override
  HozyainCompaniiRow createRow(Map<String, dynamic> data) =>
      HozyainCompaniiRow(data);
}

class HozyainCompaniiRow extends SupabaseDataRow {
  HozyainCompaniiRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HozyainCompaniiTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get familiya => getField<String>('familiya');
  set familiya(String? value) => setField<String>('familiya', value);

  String? get imya => getField<String>('imya');
  set imya(String? value) => setField<String>('imya', value);

  String? get otchestvo => getField<String>('otchestvo');
  set otchestvo(String? value) => setField<String>('otchestvo', value);

  String? get iin => getField<String>('iin');
  set iin(String? value) => setField<String>('iin', value);

  String? get adresRegistracii => getField<String>('adres_registracii');
  set adresRegistracii(String? value) =>
      setField<String>('adres_registracii', value);

  String? get momerUdostovereniya => getField<String>('momer_udostovereniya');
  set momerUdostovereniya(String? value) =>
      setField<String>('momer_udostovereniya', value);

  DateTime? get dataVydachiUdostovereniya =>
      getField<DateTime>('data_vydachi_udostovereniya');
  set dataVydachiUdostovereniya(DateTime? value) =>
      setField<DateTime>('data_vydachi_udostovereniya', value);

  String? get kemVydan => getField<String>('kem_vydan');
  set kemVydan(String? value) => setField<String>('kem_vydan', value);

  String? get nomerTelefona => getField<String>('nomer_telefona');
  set nomerTelefona(String? value) => setField<String>('nomer_telefona', value);

  String? get iik => getField<String>('iik');
  set iik(String? value) => setField<String>('iik', value);

  String? get bik => getField<String>('bik');
  set bik(String? value) => setField<String>('bik', value);

  String? get kbe => getField<String>('kbe');
  set kbe(String? value) => setField<String>('kbe', value);

  String? get companiya => getField<String>('companiya');
  set companiya(String? value) => setField<String>('companiya', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  String? get pechat => getField<String>('pechat');
  set pechat(String? value) => setField<String>('pechat', value);
}
