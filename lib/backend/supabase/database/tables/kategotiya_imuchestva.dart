import '../database.dart';

class KategotiyaImuchestvaTable extends SupabaseTable<KategotiyaImuchestvaRow> {
  @override
  String get tableName => 'kategotiyaImuchestva';

  @override
  KategotiyaImuchestvaRow createRow(Map<String, dynamic> data) =>
      KategotiyaImuchestvaRow(data);
}

class KategotiyaImuchestvaRow extends SupabaseDataRow {
  KategotiyaImuchestvaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KategotiyaImuchestvaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get kategoriya => getField<String>('kategoriya');
  set kategoriya(String? value) => setField<String>('kategoriya', value);
}
