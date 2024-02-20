import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gastos_app/src/pages/home_page.dart';
import 'package:gastos_app/src/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _LoginComponent();
}

class _LoginComponent extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  User? _user;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 233, 235, 250),
              Colors.purple
            ], // Colores del gradiente
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'RINDE RUIZ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.request_quote,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 70.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Ajusta el color según tus preferencias
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                      const SizedBox(height: 40.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          backgroundColor:
                              Colors.blue, // Color de fondo del botón
                          elevation: 3.0, // Agrega una sombra al botón
                        ),
                        onPressed: () async{
                          if (_formKey.currentState!.validate())  {
                            await AuthServices().signInUser(
                              _email,
                              _password,
                            );
                            User? user = FirebaseAuth.instance.currentUser;

                            setState(() {
                              _user = user;
                            });

                            if (_user != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
