import '../database.dart';

class KppTable extends SupabaseTable<KppRow> {
  @override
  String get tableName => 'kpp';

  @override
  KppRow createRow(Map<String, dynamic> data) => KppRow(data);
}

class KppRow extends SupabaseDataRow {
  KppRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KppTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get variantKPP => getField<String>('variantKPP');
  set variantKPP(String? value) => setField<String>('variantKPP', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
