import '../database.dart';

class DogovorSubarendyTable extends SupabaseTable<DogovorSubarendyRow> {
  @override
  String get tableName => 'dogovor_subarendy';

  @override
  DogovorSubarendyRow createRow(Map<String, dynamic> data) =>
      DogovorSubarendyRow(data);
}

class DogovorSubarendyRow extends SupabaseDataRow {
  DogovorSubarendyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DogovorSubarendyTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get companyId => getField<String>('company_id');
  set companyId(String? value) => setField<String>('company_id', value);

  String? get companiName => getField<String>('compani_name');
  set companiName(String? value) => setField<String>('compani_name', value);

  String? get dirFamiliya => getField<String>('dir_familiya');
  set dirFamiliya(String? value) => setField<String>('dir_familiya', value);

  String? get dirImya => getField<String>('dir_imya');
  set dirImya(String? value) => setField<String>('dir_imya', value);

  String? get dirOtchestvo => getField<String>('dir_otchestvo');
  set dirOtchestvo(String? value) => setField<String>('dir_otchestvo', value);

  String? get dirIin => getField<String>('dir_iin');
  set dirIin(String? value) => setField<String>('dir_iin', value);

  String? get dirNomberDoc => getField<String>('dir_nomber_doc');
  set dirNomberDoc(String? value) => setField<String>('dir_nomber_doc', value);

  String? get dirKemVydan => getField<String>('dir_kem_vydan');
  set dirKemVydan(String? value) => setField<String>('dir_kem_vydan', value);

  DateTime? get dirKogdaVydan => getField<DateTime>('dir_kogda_vydan');
  set dirKogdaVydan(DateTime? value) =>
      setField<DateTime>('dir_kogda_vydan', value);

  String? get partFamiliya => getField<String>('part_familiya');
  set partFamiliya(String? value) => setField<String>('part_familiya', value);

  String? get partImya => getField<String>('part_imya');
  set partImya(String? value) => setField<String>('part_imya', value);

  String? get partOtchestvo => getField<String>('part_otchestvo');
  set partOtchestvo(String? value) => setField<String>('part_otchestvo', value);

  String? get partIin => getField<String>('part_iin');
  set partIin(String? value) => setField<String>('part_iin', value);

  String? get partTelefone => getField<String>('part_telefone');
  set partTelefone(String? value) => setField<String>('part_telefone', value);

  String? get partNomerDoc => getField<String>('part_nomer_doc');
  set partNomerDoc(String? value) => setField<String>('part_nomer_doc', value);

  DateTime? get partKogdaVydan => getField<DateTime>('part_kogda_vydan');
  set partKogdaVydan(DateTime? value) =>
      setField<DateTime>('part_kogda_vydan', value);

  String? get partKemVydan => getField<String>('part_kem_vydan');
  set partKemVydan(String? value) => setField<String>('part_kem_vydan', value);

  String? get partId => getField<String>('part_id');
  set partId(String? value) => setField<String>('part_id', value);

  String? get avtoId => getField<String>('avto_id');
  set avtoId(String? value) => setField<String>('avto_id', value);

  String? get avtoMarka => getField<String>('avto_marka');
  set avtoMarka(String? value) => setField<String>('avto_marka', value);

  String? get avtoModel => getField<String>('avto_model');
  set avtoModel(String? value) => setField<String>('avto_model', value);

  String? get avtoGosNomer => getField<String>('avto_gos_nomer');
  set avtoGosNomer(String? value) => setField<String>('avto_gos_nomer', value);

  String? get avtoVin => getField<String>('avto_vin');
  set avtoVin(String? value) => setField<String>('avto_vin', value);

  String? get avtoGodVypuska => getField<String>('avto_god_vypuska');
  set avtoGodVypuska(String? value) =>
      setField<String>('avto_god_vypuska', value);

  String? get avtoCvet => getField<String>('avto_cvet');
  set avtoCvet(String? value) => setField<String>('avto_cvet', value);

  String? get avtoTehPasport => getField<String>('avto_teh_pasport');
  set avtoTehPasport(String? value) =>
      setField<String>('avto_teh_pasport', value);

  String? get avtoToplivo => getField<String>('avto_toplivo');
  set avtoToplivo(String? value) => setField<String>('avto_toplivo', value);

  String? get avtoCena => getField<String>('avto_cena');
  set avtoCena(String? value) => setField<String>('avto_cena', value);

  String? get logotipUrl => getField<String>('logotip_url');
  set logotipUrl(String? value) => setField<String>('logotip_url', value);

  String? get prchatUrl => getField<String>('prchat_url');
  set prchatUrl(String? value) => setField<String>('prchat_url', value);

  bool? get raspechatat => getField<bool>('raspechatat');
  set raspechatat(bool? value) => setField<bool>('raspechatat', value);

  bool? get ficsa => getField<bool>('ficsa');
  set ficsa(bool? value) => setField<bool>('ficsa', value);

  String? get oplataFics => getField<String>('oplata_fics');
  set oplataFics(String? value) => setField<String>('oplata_fics', value);

  String? get oplataProc => getField<String>('oplata_proc');
  set oplataProc(String? value) => setField<String>('oplata_proc', value);

  DateTime? get dataReg => getField<DateTime>('data_reg');
  set dataReg(DateTime? value) => setField<DateTime>('data_reg', value);

  DateTime? get dataOkonchaniya => getField<DateTime>('data_okonchaniya');
  set dataOkonchaniya(DateTime? value) =>
      setField<DateTime>('data_okonchaniya', value);

  String? get dogovorUrl => getField<String>('dogovor_url');
  set dogovorUrl(String? value) => setField<String>('dogovor_url', value);

  String? get tpiDogovorSubarendy => getField<String>('tpi_dogovor_subarendy');
  set tpiDogovorSubarendy(String? value) =>
      setField<String>('tpi_dogovor_subarendy', value);

  String? get dogovorSubarendyCod => getField<String>('dogovor_subarendy_cod');
  set dogovorSubarendyCod(String? value) =>
      setField<String>('dogovor_subarendy_cod', value);

  String? get huchSoglasie => getField<String>('huch_soglasie');
  set huchSoglasie(String? value) => setField<String>('huch_soglasie', value);

  bool? get viewedDogovor => getField<bool>('viewed_dogovor');
  set viewedDogovor(bool? value) => setField<bool>('viewed_dogovor', value);

  String? get ipDevaice => getField<String>('ip_devaice');
  set ipDevaice(String? value) => setField<String>('ip_devaice', value);

  String? get devaiceInfo => getField<String>('devaice_info');
  set devaiceInfo(String? value) => setField<String>('devaice_info', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);
}
