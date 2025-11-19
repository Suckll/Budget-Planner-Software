import 'package:flutter/material.dart';
import 'package:flutter_application/src/db/app_db.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double income = 0;
  double expense = 0;
  List<Map<String, dynamic>> recent = [];

  @override
  void initState() {
    super.initState();
    _loadDashboard();
  }

  Future<void> _loadDashboard() async {
    final list = await AppDb.instance.getTransactions();

    double inc = 0;
    double exp = 0;

    for (final t in list) {
      if (t['type'] == 'income') inc += t['amount'];
      if (t['type'] == 'expense') exp += t['amount'];
    }

    recent = list.take(3).toList();

    setState(() {
      income = inc;
      expense = exp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final balance = income - expense;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Dashboard",
            style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Card Backround
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Balance",
                      style:
                          TextStyle(color: Colors.grey[400], fontSize: 14)),
                  const SizedBox(height: 5),
                  Text(
                    balance.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //Expenses and Income 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("Income",
                        style: TextStyle(color: Colors.grey[400])),
                    Text(
                      income.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("Expense",
                        style: TextStyle(color: Colors.grey[400])),
                    Text(
                      expense.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Mini recent transaction header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Transactions",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold), 
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "/transactions"),
                  child: const Text("See All →",
                      style: TextStyle(color: Colors.blueAccent)),
                )
              ],
            ),

            // mini Recent transaction list
            Expanded(
              child: recent.isEmpty
                  ? const Text(
                      "No recent transactions",
                      style: TextStyle(color: Colors.white70),
                    )
                  : ListView.builder(
                      itemCount: recent.length,
                      itemBuilder: (context, index) {
                        final t = recent[index];
                        return ListTile(
                          title: Text(t['note'],
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text('${t['type']} - ${t['category']}',
                              style: TextStyle(color: Colors.grey[400])),
                          trailing: Text(
                            t['amount'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 10),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Add trancations button
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      await Navigator.pushNamed(context, '/add');
                      _loadDashboard(); // refresh after returning
                    },
                    child: const Text("Add Transaction"),
                  ),
                ),

                const SizedBox(width: 10),

                // view transaction button
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[850],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () async {
                      await Navigator.pushNamed(context, '/transactions');
                      _loadDashboard();
                      setState(() {});
                    },
                    child: const Text("View Transactions"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
