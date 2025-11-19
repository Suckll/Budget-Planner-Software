import 'package:flutter/material.dart';
import 'src/pages/dashboard_page.dart';
import 'src/pages/add_transaction_page.dart';
import 'src/pages/transactions_page.dart';
import 'src/pages/login_page.dart';


List<Map<String, dynamic>> transactions = [];

void main() {
  runApp(const BudgetApp());
}


class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      
      initialRoute: '/login',
      routes: {
        '/login' : (_) => const LoginPage(),
        '/': (_) => const DashboardPage(),
        '/add': (_) => const AddTransactionPage(),
        '/transactions': (_) => const TransactionsPage(),
      },
    );
  }
}
