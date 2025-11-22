import 'package:flutter/material.dart';
import 'src/pages/dashboard_page.dart';
import 'src/pages/add_transaction_page.dart';
import 'src/pages/transactions_page.dart';
import 'src/pages/login_page.dart';
import 'src/pages/registerpage.dart'; // make sure this file exists

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
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/': (_) => const DashboardPage(),
        '/add': (_) => const AddTransactionPage(),
        '/transactions': (_) => const TransactionsPage(),
        '/register': (_) => const RegisterPage(),
      },
    );
  }
}
