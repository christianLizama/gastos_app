import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:gastos_app/src/services/user_services.dart';
import 'dart:io';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  // final TextEditingController _textFieldController3 = TextEditingController();
  // final TextEditingController _textFieldController4 = TextEditingController();
  // final TextEditingController _textFieldController5 = TextEditingController();
  File? _image;

  Future _getImage() async {
    var statusCamera = await Permission.camera.status;
    var statusStorage = await Permission.storage.status;

    if (statusCamera.isDenied || statusStorage.isDenied) {
      await Permission.camera.request();
      await Permission.storage.request();
    }

    final picker = ImagePicker();
    if (!mounted) return;
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccionar fuente de imagen'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
              child: const Text('Galería'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(ImageSource.camera),
              child: const Text('Cámara'),
            ),
          ],
        );
      },
    );

    if (imageSource != null) {
      final pickedFile = await picker.pickImage(source: imageSource);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTextFieldWithImage('Dato 1', _textFieldController1),
              _buildTextFieldWithImage('Dato 2', _textFieldController2),
              // _buildTextFieldWithImage('Dato 3', _textFieldController3),
              // _buildTextFieldWithImage('Dato 4', _textFieldController4),
              // _buildTextFieldWithImage('Dato 5', _textFieldController5),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  UserServices userServices = UserServices();
                  if (_formKey.currentState!.validate()) {
                    userServices.addUser(
                      dato1: _textFieldController1.text,
                      dato2: _textFieldController2.text,
                    );
                    //limpiar campos
                    _textFieldController1.clear();
                    _textFieldController2.clear();
                    //cerrar teclado 
                    FocusScope.of(context).unfocus();
                    //Mostrar dialogo de confirmación
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Datos enviados'),
                          content: const Text('Los datos han sido enviados'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Aceptar'),
                            ),
                          ],
                        );
                      },
                    );
                    
                  }
                },
                child: const Text('Enviar Datos'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.work),
                onPressed: () {
                  Navigator.pushNamed(context, 'services');
                },
              ),
              IconButton(
                icon: const Icon(Icons.group),
                onPressed: () {
                  Navigator.pushNamed(context, 'team');
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, 'profile');
                },
              ),
              IconButton(
                icon: const Icon(Icons.error),
                onPressed: () {
                  Navigator.pushNamed(context, 'nothing');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithImage(
      String labelText, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: labelText),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo requerido';
              }
              return null;
            },
          ),
        ),
        // IconButton(
        //   icon: const Icon(Icons.photo_camera),
        //   onPressed: () {
        //     _getImage();
        //   },
        // ),
      ],
    );
  }
}
