import 'package:flutter/material.dart';


class LoginComponent extends StatefulWidget {
  final Function(String, String) onSubmit;

  const LoginComponent({super.key, required this.onSubmit});

  @override
  State<StatefulWidget> createState() => _LoginComponent();
}

class _LoginComponent extends State<LoginComponent> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.white,
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
                      backgroundColor: Colors.blue, // Color de fondo del botón
                      elevation: 3.0, // Agrega una sombra al botón
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(_email);
                        _formKey.currentState!.save();
                        widget.onSubmit(_email, _password);
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
    );
  }
}
