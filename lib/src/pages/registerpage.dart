import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Register Now",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Create an Account now",
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            SizedBox(height: 10),
            Text(
              "Manage your life better today !!",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _username,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Enter Username Here ",
                labelStyle: TextStyle(color: Colors.white),

                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _password,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Enter Password Here ",
                labelStyle: TextStyle(color: Colors.white),

                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmPassword,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirm Your Password",
                labelStyle: TextStyle(color: Colors.white),

                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _userEmail,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Enter your Email",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                //Add action here !
              },
              child: const Text("Register Now"),
            ),
          ],
        ),
      ),
    );
  }
}
