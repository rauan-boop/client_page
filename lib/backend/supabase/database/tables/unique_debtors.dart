import '../database.dart';

class UniqueDebtorsTable extends SupabaseTable<UniqueDebtorsRow> {
  @override
  String get tableName => 'unique_debtors';

  @override
  UniqueDebtorsRow createRow(Map<String, dynamic> data) =>
      UniqueDebtorsRow(data);
}

class UniqueDebtorsRow extends SupabaseDataRow {
  UniqueDebtorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UniqueDebtorsTable();

  String? get idClienta => getField<String>('id_clienta');
  set idClienta(String? value) => setField<String>('id_clienta', value);

  String? get dataClient => getField<String>('data_client');
  set dataClient(String? value) => setField<String>('data_client', value);

  String? get numberPfone => getField<String>('number_pfone');
  set numberPfone(String? value) => setField<String>('number_pfone', value);

  String? get idCityCompany => getField<String>('id_city_company');
  set idCityCompany(String? value) =>
      setField<String>('id_city_company', value);

  String? get idCompany => getField<String>('id_company');
  set idCompany(String? value) => setField<String>('id_company', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
