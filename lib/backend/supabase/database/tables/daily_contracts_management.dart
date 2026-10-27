import '../database.dart';

class DailyContractsManagementTable
    extends SupabaseTable<DailyContractsManagementRow> {
  @override
  String get tableName => 'daily_contracts_management';

  @override
  DailyContractsManagementRow createRow(Map<String, dynamic> data) =>
      DailyContractsManagementRow(data);
}

class DailyContractsManagementRow extends SupabaseDataRow {
  DailyContractsManagementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailyContractsManagementTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get companyId => getField<String>('company_id')!;
  set companyId(String value) => setField<String>('company_id', value);

  String get contractId => getField<String>('contract_id')!;
  set contractId(String value) => setField<String>('contract_id', value);

  String? get markaAvto => getField<String>('marka_avto');
  set markaAvto(String? value) => setField<String>('marka_avto', value);

  String? get modelAvto => getField<String>('model_avto');
  set modelAvto(String? value) => setField<String>('model_avto', value);

  String? get gosNomer => getField<String>('gos_nomer');
  set gosNomer(String? value) => setField<String>('gos_nomer', value);

  String? get clientFamiliya => getField<String>('client_familiya');
  set clientFamiliya(String? value) =>
      setField<String>('client_familiya', value);

  String? get clientImya => getField<String>('client_imya');
  set clientImya(String? value) => setField<String>('client_imya', value);

  String? get clientPhone => getField<String>('client_phone');
  set clientPhone(String? value) => setField<String>('client_phone', value);

  DateTime? get dateNachalaArendy => getField<DateTime>('date_nachala_arendy');
  set dateNachalaArendy(DateTime? value) =>
      setField<DateTime>('date_nachala_arendy', value);

  DateTime? get dateOkonchaniyaArendy =>
      getField<DateTime>('date_okonchaniya_arendy');
  set dateOkonchaniyaArendy(DateTime? value) =>
      setField<DateTime>('date_okonchaniya_arendy', value);

  String? get vyhodnoyi => getField<String>('vyhodnoyi');
  set vyhodnoyi(String? value) => setField<String>('vyhodnoyi', value);

  double? get carCenaSutkiSkidka => getField<double>('car_cena_sutki_skidka');
  set carCenaSutkiSkidka(double? value) =>
      setField<double>('car_cena_sutki_skidka', value);

  bool? get isPaid => getField<bool>('is_paid');
  set isPaid(bool? value) => setField<bool>('is_paid', value);

  bool? get isDebt => getField<bool>('is_debt');
  set isDebt(bool? value) => setField<bool>('is_debt', value);

  bool? get isDayOff => getField<bool>('is_day_off');
  set isDayOff(bool? value) => setField<bool>('is_day_off', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  DateTime get createdDate => getField<DateTime>('created_date')!;
  set createdDate(DateTime value) => setField<DateTime>('created_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  String? get idManager => getField<String>('id_manager');
  set idManager(String? value) => setField<String>('id_manager', value);

  String? get dataManager => getField<String>('data_manager');
  set dataManager(String? value) => setField<String>('data_manager', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get nomerDogovora => getField<String>('nomer_dogovora');
  set nomerDogovora(String? value) => setField<String>('nomer_dogovora', value);

  DateTime? get dateDogovora => getField<DateTime>('date_dogovora');
  set dateDogovora(DateTime? value) =>
      setField<DateTime>('date_dogovora', value);

  String? get idEzhednevka => getField<String>('id_ezhednevka');
  set idEzhednevka(String? value) => setField<String>('id_ezhednevka', value);

  String? get idDolzhnik => getField<String>('id_dolzhnik');
  set idDolzhnik(String? value) => setField<String>('id_dolzhnik', value);

  String? get idBooking => getField<String>('id_booking');
  set idBooking(String? value) => setField<String>('id_booking', value);
}
