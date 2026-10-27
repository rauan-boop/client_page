import '../database.dart';

class RemindersTable extends SupabaseTable<RemindersRow> {
  @override
  String get tableName => 'reminders';

  @override
  RemindersRow createRow(Map<String, dynamic> data) => RemindersRow(data);
}

class RemindersRow extends SupabaseDataRow {
  RemindersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RemindersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  String? get poluchatel => getField<String>('poluchatel');
  set poluchatel(String? value) => setField<String>('poluchatel', value);

  int? get summa => getField<int>('summa');
  set summa(int? value) => setField<int>('summa', value);

  DateTime? get dateNachala => getField<DateTime>('date_nachala');
  set dateNachala(DateTime? value) => setField<DateTime>('date_nachala', value);

  DateTime? get dateOkonchaniya => getField<DateTime>('date_okonchaniya');
  set dateOkonchaniya(DateTime? value) =>
      setField<DateTime>('date_okonchaniya', value);

  String? get avtorId => getField<String>('avtor_id');
  set avtorId(String? value) => setField<String>('avtor_id', value);

  String? get period => getField<String>('period');
  set period(String? value) => setField<String>('period', value);

  String? get vidRashoda => getField<String>('vid_rashoda');
  set vidRashoda(String? value) => setField<String>('vid_rashoda', value);

  bool? get vidRashodaBool => getField<bool>('vid_rashoda_bool');
  set vidRashodaBool(bool? value) => setField<bool>('vid_rashoda_bool', value);
}
