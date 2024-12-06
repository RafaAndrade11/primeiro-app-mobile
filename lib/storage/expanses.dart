import 'package:primeiroapp/models/monthly_expanses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<List<MonthlyExpanses>> loadLocalExpenses() async {
  final prefs = await SharedPreferences.getInstance();
  final String? savedExpenses = prefs.getString('monthly_expenses');

  if (savedExpenses != null) {
    final List<dynamic> expensesJson = jsonDecode(savedExpenses);
    return expensesJson
        .map((e) => MonthlyExpanses.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  return [];
}

Future<void> saveLocalExpenses(List<MonthlyExpanses> expenses) async {
  final prefs = await SharedPreferences.getInstance();
  final String expensesJson =
      jsonEncode(expenses.map((e) => e.toJson()).toList());
  await prefs.setString('monthly_expenses', expensesJson);
}
