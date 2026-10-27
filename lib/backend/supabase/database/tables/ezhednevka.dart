import '../database.dart';

class EzhednevkaTable extends SupabaseTable<EzhednevkaRow> {
  @override
  String get tableName => 'ezhednevka';

  @override
  EzhednevkaRow createRow(Map<String, dynamic> data) => EzhednevkaRow(data);
}

class EzhednevkaRow extends SupabaseDataRow {
  EzhednevkaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EzhednevkaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idCompany => getField<String>('id_company');
  set idCompany(String? value) => setField<String>('id_company', value);

  String? get nameCompany => getField<String>('name_company');
  set nameCompany(String? value) => setField<String>('name_company', value);

  String? get idCityCompany => getField<String>('id_city_company');
  set idCityCompany(String? value) =>
      setField<String>('id_city_company', value);

  String? get cityCompany => getField<String>('city_company');
  set cityCompany(String? value) => setField<String>('city_company', value);

  String? get idManager => getField<String>('id_manager');
  set idManager(String? value) => setField<String>('id_manager', value);

  String? get managerFamiliya => getField<String>('manager_familiya');
  set managerFamiliya(String? value) =>
      setField<String>('manager_familiya', value);

  String? get idCar => getField<String>('id_car');
  set idCar(String? value) => setField<String>('id_car', value);

  String? get dataCar => getField<String>('data_car');
  set dataCar(String? value) => setField<String>('data_car', value);

  String? get idClient => getField<String>('id_client');
  set idClient(String? value) => setField<String>('id_client', value);

  String? get dataClient => getField<String>('data_client');
  set dataClient(String? value) => setField<String>('data_client', value);

  String? get numperPhoneKlient => getField<String>('numper_phone_klient');
  set numperPhoneKlient(String? value) =>
      setField<String>('numper_phone_klient', value);

  DateTime? get dateNachala => getField<DateTime>('date_nachala');
  set dateNachala(DateTime? value) => setField<DateTime>('date_nachala', value);

  DateTime? get dateOconchaniya => getField<DateTime>('date_oconchaniya');
  set dateOconchaniya(DateTime? value) =>
      setField<DateTime>('date_oconchaniya', value);

  int? get kolichestvoDnei => getField<int>('kolichestvo_dnei');
  set kolichestvoDnei(int? value) => setField<int>('kolichestvo_dnei', value);

  int? get cenaZaSutki => getField<int>('cena_za_sutki');
  set cenaZaSutki(int? value) => setField<int>('cena_za_sutki', value);

  int? get kolichestvoVyezdov => getField<int>('kolichestvo_vyezdov');
  set kolichestvoVyezdov(int? value) =>
      setField<int>('kolichestvo_vyezdov', value);

  String? get nameCity => getField<String>('name_city');
  set nameCity(String? value) => setField<String>('name_city', value);

  int? get stoimostVyezda => getField<int>('stoimost_vyezda');
  set stoimostVyezda(int? value) => setField<int>('stoimost_vyezda', value);

  int? get cenaZaArendy => getField<int>('cena_za_arendy');
  set cenaZaArendy(int? value) => setField<int>('cena_za_arendy', value);

  int? get zalogSumma => getField<int>('zalog_summa');
  set zalogSumma(int? value) => setField<int>('zalog_summa', value);

  bool? get typeOplaty => getField<bool>('type_oplaty');
  set typeOplaty(bool? value) => setField<bool>('type_oplaty', value);

  String? get idRashoda => getField<String>('id_rashoda');
  set idRashoda(String? value) => setField<String>('id_rashoda', value);

  String? get typeRashoda => getField<String>('type_rashoda');
  set typeRashoda(String? value) => setField<String>('type_rashoda', value);

  String? get opisanieRashoda => getField<String>('opisanie_rashoda');
  set opisanieRashoda(String? value) =>
      setField<String>('opisanie_rashoda', value);

  int? get summaRashoda => getField<int>('summa_rashoda');
  set summaRashoda(int? value) => setField<int>('summa_rashoda', value);

  String? get numberDogovor => getField<String>('number_dogovor');
  set numberDogovor(String? value) => setField<String>('number_dogovor', value);

  bool? get type => getField<bool>('type');
  set type(bool? value) => setField<bool>('type', value);

  bool? get typeOplatyRashod => getField<bool>('type_oplaty_rashod');
  set typeOplatyRashod(bool? value) =>
      setField<bool>('type_oplaty_rashod', value);

  String? get vyhodnoiDen => getField<String>('vyhodnoi_den');
  set vyhodnoiDen(String? value) => setField<String>('vyhodnoi_den', value);

  bool? get typeDogovor => getField<bool>('type_dogovor');
  set typeDogovor(bool? value) => setField<bool>('type_dogovor', value);

  bool? get nezavisimyiRashod => getField<bool>('nezavisimyi_rashod');
  set nezavisimyiRashod(bool? value) =>
      setField<bool>('nezavisimyi_rashod', value);

  String? get idContract => getField<String>('id_contract');
  set idContract(String? value) => setField<String>('id_contract', value);

  int? get cardooCena => getField<int>('cardoo_cena');
  set cardooCena(int? value) => setField<int>('cardoo_cena', value);

  bool? get vyhodnoiBool => getField<bool>('vyhodnoi_bool');
  set vyhodnoiBool(bool? value) => setField<bool>('vyhodnoi_bool', value);

  String? get vidRashodaText => getField<String>('vid_rashoda_text');
  set vidRashodaText(String? value) =>
      setField<String>('vid_rashoda_text', value);
}
