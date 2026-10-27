import '../database.dart';

class DopSoglachenieTable extends SupabaseTable<DopSoglachenieRow> {
  @override
  String get tableName => 'dop_soglachenie';

  @override
  DopSoglachenieRow createRow(Map<String, dynamic> data) =>
      DopSoglachenieRow(data);
}

class DopSoglachenieRow extends SupabaseDataRow {
  DopSoglachenieRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DopSoglachenieTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomerDopSoglasheniya =>
      getField<String>('nomer_dop_soglasheniya');
  set nomerDopSoglasheniya(String? value) =>
      setField<String>('nomer_dop_soglasheniya', value);

  DateTime? get dateDopSoglasheniya =>
      getField<DateTime>('date_dop_soglasheniya');
  set dateDopSoglasheniya(DateTime? value) =>
      setField<DateTime>('date_dop_soglasheniya', value);

  String? get nomerDogovora => getField<String>('nomer_dogovora');
  set nomerDogovora(String? value) => setField<String>('nomer_dogovora', value);

  DateTime? get dateDogovora => getField<DateTime>('date_dogovora');
  set dateDogovora(DateTime? value) =>
      setField<DateTime>('date_dogovora', value);

  String? get idCompanyDogovor => getField<String>('id_company_dogovor');
  set idCompanyDogovor(String? value) =>
      setField<String>('id_company_dogovor', value);

  String? get nameCompaniDogovor => getField<String>('name_compani_dogovor');
  set nameCompaniDogovor(String? value) =>
      setField<String>('name_compani_dogovor', value);

  String? get idCityDogovor => getField<String>('id_city_dogovor');
  set idCityDogovor(String? value) =>
      setField<String>('id_city_dogovor', value);

  String? get nameCityDogovor => getField<String>('name_city_dogovor');
  set nameCityDogovor(String? value) =>
      setField<String>('name_city_dogovor', value);

  String? get iikCompony => getField<String>('iik_compony');
  set iikCompony(String? value) => setField<String>('iik_compony', value);

  String? get bikCompani => getField<String>('bik_compani');
  set bikCompani(String? value) => setField<String>('bik_compani', value);

  String? get kbeCompany => getField<String>('kbe_company');
  set kbeCompany(String? value) => setField<String>('kbe_company', value);

  String? get imyaHoziaina => getField<String>('imya_hoziaina');
  set imyaHoziaina(String? value) => setField<String>('imya_hoziaina', value);

  String? get familiyaHozyaina => getField<String>('familiya_hozyaina');
  set familiyaHozyaina(String? value) =>
      setField<String>('familiya_hozyaina', value);

  String? get otchestvoHozyaina => getField<String>('otchestvo_hozyaina');
  set otchestvoHozyaina(String? value) =>
      setField<String>('otchestvo_hozyaina', value);

  String? get telefonHozyaina => getField<String>('telefon_hozyaina');
  set telefonHozyaina(String? value) =>
      setField<String>('telefon_hozyaina', value);

  String? get nomerUdostovereniyaHozyaina =>
      getField<String>('nomer_udostovereniya_hozyaina');
  set nomerUdostovereniyaHozyaina(String? value) =>
      setField<String>('nomer_udostovereniya_hozyaina', value);

  String? get adresRegistraciiCompanii =>
      getField<String>('adres_registracii_companii');
  set adresRegistraciiCompanii(String? value) =>
      setField<String>('adres_registracii_companii', value);

  String? get iINComany => getField<String>('IIN_comany');
  set iINComany(String? value) => setField<String>('IIN_comany', value);

  String? get idAvto => getField<String>('id_avto');
  set idAvto(String? value) => setField<String>('id_avto', value);

  String? get modelAvto => getField<String>('model_avto');
  set modelAvto(String? value) => setField<String>('model_avto', value);

  String? get markaAvto => getField<String>('marka_avto');
  set markaAvto(String? value) => setField<String>('marka_avto', value);

  String? get gosNomerAvto => getField<String>('gos_nomer_avto');
  set gosNomerAvto(String? value) => setField<String>('gos_nomer_avto', value);

  String? get idHozyainaAvto => getField<String>('id_hozyaina_avto');
  set idHozyainaAvto(String? value) =>
      setField<String>('id_hozyaina_avto', value);

  String? get idClienta => getField<String>('id_clienta');
  set idClienta(String? value) => setField<String>('id_clienta', value);

  String? get dataClient => getField<String>('data_client');
  set dataClient(String? value) => setField<String>('data_client', value);

  String? get iinClienta => getField<String>('iin_clienta');
  set iinClienta(String? value) => setField<String>('iin_clienta', value);

  String? get adresPropiski => getField<String>('adres_propiski');
  set adresPropiski(String? value) => setField<String>('adres_propiski', value);

  String? get adresProzhianiya => getField<String>('adres_prozhianiya');
  set adresProzhianiya(String? value) =>
      setField<String>('adres_prozhianiya', value);

  String? get udostoverenieClienta => getField<String>('udostoverenie_clienta');
  set udostoverenieClienta(String? value) =>
      setField<String>('udostoverenie_clienta', value);

  DateTime? get dateUdostovereniya => getField<DateTime>('date_udostovereniya');
  set dateUdostovereniya(DateTime? value) =>
      setField<DateTime>('date_udostovereniya', value);

  String? get nomerTelefona => getField<String>('nomer_telefona');
  set nomerTelefona(String? value) => setField<String>('nomer_telefona', value);

  DateTime? get dateNachala => getField<DateTime>('date_nachala');
  set dateNachala(DateTime? value) => setField<DateTime>('date_nachala', value);

  DateTime? get dateOkonchaniya => getField<DateTime>('date_okonchaniya');
  set dateOkonchaniya(DateTime? value) =>
      setField<DateTime>('date_okonchaniya', value);

  int? get kolichestvoDnei => getField<int>('kolichestvo_dnei');
  set kolichestvoDnei(int? value) => setField<int>('kolichestvo_dnei', value);

  int? get cenaSutki => getField<int>('cena_sutki');
  set cenaSutki(int? value) => setField<int>('cena_sutki', value);

  int? get cenaViezd => getField<int>('cena_viezd');
  set cenaViezd(int? value) => setField<int>('cena_viezd', value);

  String? get cityViezd => getField<String>('city_viezd');
  set cityViezd(String? value) => setField<String>('city_viezd', value);

  String? get idCityViezd => getField<String>('id_city_viezd');
  set idCityViezd(String? value) => setField<String>('id_city_viezd', value);

  int? get cenaItogo => getField<int>('cena_itogo');
  set cenaItogo(int? value) => setField<int>('cena_itogo', value);

  String? get codPodpisi => getField<String>('cod_podpisi');
  set codPodpisi(String? value) => setField<String>('cod_podpisi', value);

  String? get urlDopSoglasheniya => getField<String>('url_dop_soglasheniya');
  set urlDopSoglasheniya(String? value) =>
      setField<String>('url_dop_soglasheniya', value);

  String? get hashDopsoglasheniya => getField<String>('hash_dopsoglasheniya');
  set hashDopsoglasheniya(String? value) =>
      setField<String>('hash_dopsoglasheniya', value);

  String? get urlPasporta => getField<String>('url_pasporta');
  set urlPasporta(String? value) => setField<String>('url_pasporta', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  bool? get statusPodpisiClienta => getField<bool>('status_podpisi_clienta');
  set statusPodpisiClienta(bool? value) =>
      setField<bool>('status_podpisi_clienta', value);

  String? get idDogovora => getField<String>('id_dogovora');
  set idDogovora(String? value) => setField<String>('id_dogovora', value);

  String? get kemVydanoUdostovereniyaClient =>
      getField<String>('kem_vydano_udostovereniya_client');
  set kemVydanoUdostovereniyaClient(String? value) =>
      setField<String>('kem_vydano_udostovereniya_client', value);

  DateTime? get dateUdostovereniyaHoziyain =>
      getField<DateTime>('date_udostovereniya_hoziyain');
  set dateUdostovereniyaHoziyain(DateTime? value) =>
      setField<DateTime>('date_udostovereniya_hoziyain', value);

  String? get emailKlient => getField<String>('email_klient');
  set emailKlient(String? value) => setField<String>('email_klient', value);

  String? get idManager => getField<String>('id_manager');
  set idManager(String? value) => setField<String>('id_manager', value);

  String? get dataManager => getField<String>('data_manager');
  set dataManager(String? value) => setField<String>('data_manager', value);

  String? get managerRole => getField<String>('manager_role');
  set managerRole(String? value) => setField<String>('manager_role', value);

  bool? get podpisanDopSoglashenie =>
      getField<bool>('podpisan_dop_soglashenie');
  set podpisanDopSoglashenie(bool? value) =>
      setField<bool>('podpisan_dop_soglashenie', value);

  bool? get vyezd => getField<bool>('vyezd');
  set vyezd(bool? value) => setField<bool>('vyezd', value);

  String? get putevoiList => getField<String>('putevoi_List');
  set putevoiList(String? value) => setField<String>('putevoi_List', value);
}
