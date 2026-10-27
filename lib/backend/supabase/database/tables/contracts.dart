import '../database.dart';

class ContractsTable extends SupabaseTable<ContractsRow> {
  @override
  String get tableName => 'contracts';

  @override
  ContractsRow createRow(Map<String, dynamic> data) => ContractsRow(data);
}

class ContractsRow extends SupabaseDataRow {
  ContractsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContractsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomerDogovora => getField<String>('nomer_dogovora');
  set nomerDogovora(String? value) => setField<String>('nomer_dogovora', value);

  DateTime? get dateDogovora => getField<DateTime>('date_dogovora');
  set dateDogovora(DateTime? value) =>
      setField<DateTime>('date_dogovora', value);

  String? get markaAvto => getField<String>('marka_avto');
  set markaAvto(String? value) => setField<String>('marka_avto', value);

  String? get modelAvto => getField<String>('model_avto');
  set modelAvto(String? value) => setField<String>('model_avto', value);

  String? get gosNomer => getField<String>('gos_nomer');
  set gosNomer(String? value) => setField<String>('gos_nomer', value);

  String? get cityDogovor => getField<String>('city_dogovor');
  set cityDogovor(String? value) => setField<String>('city_dogovor', value);

  String? get vinCode => getField<String>('vin_code');
  set vinCode(String? value) => setField<String>('vin_code', value);

  String? get godVypuska => getField<String>('god_vypuska');
  set godVypuska(String? value) => setField<String>('god_vypuska', value);

  String? get cvetAvto => getField<String>('cvet_avto');
  set cvetAvto(String? value) => setField<String>('cvet_avto', value);

  String? get toplivo => getField<String>('toplivo');
  set toplivo(String? value) => setField<String>('toplivo', value);

  int? get stoimostAvto => getField<int>('stoimost_avto');
  set stoimostAvto(int? value) => setField<int>('stoimost_avto', value);

  int? get cenaSutci => getField<int>('cena_sutci');
  set cenaSutci(int? value) => setField<int>('cena_sutci', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get companiId => getField<String>('compani_id');
  set companiId(String? value) => setField<String>('compani_id', value);

  String? get familiyaHozyain => getField<String>('familiya_hozyain');
  set familiyaHozyain(String? value) =>
      setField<String>('familiya_hozyain', value);

  String? get imyaHozyain => getField<String>('imya_hozyain');
  set imyaHozyain(String? value) => setField<String>('imya_hozyain', value);

  String? get otchestvoHozyain => getField<String>('otchestvo_hozyain');
  set otchestvoHozyain(String? value) =>
      setField<String>('otchestvo_hozyain', value);

  String? get iinHozyain => getField<String>('iin_hozyain');
  set iinHozyain(String? value) => setField<String>('iin_hozyain', value);

  String? get telephoneHozyan => getField<String>('telephone_hozyan');
  set telephoneHozyan(String? value) =>
      setField<String>('telephone_hozyan', value);

  String? get adresCompany => getField<String>('adres_company');
  set adresCompany(String? value) => setField<String>('adres_company', value);

  String? get udostoverenieNumber => getField<String>('udostoverenie_number');
  set udostoverenieNumber(String? value) =>
      setField<String>('udostoverenie_number', value);

  DateTime? get dateVydachiUdostovereniya =>
      getField<DateTime>('date_vydachi_udostovereniya');
  set dateVydachiUdostovereniya(DateTime? value) =>
      setField<DateTime>('date_vydachi_udostovereniya', value);

  String? get kemVydan => getField<String>('kem_vydan');
  set kemVydan(String? value) => setField<String>('kem_vydan', value);

  String? get iik => getField<String>('iik');
  set iik(String? value) => setField<String>('iik', value);

  String? get bik => getField<String>('bik');
  set bik(String? value) => setField<String>('bik', value);

  String? get kbe => getField<String>('kbe');
  set kbe(String? value) => setField<String>('kbe', value);

  String? get idClient => getField<String>('id_client');
  set idClient(String? value) => setField<String>('id_client', value);

  String? get clientFamiliya => getField<String>('client_familiya');
  set clientFamiliya(String? value) =>
      setField<String>('client_familiya', value);

  String? get clientImya => getField<String>('client_imya');
  set clientImya(String? value) => setField<String>('client_imya', value);

  String? get clientOtchestvo => getField<String>('client_otchestvo');
  set clientOtchestvo(String? value) =>
      setField<String>('client_otchestvo', value);

  String? get clientIin => getField<String>('client_iin');
  set clientIin(String? value) => setField<String>('client_iin', value);

  String? get clientAdrsPropiki => getField<String>('client_adrs_propiki');
  set clientAdrsPropiki(String? value) =>
      setField<String>('client_adrs_propiki', value);

  String? get clientDresProzhivaniya =>
      getField<String>('client_dres_prozhivaniya');
  set clientDresProzhivaniya(String? value) =>
      setField<String>('client_dres_prozhivaniya', value);

  String? get clientNomerUdostoverebiya =>
      getField<String>('client_nomer_udostoverebiya');
  set clientNomerUdostoverebiya(String? value) =>
      setField<String>('client_nomer_udostoverebiya', value);

  DateTime? get clientDateVydachi => getField<DateTime>('client_date_vydachi');
  set clientDateVydachi(DateTime? value) =>
      setField<DateTime>('client_date_vydachi', value);

  String? get clientKemVydan => getField<String>('client_kem_vydan');
  set clientKemVydan(String? value) =>
      setField<String>('client_kem_vydan', value);

  String? get clientPfone => getField<String>('client_pfone');
  set clientPfone(String? value) => setField<String>('client_pfone', value);

  DateTime? get dateNachalaArendy => getField<DateTime>('date_nachala_arendy');
  set dateNachalaArendy(DateTime? value) =>
      setField<DateTime>('date_nachala_arendy', value);

  DateTime? get dateOkonchaniyaArendy =>
      getField<DateTime>('date_okonchaniya_arendy');
  set dateOkonchaniyaArendy(DateTime? value) =>
      setField<DateTime>('date_okonchaniya_arendy', value);

  int? get colichestvoDnei => getField<int>('colichestvo_dnei');
  set colichestvoDnei(int? value) => setField<int>('colichestvo_dnei', value);

  bool? get vyezd => getField<bool>('vyezd');
  set vyezd(bool? value) => setField<bool>('vyezd', value);

  String? get vyezdCity => getField<String>('vyezd_city');
  set vyezdCity(String? value) => setField<String>('vyezd_city', value);

  int? get vyezdCena => getField<int>('vyezd_cena');
  set vyezdCena(int? value) => setField<int>('vyezd_cena', value);

  bool? get cardoo => getField<bool>('cardoo');
  set cardoo(bool? value) => setField<bool>('cardoo', value);

  String? get depozitCardoo => getField<String>('depozit_cardoo');
  set depozitCardoo(String? value) => setField<String>('depozit_cardoo', value);

  int? get depozitKassa => getField<int>('depozit_kassa');
  set depozitKassa(int? value) => setField<int>('depozit_kassa', value);

  String? get carId => getField<String>('car_id');
  set carId(String? value) => setField<String>('car_id', value);

  bool? get nalichka => getField<bool>('nalichka');
  set nalichka(bool? value) => setField<bool>('nalichka', value);

  String? get carHozyainId => getField<String>('car_hozyain_id');
  set carHozyainId(String? value) => setField<String>('car_hozyain_id', value);

  int? get carCenaSutkiSkidka => getField<int>('car_cena_sutki_skidka');
  set carCenaSutkiSkidka(int? value) =>
      setField<int>('car_cena_sutki_skidka', value);

  int? get stoimostArendy => getField<int>('stoimost_arendy');
  set stoimostArendy(int? value) => setField<int>('stoimost_arendy', value);

  int? get stoimostArendyBezDepozita =>
      getField<int>('stoimost_arendy_bez_depozita');
  set stoimostArendyBezDepozita(int? value) =>
      setField<int>('stoimost_arendy_bez_depozita', value);

  String? get dogovorUrl => getField<String>('dogovor_url');
  set dogovorUrl(String? value) => setField<String>('dogovor_url', value);

  String? get dogovorCode => getField<String>('dogovor_code');
  set dogovorCode(String? value) => setField<String>('dogovor_code', value);

  dynamic? get imuchestvo => getField<dynamic>('imuchestvo');
  set imuchestvo(dynamic? value) => setField<dynamic>('imuchestvo', value);

  String? get actPriemaUrl => getField<String>('act_priema_url');
  set actPriemaUrl(String? value) => setField<String>('act_priema_url', value);

  String? get actPriemaCode => getField<String>('act_priema_code');
  set actPriemaCode(String? value) =>
      setField<String>('act_priema_code', value);

  String? get soglasieNaStrafUrl => getField<String>('soglasie_na_straf_url');
  set soglasieNaStrafUrl(String? value) =>
      setField<String>('soglasie_na_straf_url', value);

  String? get soglasieNaShtrafCode =>
      getField<String>('soglasie_na_shtraf_code');
  set soglasieNaShtrafCode(String? value) =>
      setField<String>('soglasie_na_shtraf_code', value);

  String? get putevoiListUrl => getField<String>('putevoi_list_url');
  set putevoiListUrl(String? value) =>
      setField<String>('putevoi_list_url', value);

  String? get avtorFamiliya => getField<String>('avtor_familiya');
  set avtorFamiliya(String? value) => setField<String>('avtor_familiya', value);

  bool? get statusDogovora => getField<bool>('status_dogovora');
  set statusDogovora(bool? value) => setField<bool>('status_dogovora', value);

  bool? get vidDogovora => getField<bool>('vid_dogovora');
  set vidDogovora(bool? value) => setField<bool>('vid_dogovora', value);

  bool? get viewedDogovor => getField<bool>('viewed_dogovor');
  set viewedDogovor(bool? value) => setField<bool>('viewed_dogovor', value);

  bool? get viewedAct => getField<bool>('viewed_act');
  set viewedAct(bool? value) => setField<bool>('viewed_act', value);

  bool? get viewedSoglasie => getField<bool>('viewed_soglasie');
  set viewedSoglasie(bool? value) => setField<bool>('viewed_soglasie', value);

  String? get hashContract => getField<String>('hash_contract');
  set hashContract(String? value) => setField<String>('hash_contract', value);

  String? get hachAct => getField<String>('hach_act');
  set hachAct(String? value) => setField<String>('hach_act', value);

  String? get hashSoglasie => getField<String>('hash_soglasie');
  set hashSoglasie(String? value) => setField<String>('hash_soglasie', value);

  String? get ipUstroistva => getField<String>('ip_ustroistva');
  set ipUstroistva(String? value) => setField<String>('ip_ustroistva', value);

  String? get deviceInfo => getField<String>('device_info');
  set deviceInfo(String? value) => setField<String>('device_info', value);

  String? get tehnicalListContract =>
      getField<String>('tehnical_list_contract');
  set tehnicalListContract(String? value) =>
      setField<String>('tehnical_list_contract', value);

  String? get nomerTalona => getField<String>('nomer_talona');
  set nomerTalona(String? value) => setField<String>('nomer_talona', value);

  DateTime? get dateVydachiTalona => getField<DateTime>('date_vydachi_talona');
  set dateVydachiTalona(DateTime? value) =>
      setField<DateTime>('date_vydachi_talona', value);

  String? get clientEmail => getField<String>('client_email');
  set clientEmail(String? value) => setField<String>('client_email', value);

  String? get companyBank => getField<String>('company_bank');
  set companyBank(String? value) => setField<String>('company_bank', value);

  int? get probeg => getField<int>('probeg');
  set probeg(int? value) => setField<int>('probeg', value);

  String? get tehnicalListAkt => getField<String>('tehnical_list_akt');
  set tehnicalListAkt(String? value) =>
      setField<String>('tehnical_list_akt', value);

  String? get tehnikalListSogasie => getField<String>('tehnikal_list_sogasie');
  set tehnikalListSogasie(String? value) =>
      setField<String>('tehnikal_list_sogasie', value);

  bool? get urls => getField<bool>('urls');
  set urls(bool? value) => setField<bool>('urls', value);

  DateTime? get dogovorPodpisan => getField<DateTime>('dogovor_podpisan');
  set dogovorPodpisan(DateTime? value) =>
      setField<DateTime>('dogovor_podpisan', value);

  DateTime? get actPodpisan => getField<DateTime>('act_podpisan');
  set actPodpisan(DateTime? value) => setField<DateTime>('act_podpisan', value);

  DateTime? get soglasiePodpisano => getField<DateTime>('soglasie_podpisano');
  set soglasiePodpisano(DateTime? value) =>
      setField<DateTime>('soglasie_podpisano', value);

  String? get vyhodnoyi => getField<String>('vyhodnoyi');
  set vyhodnoyi(String? value) => setField<String>('vyhodnoyi', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  bool? get actVypolnennyhRabot => getField<bool>('act_vypolnennyh_rabot');
  set actVypolnennyhRabot(bool? value) =>
      setField<bool>('act_vypolnennyh_rabot', value);

  String? get actVypolnennyhRabotUrl =>
      getField<String>('act_vypolnennyh_rabot_url');
  set actVypolnennyhRabotUrl(String? value) =>
      setField<String>('act_vypolnennyh_rabot_url', value);

  bool? get chek => getField<bool>('chek');
  set chek(bool? value) => setField<bool>('chek', value);

  String? get chekUrl => getField<String>('chek_url');
  set chekUrl(String? value) => setField<String>('chek_url', value);

  bool? get raspechatat => getField<bool>('raspechatat');
  set raspechatat(bool? value) => setField<bool>('raspechatat', value);

  String? get pechat => getField<String>('pechat');
  set pechat(String? value) => setField<String>('pechat', value);

  String? get idManager => getField<String>('id_manager');
  set idManager(String? value) => setField<String>('id_manager', value);

  String? get dataManager => getField<String>('data_manager');
  set dataManager(String? value) => setField<String>('data_manager', value);

  String? get roleAvtor => getField<String>('role_avtor');
  set roleAvtor(String? value) => setField<String>('role_avtor', value);

  int? get cardooCena => getField<int>('cardoo_cena');
  set cardooCena(int? value) => setField<int>('cardoo_cena', value);

  bool? get zagruzitDogovor => getField<bool>('zagruzit_dogovor');
  set zagruzitDogovor(bool? value) => setField<bool>('zagruzit_dogovor', value);

  bool? get zagruzitAkt => getField<bool>('zagruzit_akt');
  set zagruzitAkt(bool? value) => setField<bool>('zagruzit_akt', value);

  bool? get zagruzitSoglasie => getField<bool>('zagruzit_soglasie');
  set zagruzitSoglasie(bool? value) =>
      setField<bool>('zagruzit_soglasie', value);

  bool? get notification2hSent => getField<bool>('notification_2h_sent');
  set notification2hSent(bool? value) =>
      setField<bool>('notification_2h_sent', value);

  bool? get notificationOverdueSent =>
      getField<bool>('notification_overdue_sent');
  set notificationOverdueSent(bool? value) =>
      setField<bool>('notification_overdue_sent', value);

  bool? get yurlico => getField<bool>('yurlico');
  set yurlico(bool? value) => setField<bool>('yurlico', value);

  String? get idCompaniArenda => getField<String>('id_compani_arenda');
  set idCompaniArenda(String? value) =>
      setField<String>('id_compani_arenda', value);

  bool? get ds => getField<bool>('DS');
  set ds(bool? value) => setField<bool>('DS', value);

  String? get idContract => getField<String>('id_contract');
  set idContract(String? value) => setField<String>('id_contract', value);

  String? get dsUrl => getField<String>('ds_url');
  set dsUrl(String? value) => setField<String>('ds_url', value);

  String? get tpiDsUrl => getField<String>('tpi_ds_url');
  set tpiDsUrl(String? value) => setField<String>('tpi_ds_url', value);
}
