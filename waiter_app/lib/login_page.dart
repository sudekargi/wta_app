import 'package:flutter/material.dart';
import 'package:waiter_app/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/loginUI.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Yönetici Girişi',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Kullanıcı Adı',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 128, 61, 56),
                      ),
                      child: Text('Giriş yap'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
