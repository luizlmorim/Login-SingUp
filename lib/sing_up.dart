import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<CadastroPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(8, 2, 86, 1),
                Color.fromRGBO(8, 2, 86, 0.5),
              ],
            ),
          ),

        
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/LogoApp.png'),
                    SizedBox(height: 18.0),
                  ],
                ),
                TextField(
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    labelText: 'Digite seu nome:',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                    labelText: 'Digite seu e-mail: exemplo@gmail.com',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  obscureText: true,
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
                    labelText: 'Digite sua senha: ',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  obscureText: true,
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
                    labelText: 'Confirme sua senha: ',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String confirmPassword = _confirmPasswordController.text;

                    // Exemplo de impressão dos dados
                    print('Username: $username');
                    print('Email: $email');
                    print('Password: $password');
                    print('Confirm Password: $confirmPassword');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade900,
                  ),
                  child: Text(
                    'Cadastrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}
