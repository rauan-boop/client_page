import '../database.dart';

class CarsTable extends SupabaseTable<CarsRow> {
  @override
  String get tableName => 'cars';

  @override
  CarsRow createRow(Map<String, dynamic> data) => CarsRow(data);
}

class CarsRow extends SupabaseDataRow {
  CarsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get marka => getField<String>('marka');
  set marka(String? value) => setField<String>('marka', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  String? get gosNomer => getField<String>('gos_nomer');
  set gosNomer(String? value) => setField<String>('gos_nomer', value);

  String? get vinCode => getField<String>('vin_code');
  set vinCode(String? value) => setField<String>('vin_code', value);

  int? get stoimostAvto => getField<int>('stoimost_avto');
  set stoimostAvto(int? value) => setField<int>('stoimost_avto', value);

  String? get godvypuska => getField<String>('godvypuska');
  set godvypuska(String? value) => setField<String>('godvypuska', value);

  DateTime? get dateStartDogovor => getField<DateTime>('date_start_dogovor');
  set dateStartDogovor(DateTime? value) =>
      setField<DateTime>('date_start_dogovor', value);

  DateTime? get dateEndDogovor => getField<DateTime>('date_end_dogovor');
  set dateEndDogovor(DateTime? value) =>
      setField<DateTime>('date_end_dogovor', value);

  String? get srokdogovora => getField<String>('srokdogovora');
  set srokdogovora(String? value) => setField<String>('srokdogovora', value);

  String? get hozyainId => getField<String>('hozyain_id');
  set hozyainId(String? value) => setField<String>('hozyain_id', value);

  String? get hoziyainFamiliya => getField<String>('hoziyain_familiya');
  set hoziyainFamiliya(String? value) =>
      setField<String>('hoziyain_familiya', value);

  DateTime? get strafovkaend => getField<DateTime>('strafovkaend');
  set strafovkaend(DateTime? value) =>
      setField<DateTime>('strafovkaend', value);

  String? get strahovkaPage => getField<String>('strahovka_page');
  set strahovkaPage(String? value) => setField<String>('strahovka_page', value);

  DateTime? get tehOsmotrEnd => getField<DateTime>('teh_osmotr_end');
  set tehOsmotrEnd(DateTime? value) =>
      setField<DateTime>('teh_osmotr_end', value);

  String? get tehOsmotrPage => getField<String>('teh_osmotr_page');
  set tehOsmotrPage(String? value) =>
      setField<String>('teh_osmotr_page', value);

  int? get probeg => getField<int>('probeg');
  set probeg(int? value) => setField<int>('probeg', value);

  int? get zamenaMaslaDvs => getField<int>('zamena_masla_dvs');
  set zamenaMaslaDvs(int? value) => setField<int>('zamena_masla_dvs', value);

  int? get zamenaMaslaKpp => getField<int>('zamena_masla_kpp');
  set zamenaMaslaKpp(int? value) => setField<int>('zamena_masla_kpp', value);

  String? get razmerKolesa => getField<String>('razmer_kolesa');
  set razmerKolesa(String? value) => setField<String>('razmer_kolesa', value);

  String? get opisanie => getField<String>('opisanie');
  set opisanie(String? value) => setField<String>('opisanie', value);

  List<String> get photoAvto => getListField<String>('photo_avto');
  set photoAvto(List<String>? value) =>
      setListField<String>('photo_avto', value);

  String? get photoTehPasport => getField<String>('photo_teh_pasport');
  set photoTehPasport(String? value) =>
      setField<String>('photo_teh_pasport', value);

  int? get cenaSutki => getField<int>('cena_sutki');
  set cenaSutki(int? value) => setField<int>('cena_sutki', value);

  String? get procentOtAvto => getField<String>('procent_ot_avto');
  set procentOtAvto(String? value) =>
      setField<String>('procent_ot_avto', value);

  String? get nomerTehpasporta => getField<String>('nomer_tehpasporta');
  set nomerTehpasporta(String? value) =>
      setField<String>('nomer_tehpasporta', value);

  String? get strana => getField<String>('strana');
  set strana(String? value) => setField<String>('strana', value);

  String? get cvet => getField<String>('cvet');
  set cvet(String? value) => setField<String>('cvet', value);

  String? get obem => getField<String>('obem');
  set obem(String? value) => setField<String>('obem', value);

  String? get kpp => getField<String>('kpp');
  set kpp(String? value) => setField<String>('kpp', value);

  String? get toplivo => getField<String>('toplivo');
  set toplivo(String? value) => setField<String>('toplivo', value);

  String? get kuzov => getField<String>('kuzov');
  set kuzov(String? value) => setField<String>('kuzov', value);

  String? get vidPrivoda => getField<String>('vid_privoda');
  set vidPrivoda(String? value) => setField<String>('vid_privoda', value);

  String? get kolichestvoMest => getField<String>('kolichestvo_mest');
  set kolichestvoMest(String? value) =>
      setField<String>('kolichestvo_mest', value);

  DateTime? get dateOkonchaniaProkata =>
      getField<DateTime>('date_okonchaniaProkata');
  set dateOkonchaniaProkata(DateTime? value) =>
      setField<DateTime>('date_okonchaniaProkata', value);

  String? get kompaniya => getField<String>('kompaniya');
  set kompaniya(String? value) => setField<String>('kompaniya', value);

  String? get kompaniyaId => getField<String>('kompaniya_id');
  set kompaniyaId(String? value) => setField<String>('kompaniya_id', value);

  bool? get arfive => getField<bool>('arfive');
  set arfive(bool? value) => setField<bool>('arfive', value);

  DateTime? get dateVvodaVProkat => getField<DateTime>('date_vvoda_v_prokat');
  set dateVvodaVProkat(DateTime? value) =>
      setField<DateTime>('date_vvoda_v_prokat', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get intervalZamenyMaslaDvs => getField<int>('interval_zameny_masla_dvs');
  set intervalZamenyMaslaDvs(int? value) =>
      setField<int>('interval_zameny_masla_dvs', value);

  int? get intervalZamenyMaslaKpp => getField<int>('interval_zameny_masla_kpp');
  set intervalZamenyMaslaKpp(int? value) =>
      setField<int>('interval_zameny_masla_kpp', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get cityID => getField<String>('cityID');
  set cityID(String? value) => setField<String>('cityID', value);

  bool? get sostoyanie => getField<bool>('sostoyanie');
  set sostoyanie(bool? value) => setField<bool>('sostoyanie', value);

  String? get doverennostPage => getField<String>('doverennost_page');
  set doverennostPage(String? value) =>
      setField<String>('doverennost_page', value);

  DateTime? get doverenostEnd => getField<DateTime>('doverenost_end');
  set doverenostEnd(DateTime? value) =>
      setField<DateTime>('doverenost_end', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get idWialon => getField<int>('id_wialon');
  set idWialon(int? value) => setField<int>('id_wialon', value);

  int? get toUDillera => getField<int>('to_u_dillera');
  set toUDillera(int? value) => setField<int>('to_u_dillera', value);

  bool? get statusBoolean => getField<bool>('status_boolean');
  set statusBoolean(bool? value) => setField<bool>('status_boolean', value);

  String? get dataCars => getField<String>('data_cars');
  set dataCars(String? value) => setField<String>('data_cars', value);

  String? get dataCarsStatus => getField<String>('data_cars_status');
  set dataCarsStatus(String? value) =>
      setField<String>('data_cars_status', value);

  bool? get toUDilera => getField<bool>('to_u_dilera');
  set toUDilera(bool? value) => setField<bool>('to_u_dilera', value);

  int? get intarvalToUDillera => getField<int>('intarval_to_u_dillera');
  set intarvalToUDillera(int? value) =>
      setField<int>('intarval_to_u_dillera', value);

  bool? get sostoyanieObsluzhivaniya =>
      getField<bool>('sostoyanie_obsluzhivaniya');
  set sostoyanieObsluzhivaniya(bool? value) =>
      setField<bool>('sostoyanie_obsluzhivaniya', value);

  int? get royalti => getField<int>('royalti');
  set royalti(int? value) => setField<int>('royalti', value);

  int? get trekery => getField<int>('trekery');
  set trekery(int? value) => setField<int>('trekery', value);

  String? get dogovorSubarendyUrl => getField<String>('dogovor_subarendy_url');
  set dogovorSubarendyUrl(String? value) =>
      setField<String>('dogovor_subarendy_url', value);
}
