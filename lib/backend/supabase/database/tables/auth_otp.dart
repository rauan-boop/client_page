import '../database.dart';

class AuthOtpTable extends SupabaseTable<AuthOtpRow> {
  @override
  String get tableName => 'auth_otp';

  @override
  AuthOtpRow createRow(Map<String, dynamic> data) => AuthOtpRow(data);
}

class AuthOtpRow extends SupabaseDataRow {
  AuthOtpRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AuthOtpTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get phone => getField<String>('phone')!;
  set phone(String value) => setField<String>('phone', value);

  String get code => getField<String>('code')!;
  set code(String value) => setField<String>('code', value);

  int? get attempts => getField<int>('attempts');
  set attempts(int? value) => setField<int>('attempts', value);

  DateTime get expiresAt => getField<DateTime>('expires_at')!;
  set expiresAt(DateTime value) => setField<DateTime>('expires_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
