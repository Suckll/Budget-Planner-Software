import 'package:flutter/material.dart';
import 'package:flutter_application/src/db/app_db.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<Map<String, dynamic>> transactions = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    transactions = await AppDb.instance.getTransactions();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Transactions', style: TextStyle(color: Colors.white)),
      ),
      body: transactions.isEmpty
          ? const Center(
              child: Text('No transactions yet', style: TextStyle(color: Colors.white70)))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final t = transactions[index];

                return Dismissible(
                  key: Key(t['id'].toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white, size: 28),
                  ),
                  onDismissed: (_) async {
                    await AppDb.instance.deleteTransaction(t['id']);
                    setState(() => transactions.removeAt(index));
                    

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Transaction deleted")),
                    );
                  },
                  child: Card(
                    color: const Color(0xFF1E1E1E),
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      title: Text(
                        '${t['note']} - ${t['amount']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${t['type']} - ${t['category']}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
