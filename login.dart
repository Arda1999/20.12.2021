import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


/*void main() {
  runApp(const LoginApp());
}
*/
class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
       
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
    final response = await http.post(Uri.parse("http://localhost/deneme/login.php"), 
    body: {
      'username': user.text,
      'password': pass.text,
    });
    var data = json.decode(response.body);
    if (data[0]['level'] == 'a') {
      print(data);
    } else {
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          TextFormField(
            controller: user,
            decoration: const InputDecoration(
              icon: Icon(Icons.mail_outline),
              hintText: 'Kullanıcı Adı',
            ),
          ),
          TextFormField(
            controller: pass,
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.vpn_key),
              hintText: 'Sifre',
            ),
          ),
          ElevatedButton(
            //color: Colors.blue,
            child: const Text('Giris'),
            onPressed: () {
              register();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}