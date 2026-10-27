import '../database.dart';

class ClientStatsTable extends SupabaseTable<ClientStatsRow> {
  @override
  String get tableName => 'client_stats';

  @override
  ClientStatsRow createRow(Map<String, dynamic> data) => ClientStatsRow(data);
}

class ClientStatsRow extends SupabaseDataRow {
  ClientStatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientStatsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get totalClients => getField<int>('total_clients');
  set totalClients(int? value) => setField<int>('total_clients', value);

  int? get blacklisted => getField<int>('blacklisted');
  set blacklisted(int? value) => setField<int>('blacklisted', value);

  int? get newClients30d => getField<int>('new_clients_30d');
  set newClients30d(int? value) => setField<int>('new_clients_30d', value);
}
