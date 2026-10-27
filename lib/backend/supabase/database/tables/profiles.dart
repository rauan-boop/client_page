import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get familiya => getField<String>('familiya');
  set familiya(String? value) => setField<String>('familiya', value);

  String? get imya => getField<String>('imya');
  set imya(String? value) => setField<String>('imya', value);

  String? get otchestvo => getField<String>('otchestvo');
  set otchestvo(String? value) => setField<String>('otchestvo', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get iin => getField<String>('IIN');
  set iin(String? value) => setField<String>('IIN', value);

  DateTime? get dateRozhdeniya => getField<DateTime>('dateRozhdeniya');
  set dateRozhdeniya(DateTime? value) =>
      setField<DateTime>('dateRozhdeniya', value);

  String? get telefon => getField<String>('telefon');
  set telefon(String? value) => setField<String>('telefon', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get numberUdostLichnosti => getField<String>('numberUdostLichnosti');
  set numberUdostLichnosti(String? value) =>
      setField<String>('numberUdostLichnosti', value);

  String? get kemVydan => getField<String>('kemVydan');
  set kemVydan(String? value) => setField<String>('kemVydan', value);

  DateTime? get kogdaVudan => getField<DateTime>('kogdaVudan');
  set kogdaVudan(DateTime? value) => setField<DateTime>('kogdaVudan', value);

  String? get adrespropiski => getField<String>('adrespropiski');
  set adrespropiski(String? value) => setField<String>('adrespropiski', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get cityId => getField<String>('city_id');
  set cityId(String? value) => setField<String>('city_id', value);

  String? get pasword => getField<String>('pasword');
  set pasword(String? value) => setField<String>('pasword', value);

  int? get ficsirovannayaPlata => getField<int>('ficsirovannaya_plata');
  set ficsirovannayaPlata(int? value) =>
      setField<int>('ficsirovannaya_plata', value);

  int? get procent => getField<int>('procent');
  set procent(int? value) => setField<int>('procent', value);

  String? get companiName => getField<String>('compani_name');
  set companiName(String? value) => setField<String>('compani_name', value);

  String? get companiId => getField<String>('compani_id');
  set companiId(String? value) => setField<String>('compani_id', value);

  String? get codDogovora => getField<String>('cod_dogovora');
  set codDogovora(String? value) => setField<String>('cod_dogovora', value);
}
