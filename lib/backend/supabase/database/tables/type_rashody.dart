import '../database.dart';

class TypeRashodyTable extends SupabaseTable<TypeRashodyRow> {
  @override
  String get tableName => 'type_rashody';

  @override
  TypeRashodyRow createRow(Map<String, dynamic> data) => TypeRashodyRow(data);
}

class TypeRashodyRow extends SupabaseDataRow {
  TypeRashodyRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TypeRashodyTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get tahometr => getField<bool>('tahometr');
  set tahometr(bool? value) => setField<bool>('tahometr', value);

  int? get code => getField<int>('code');
  set code(int? value) => setField<int>('code', value);

  String? get vidRashoda => getField<String>('vid_rashoda');
  set vidRashoda(String? value) => setField<String>('vid_rashoda', value);

  bool? get vidRashodaBool => getField<bool>('vid_rashoda_bool');
  set vidRashodaBool(bool? value) => setField<bool>('vid_rashoda_bool', value);
}
