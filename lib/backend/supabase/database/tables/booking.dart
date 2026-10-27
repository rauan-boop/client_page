import '../database.dart';

class BookingTable extends SupabaseTable<BookingRow> {
  @override
  String get tableName => 'booking';

  @override
  BookingRow createRow(Map<String, dynamic> data) => BookingRow(data);
}

class BookingRow extends SupabaseDataRow {
  BookingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get carId => getField<String>('car_id');
  set carId(String? value) => setField<String>('car_id', value);

  String? get carData => getField<String>('car_data');
  set carData(String? value) => setField<String>('car_data', value);

  String? get klientId => getField<String>('klient_id');
  set klientId(String? value) => setField<String>('klient_id', value);

  String? get klientData => getField<String>('klient_data');
  set klientData(String? value) => setField<String>('klient_data', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get adresPodachi => getField<String>('adres_podachi');
  set adresPodachi(String? value) => setField<String>('adres_podachi', value);

  int? get cenaPodachi => getField<int>('cena_podachi');
  set cenaPodachi(int? value) => setField<int>('cena_podachi', value);

  String? get adresPriema => getField<String>('adres_priema');
  set adresPriema(String? value) => setField<String>('adres_priema', value);

  String? get dopolnitelno => getField<String>('dopolnitelno');
  set dopolnitelno(String? value) => setField<String>('dopolnitelno', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get cenaSutkiSoSkidkoi => getField<int>('cena_sutki_so_skidkoi');
  set cenaSutkiSoSkidkoi(int? value) =>
      setField<int>('cena_sutki_so_skidkoi', value);

  int? get kolvoDneiy => getField<int>('kolvo_dneiy');
  set kolvoDneiy(int? value) => setField<int>('kolvo_dneiy', value);

  int? get zadatok => getField<int>('zadatok');
  set zadatok(int? value) => setField<int>('zadatok', value);

  int? get obshayaSumma => getField<int>('obshaya_summa');
  set obshayaSumma(int? value) => setField<int>('obshaya_summa', value);

  String? get adresVozvrata => getField<String>('adres_vozvrata');
  set adresVozvrata(String? value) => setField<String>('adres_vozvrata', value);

  int? get cenaVozvrata => getField<int>('cena_vozvrata');
  set cenaVozvrata(int? value) => setField<int>('cena_vozvrata', value);

  String? get viezdCity => getField<String>('viezd_city');
  set viezdCity(String? value) => setField<String>('viezd_city', value);

  int? get cenaViezd => getField<int>('cena_viezd');
  set cenaViezd(int? value) => setField<int>('cena_viezd', value);

  String? get cityCompany => getField<String>('city_company');
  set cityCompany(String? value) => setField<String>('city_company', value);

  String? get idCityCompany => getField<String>('id_city_company');
  set idCityCompany(String? value) =>
      setField<String>('id_city_company', value);

  bool? get typeDogovor => getField<bool>('type_dogovor');
  set typeDogovor(bool? value) => setField<bool>('type_dogovor', value);

  bool? get statusAvto => getField<bool>('status_avto');
  set statusAvto(bool? value) => setField<bool>('status_avto', value);

  String? get company => getField<String>('company');
  set company(String? value) => setField<String>('company', value);

  String? get idCompany => getField<String>('id_company');
  set idCompany(String? value) => setField<String>('id_company', value);

  String? get idManeger => getField<String>('id_maneger');
  set idManeger(String? value) => setField<String>('id_maneger', value);

  String? get roleManager => getField<String>('role_manager');
  set roleManager(String? value) => setField<String>('role_manager', value);

  String? get dataManager => getField<String>('data_manager');
  set dataManager(String? value) => setField<String>('data_manager', value);

  String? get idDogovor => getField<String>('idDogovor');
  set idDogovor(String? value) => setField<String>('idDogovor', value);

  String? get vyhodnoiDay => getField<String>('vyhodnoiDay');
  set vyhodnoiDay(String? value) => setField<String>('vyhodnoiDay', value);
}
