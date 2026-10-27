import '../database.dart';

class KategoriyaNapominaniyaTable
    extends SupabaseTable<KategoriyaNapominaniyaRow> {
  @override
  String get tableName => 'kategoriya_napominaniya';

  @override
  KategoriyaNapominaniyaRow createRow(Map<String, dynamic> data) =>
      KategoriyaNapominaniyaRow(data);
}

class KategoriyaNapominaniyaRow extends SupabaseDataRow {
  KategoriyaNapominaniyaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KategoriyaNapominaniyaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get kategoriya => getField<String>('kategoriya');
  set kategoriya(String? value) => setField<String>('kategoriya', value);
}
