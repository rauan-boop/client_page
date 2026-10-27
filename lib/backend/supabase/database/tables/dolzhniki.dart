import '../database.dart';

class DolzhnikiTable extends SupabaseTable<DolzhnikiRow> {
  @override
  String get tableName => 'dolzhniki';

  @override
  DolzhnikiRow createRow(Map<String, dynamic> data) => DolzhnikiRow(data);
}

class DolzhnikiRow extends SupabaseDataRow {
  DolzhnikiRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DolzhnikiTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idClienta => getField<String>('id_clienta');
  set idClienta(String? value) => setField<String>('id_clienta', value);

  String? get dataClient => getField<String>('data_client');
  set dataClient(String? value) => setField<String>('data_client', value);

  String? get numberDogovor => getField<String>('number_dogovor');
  set numberDogovor(String? value) => setField<String>('number_dogovor', value);

  String? get numberPfone => getField<String>('number_pfone');
  set numberPfone(String? value) => setField<String>('number_pfone', value);

  String? get opisanie => getField<String>('opisanie');
  set opisanie(String? value) => setField<String>('opisanie', value);

  int? get summa => getField<int>('summa');
  set summa(int? value) => setField<int>('summa', value);

  List<String> get images => getListField<String>('images');
  set images(List<String>? value) => setListField<String>('images', value);

  String? get idCompany => getField<String>('id_company');
  set idCompany(String? value) => setField<String>('id_company', value);

  String? get idCityCompany => getField<String>('id_city_company');
  set idCityCompany(String? value) =>
      setField<String>('id_city_company', value);

  String? get idManager => getField<String>('id_manager');
  set idManager(String? value) => setField<String>('id_manager', value);

  String? get dataManager => getField<String>('data_manager');
  set dataManager(String? value) => setField<String>('data_manager', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  int? get summaVozvrata => getField<int>('summa_vozvrata');
  set summaVozvrata(int? value) => setField<int>('summa_vozvrata', value);

  DateTime? get dateVozvrata => getField<DateTime>('date_vozvrata');
  set dateVozvrata(DateTime? value) =>
      setField<DateTime>('date_vozvrata', value);

  String? get idDogovor => getField<String>('id_dogovor');
  set idDogovor(String? value) => setField<String>('id_dogovor', value);

  String? get idDolga => getField<String>('id_dolga');
  set idDolga(String? value) => setField<String>('id_dolga', value);

  DateTime? get dateDolga => getField<DateTime>('date_dolga');
  set dateDolga(DateTime? value) => setField<DateTime>('date_dolga', value);

  DateTime? get dateStart => getField<DateTime>('date_start');
  set dateStart(DateTime? value) => setField<DateTime>('date_start', value);

  DateTime? get dateEnd => getField<DateTime>('date_end');
  set dateEnd(DateTime? value) => setField<DateTime>('date_end', value);
}
