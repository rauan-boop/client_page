import '../database.dart';

class DailySummaryTable extends SupabaseTable<DailySummaryRow> {
  @override
  String get tableName => 'daily_summary';

  @override
  DailySummaryRow createRow(Map<String, dynamic> data) => DailySummaryRow(data);
}

class DailySummaryRow extends SupabaseDataRow {
  DailySummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailySummaryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get statsDate => getField<DateTime>('stats_date');
  set statsDate(DateTime? value) => setField<DateTime>('stats_date', value);

  String? get dayOfWeek => getField<String>('day_of_week');
  set dayOfWeek(String? value) => setField<String>('day_of_week', value);

  int? get totalIncome => getField<int>('total_income');
  set totalIncome(int? value) => setField<int>('total_income', value);

  int? get totalExpense => getField<int>('total_expense');
  set totalExpense(int? value) => setField<int>('total_expense', value);

  int? get kassa => getField<int>('kassa');
  set kassa(int? value) => setField<int>('kassa', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get idCompany => getField<String>('id_company');
  set idCompany(String? value) => setField<String>('id_company', value);

  String? get nameCompany => getField<String>('name_company');
  set nameCompany(String? value) => setField<String>('name_company', value);

  String? get idCityCompany => getField<String>('id_city_company');
  set idCityCompany(String? value) =>
      setField<String>('id_city_company', value);

  String? get cityCompany => getField<String>('city_company');
  set cityCompany(String? value) => setField<String>('city_company', value);

  bool? get isFinalized => getField<bool>('is_finalized');
  set isFinalized(bool? value) => setField<bool>('is_finalized', value);

  int? get incomeCash => getField<int>('income_cash');
  set incomeCash(int? value) => setField<int>('income_cash', value);

  int? get incomeBank => getField<int>('income_bank');
  set incomeBank(int? value) => setField<int>('income_bank', value);

  int? get expenseCash => getField<int>('expense_cash');
  set expenseCash(int? value) => setField<int>('expense_cash', value);

  int? get expenseBank => getField<int>('expense_bank');
  set expenseBank(int? value) => setField<int>('expense_bank', value);

  int? get cassaNal => getField<int>('cassa_nal');
  set cassaNal(int? value) => setField<int>('cassa_nal', value);

  int? get cassaBeznal => getField<int>('cassa_beznal');
  set cassaBeznal(int? value) => setField<int>('cassa_beznal', value);
}
