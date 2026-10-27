import '../database.dart';

class ShtrafKlientovTable extends SupabaseTable<ShtrafKlientovRow> {
  @override
  String get tableName => 'shtraf_klientov';

  @override
  ShtrafKlientovRow createRow(Map<String, dynamic> data) =>
      ShtrafKlientovRow(data);
}

class ShtrafKlientovRow extends SupabaseDataRow {
  ShtrafKlientovRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ShtrafKlientovTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get strafUrl => getField<String>('straf_url');
  set strafUrl(String? value) => setField<String>('straf_url', value);

  String? get podrazdelenie => getField<String>('podrazdelenie');
  set podrazdelenie(String? value) => setField<String>('podrazdelenie', value);

  String? get numberProtokol => getField<String>('number_protokol');
  set numberProtokol(String? value) =>
      setField<String>('number_protokol', value);

  String? get dateProtokol => getField<String>('date_protokol');
  set dateProtokol(String? value) => setField<String>('date_protokol', value);

  String? get dateTimeFiksacii => getField<String>('date_&_time_fiksacii');
  set dateTimeFiksacii(String? value) =>
      setField<String>('date_&_time_fiksacii', value);

  int? get summaStrafa => getField<int>('summa_strafa');
  set summaStrafa(int? value) => setField<int>('summa_strafa', value);

  String? get numberAvto => getField<String>('number_avto');
  set numberAvto(String? value) => setField<String>('number_avto', value);

  String? get dataAvto => getField<String>('data_avto');
  set dataAvto(String? value) => setField<String>('data_avto', value);

  String? get idAvto => getField<String>('id_avto');
  set idAvto(String? value) => setField<String>('id_avto', value);

  String? get idHozyainAvto => getField<String>('id_hozyain_avto');
  set idHozyainAvto(String? value) =>
      setField<String>('id_hozyain_avto', value);

  String? get dataHozyainAvto => getField<String>('data_hozyain_avto');
  set dataHozyainAvto(String? value) =>
      setField<String>('data_hozyain_avto', value);

  String? get idContract => getField<String>('Id_contract');
  set idContract(String? value) => setField<String>('Id_contract', value);

  String? get numberContract => getField<String>('number_contract');
  set numberContract(String? value) =>
      setField<String>('number_contract', value);

  String? get dateContract => getField<String>('date_contract');
  set dateContract(String? value) => setField<String>('date_contract', value);

  DateTime? get startDateContract => getField<DateTime>('start_date_contract');
  set startDateContract(DateTime? value) =>
      setField<DateTime>('start_date_contract', value);

  DateTime? get endDateContract => getField<DateTime>('end_date_contract');
  set endDateContract(DateTime? value) =>
      setField<DateTime>('end_date_contract', value);

  String? get idClient => getField<String>('id_client');
  set idClient(String? value) => setField<String>('id_client', value);

  String? get familiyaClient => getField<String>('familiya_client');
  set familiyaClient(String? value) =>
      setField<String>('familiya_client', value);

  String? get imaClient => getField<String>('ima_client');
  set imaClient(String? value) => setField<String>('ima_client', value);

  String? get otchestvoClient => getField<String>('otchestvo_client');
  set otchestvoClient(String? value) =>
      setField<String>('otchestvo_client', value);

  String? get iinClient => getField<String>('iin_client');
  set iinClient(String? value) => setField<String>('iin_client', value);

  String? get phoneClient => getField<String>('phone_client');
  set phoneClient(String? value) => setField<String>('phone_client', value);

  String? get contractUrl => getField<String>('contract_url');
  set contractUrl(String? value) => setField<String>('contract_url', value);

  String? get tpiContractUrl => getField<String>('tpi_contract_url');
  set tpiContractUrl(String? value) =>
      setField<String>('tpi_contract_url', value);

  String? get actUrl => getField<String>('act_url');
  set actUrl(String? value) => setField<String>('act_url', value);

  String? get tpiActUrl => getField<String>('tpi_act_url');
  set tpiActUrl(String? value) => setField<String>('tpi_act_url', value);

  String? get soglasieUrl => getField<String>('soglasie_url');
  set soglasieUrl(String? value) => setField<String>('soglasie_url', value);

  String? get tpiSoglasieUrl => getField<String>('tpi_soglasie_url');
  set tpiSoglasieUrl(String? value) =>
      setField<String>('tpi_soglasie_url', value);

  String? get putevoiListUrl => getField<String>('putevoi_list_url');
  set putevoiListUrl(String? value) =>
      setField<String>('putevoi_list_url', value);

  String? get udostoverenieUrl => getField<String>('udostoverenie_url');
  set udostoverenieUrl(String? value) =>
      setField<String>('udostoverenie_url', value);

  String? get doverenostUrl => getField<String>('doverenost_url');
  set doverenostUrl(String? value) => setField<String>('doverenost_url', value);

  String? get strahovkaUrl => getField<String>('strahovka_url');
  set strahovkaUrl(String? value) => setField<String>('strahovka_url', value);

  String? get contractSubarendyUrl =>
      getField<String>('contract_subarendy_url');
  set contractSubarendyUrl(String? value) =>
      setField<String>('contract_subarendy_url', value);

  String? get zayavlenieUrl => getField<String>('zayavlenie_url');
  set zayavlenieUrl(String? value) => setField<String>('zayavlenie_url', value);

  bool? get statusOplaty => getField<bool>('status_oplaty');
  set statusOplaty(bool? value) => setField<bool>('status_oplaty', value);

  bool? get statusPerevoda => getField<bool>('status_perevoda');
  set statusPerevoda(bool? value) => setField<bool>('status_perevoda', value);

  String? get numberEOtinish => getField<String>('number_e_otinish');
  set numberEOtinish(String? value) =>
      setField<String>('number_e_otinish', value);

  DateTime? get dateEOtinish => getField<DateTime>('date_e_otinish');
  set dateEOtinish(DateTime? value) =>
      setField<DateTime>('date_e_otinish', value);

  bool? get statusPoluchenyhDeneg => getField<bool>('status_poluchenyh_deneg');
  set statusPoluchenyhDeneg(bool? value) =>
      setField<bool>('status_poluchenyh_deneg', value);

  DateTime? get datePerevoda => getField<DateTime>('date_perevoda');
  set datePerevoda(DateTime? value) =>
      setField<DateTime>('date_perevoda', value);

  int? get summaPolushenyhDeneg => getField<int>('summa_polushenyh_deneg');
  set summaPolushenyhDeneg(int? value) =>
      setField<int>('summa_polushenyh_deneg', value);

  DateTime? get datePerevodaShtrafa =>
      getField<DateTime>('date_perevoda_shtrafa');
  set datePerevodaShtrafa(DateTime? value) =>
      setField<DateTime>('date_perevoda_shtrafa', value);

  String? get adresUap => getField<String>('adres_uap');
  set adresUap(String? value) => setField<String>('adres_uap', value);

  String? get nameCompani => getField<String>('name_compani');
  set nameCompani(String? value) => setField<String>('name_compani', value);

  String? get familiyaAvtora => getField<String>('familiya_avtora');
  set familiyaAvtora(String? value) =>
      setField<String>('familiya_avtora', value);

  String? get imyaAvtora => getField<String>('imya_avtora');
  set imyaAvtora(String? value) => setField<String>('imya_avtora', value);

  String? get iinAvtora => getField<String>('iin_avtora');
  set iinAvtora(String? value) => setField<String>('iin_avtora', value);

  String? get adresRegAvtora => getField<String>('adres_reg_avtora');
  set adresRegAvtora(String? value) =>
      setField<String>('adres_reg_avtora', value);

  String? get phoneAvtor => getField<String>('phone_avtor');
  set phoneAvtor(String? value) => setField<String>('phone_avtor', value);

  String? get familiyaDirectora => getField<String>('familiya_directora');
  set familiyaDirectora(String? value) =>
      setField<String>('familiya_directora', value);

  String? get imyaDirektora => getField<String>('imya_direktora');
  set imyaDirektora(String? value) => setField<String>('imya_direktora', value);

  String? get otchestvoDirectora => getField<String>('otchestvo_directora');
  set otchestvoDirectora(String? value) =>
      setField<String>('otchestvo_directora', value);

  String? get iinDirectora => getField<String>('iin_directora');
  set iinDirectora(String? value) => setField<String>('iin_directora', value);

  String? get idAvtora => getField<String>('id_avtora');
  set idAvtora(String? value) => setField<String>('id_avtora', value);

  String? get idCityCompany => getField<String>('id_city_company');
  set idCityCompany(String? value) =>
      setField<String>('id_city_company', value);

  String? get idCompany => getField<String>('id_company');
  set idCompany(String? value) => setField<String>('id_company', value);

  String? get statusEOtinish => getField<String>('status_e_otinish');
  set statusEOtinish(String? value) =>
      setField<String>('status_e_otinish', value);

  int? get summaShtrafaDiscont => getField<int>('summa_shtrafa_discont');
  set summaShtrafaDiscont(int? value) =>
      setField<int>('summa_shtrafa_discont', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get gosNomerAvto => getField<String>('gos_nomer_avto');
  set gosNomerAvto(String? value) => setField<String>('gos_nomer_avto', value);

  String? get iinHozyain => getField<String>('iin_hozyain');
  set iinHozyain(String? value) => setField<String>('iin_hozyain', value);

  String? get dataShtraf => getField<String>('data_shtraf');
  set dataShtraf(String? value) => setField<String>('data_shtraf', value);

  String? get cityPodrazdeleniya => getField<String>('city_podrazdeleniya');
  set cityPodrazdeleniya(String? value) =>
      setField<String>('city_podrazdeleniya', value);

  String? get index => getField<String>('index');
  set index(String? value) => setField<String>('index', value);

  String? get strit => getField<String>('strit');
  set strit(String? value) => setField<String>('strit', value);

  String? get zdanie => getField<String>('zdanie');
  set zdanie(String? value) => setField<String>('zdanie', value);

  String? get phonePodrazdeleniya => getField<String>('phone_podrazdeleniya');
  set phonePodrazdeleniya(String? value) =>
      setField<String>('phone_podrazdeleniya', value);
}
