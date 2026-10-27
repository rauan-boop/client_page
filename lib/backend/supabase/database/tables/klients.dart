import '../database.dart';

class KlientsTable extends SupabaseTable<KlientsRow> {
  @override
  String get tableName => 'klients';

  @override
  KlientsRow createRow(Map<String, dynamic> data) => KlientsRow(data);
}

class KlientsRow extends SupabaseDataRow {
  KlientsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KlientsTable();

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

  String? get nomerUdostovereniya => getField<String>('nomer_udostovereniya');
  set nomerUdostovereniya(String? value) =>
      setField<String>('nomer_udostovereniya', value);

  DateTime? get dateVydachi => getField<DateTime>('date_vydachi');
  set dateVydachi(DateTime? value) => setField<DateTime>('date_vydachi', value);

  DateTime? get dateRozhdeniya => getField<DateTime>('date_rozhdeniya');
  set dateRozhdeniya(DateTime? value) =>
      setField<DateTime>('date_rozhdeniya', value);

  String? get kemVydano => getField<String>('kem_vydano');
  set kemVydano(String? value) => setField<String>('kem_vydano', value);

  String? get nomerTelefona => getField<String>('nomer_telefona');
  set nomerTelefona(String? value) => setField<String>('nomer_telefona', value);

  String? get adresPropiski => getField<String>('adres_propiski');
  set adresPropiski(String? value) => setField<String>('adres_propiski', value);

  String? get adresProzhivaniya => getField<String>('adres_prozhivaniya');
  set adresProzhivaniya(String? value) =>
      setField<String>('adres_prozhivaniya', value);

  String? get refSylka => getField<String>('ref_sylka');
  set refSylka(String? value) => setField<String>('ref_sylka', value);

  int? get bonusy => getField<int>('bonusy');
  set bonusy(int? value) => setField<int>('bonusy', value);

  bool? get grazhdaninRk => getField<bool>('grazhdanin_rk');
  set grazhdaninRk(bool? value) => setField<bool>('grazhdanin_rk', value);

  String? get strana => getField<String>('strana');
  set strana(String? value) => setField<String>('strana', value);

  String? get fotoKlienta => getField<String>('foto_klienta');
  set fotoKlienta(String? value) => setField<String>('foto_klienta', value);

  String? get fotoUdLichnosti => getField<String>('foto_udLichnosti');
  set fotoUdLichnosti(String? value) =>
      setField<String>('foto_udLichnosti', value);

  String? get fotoVodPrav => getField<String>('foto_vod_prav');
  set fotoVodPrav(String? value) => setField<String>('foto_vod_prav', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get soglasieNaBrabotkuPersDannyh =>
      getField<String>('soglasie_na_brabotkuPersDannyh');
  set soglasieNaBrabotkuPersDannyh(String? value) =>
      setField<String>('soglasie_na_brabotkuPersDannyh', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  bool? get vChernomSpiske => getField<bool>('v_chernom_spiske');
  set vChernomSpiske(bool? value) => setField<bool>('v_chernom_spiske', value);

  String? get klientData => getField<String>('klient_data');
  set klientData(String? value) => setField<String>('klient_data', value);
}
