import 'package:flutter/material.dart';
import 'Homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
          _inputField("Username"),
          _inputField("Password", isPassword: true),
          _elevatedButton("Login", context),
          Text(userController.text)
        ],
      ),
    );
  }

  Widget _inputField(
    String inputTitle, {
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: (isPassword) ? passController : userController,
        enabled: true,
        onChanged: (value) {},
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: inputTitle,
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  Widget _elevatedButton(String title, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if (userController.text == "aji" && passController.text == "123") {
            text = "Login Berhasil!";
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homepage()),
            );
          } else {
            text = "Login Gagal!";
          }
          setState(() {});

          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text(title),
      ),
    );
  }
}
