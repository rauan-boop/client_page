import '../database.dart';

class OtpBufferTable extends SupabaseTable<OtpBufferRow> {
  @override
  String get tableName => 'otp_buffer';

  @override
  OtpBufferRow createRow(Map<String, dynamic> data) => OtpBufferRow(data);
}

class OtpBufferRow extends SupabaseDataRow {
  OtpBufferRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OtpBufferTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);
}
