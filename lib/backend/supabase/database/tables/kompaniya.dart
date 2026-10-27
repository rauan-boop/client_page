import '../database.dart';

class KompaniyaTable extends SupabaseTable<KompaniyaRow> {
  @override
  String get tableName => 'kompaniya';

  @override
  KompaniyaRow createRow(Map<String, dynamic> data) => KompaniyaRow(data);
}

class KompaniyaRow extends SupabaseDataRow {
  KompaniyaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KompaniyaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameCompani => getField<String>('nameCompani');
  set nameCompani(String? value) => setField<String>('nameCompani', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  String? get hozyain => getField<String>('hozyain');
  set hozyain(String? value) => setField<String>('hozyain', value);

  String? get hozyainId => getField<String>('hozyain_id');
  set hozyainId(String? value) => setField<String>('hozyain_id', value);

  String? get hoziainImya => getField<String>('hoziain_imya');
  set hoziainImya(String? value) => setField<String>('hoziain_imya', value);

  String? get hozyainTel => getField<String>('hozyain_tel');
  set hozyainTel(String? value) => setField<String>('hozyain_tel', value);

  String? get adresCompany => getField<String>('adres_company');
  set adresCompany(String? value) => setField<String>('adres_company', value);

  String? get iinBin => getField<String>('iin/bin');
  set iinBin(String? value) => setField<String>('iin/bin', value);

  String? get kbe => getField<String>('kbe');
  set kbe(String? value) => setField<String>('kbe', value);

  String? get bank => getField<String>('bank');
  set bank(String? value) => setField<String>('bank', value);

  String? get bik => getField<String>('bik');
  set bik(String? value) => setField<String>('bik', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telephone => getField<String>('telephone');
  set telephone(String? value) => setField<String>('telephone', value);

  String? get hozyainOtchestvo => getField<String>('hozyain_otchestvo');
  set hozyainOtchestvo(String? value) =>
      setField<String>('hozyain_otchestvo', value);

  String? get numberDoc => getField<String>('number_doc');
  set numberDoc(String? value) => setField<String>('number_doc', value);

  String? get kemVydan => getField<String>('kem_vydan');
  set kemVydan(String? value) => setField<String>('kem_vydan', value);

  DateTime? get kogdaVydan => getField<DateTime>('kogda_vydan');
  set kogdaVydan(DateTime? value) => setField<DateTime>('kogda_vydan', value);

  String? get iik => getField<String>('iik');
  set iik(String? value) => setField<String>('iik', value);

  String? get nomerTalona => getField<String>('nomer_talona');
  set nomerTalona(String? value) => setField<String>('nomer_talona', value);

  DateTime? get dataVydachiTalona => getField<DateTime>('data_vydachi_talona');
  set dataVydachiTalona(DateTime? value) =>
      setField<DateTime>('data_vydachi_talona', value);

  String? get pechat => getField<String>('pechat');
  set pechat(String? value) => setField<String>('pechat', value);

  String? get binCompany => getField<String>('bin_company');
  set binCompany(String? value) => setField<String>('bin_company', value);

  List<String> get document => getListField<String>('document');
  set document(List<String>? value) => setListField<String>('document', value);
}
