import 'package:flutter/material.dart';
import 'package:flutter_application_1/sing_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
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
                    SizedBox(height: 16.0),
                  ],
                ),
                TextField(
                  autofocus: true,
                  style: TextStyle(color: Colors.white),
                  controller: _usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.white), // Cor do ícone
                    labelText: 'Digite seu e-mail: exemplo@gmail.com',
                    labelStyle: TextStyle(color: Colors.white), // Cor do texto do label
                    hintStyle: TextStyle(color: Colors.white), // Cor do texto de dica
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
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.white), // Cor do ícone
                    labelText: 'Digite sua senha: ',
                    labelStyle: TextStyle(color: Colors.white), // Cor do texto do label
                    hintStyle: TextStyle(color: Colors.white), // Cor do texto de dica
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Adicione sua lógica de autenticação aqui
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    // Exemplo de impressão dos dados
                    print('Username: $username');
                    print('Password: $password');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade900, // Cor azul escuro
                  ),
                  child: Text(
                    'Entrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10.0),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroPage()));
                    },
                    child: Text(
                    'CADASTRE-SE',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                      ),
                    ),
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook, color: Colors.white), // Cor do ícone do Facebook
                      onPressed: () {
                        print('Entrando com Facebook');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.apple_rounded, color: Colors.white), // Cor do ícone do Google
                      onPressed: () {
                        // Adicione a lógica do botão do Google aqui
                        print('Botão do Google pressionado');
                        // Adicione sua lógica de autenticação do Google
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
