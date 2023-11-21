import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/components/buttons.dart';
import 'package:ui_one/features/auth/presentation/validator/auth_validator.dart';
import 'package:ui_one/service._locator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpGlobalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRetryController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController photoController = TextEditingController();

  bool passwordSee = true;
  bool passwordSee2 = true;
  File? _image; // Esta variable almacenará la imagen seleccionada


  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }



@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    resizeToAvoidBottomInset: false,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Form(
          key: _signUpGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  size: 30,
                ),
              ),
              const SizedBox(height: 30),
              ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.white,
                      ],
                    ).createShader(bounds);
                  },
                  child: const Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        "Crear Cuenta",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          // Color del texto
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 30),
              Column(
                children: [
                  TextFormField(
                    controller: emailController,
                      validator: AuthValidator.isEmailValid,
                      decoration: InputDecoration(
                        hintText: "Correo electronico",
                        hintStyle: TextStyle(color: Colors.white), // Color del texto de sugerencia
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Color de la línea
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white), // Color de la línea cuando está enfocado
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Color del texto del campo
                    ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: nameController,
                    validator: AuthValidator.isNameValid,
                    decoration: InputDecoration(
                      hintText: "Nombre del alumno",
                        hintStyle: TextStyle(color: Colors.white), // Color del texto de sugerencia
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Color de la línea
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white), // Color de la línea cuando está enfocado
                        ),
                      ),
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: matriculaController,
                    validator: AuthValidator.isNameValid,
                    decoration: InputDecoration(
                      hintText: "Matrícula",
                        hintStyle: TextStyle(color: Colors.white), // Color del texto de sugerencia
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Color de la línea
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white), // Color de la línea cuando está enfocado
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Color del texto del campo
                    ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: passwordController,
                    obscureText: passwordSee,
                    validator: AuthValidator.isPasswordValid,
                    decoration: InputDecoration(
                      hintText: "Crear contraseña",
                        hintStyle: TextStyle(color: Colors.white), // Color del texto de sugerencia
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Color de la línea
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white), // Color de la línea cuando está enfocado
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordSee = !passwordSee;
                            setState(() {});
                          },
                          child: Icon(
                            passwordSee
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey, // Color del icono de visibilidad
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Color del texto del campo
                    ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: passwordRetryController,
                    obscureText: passwordSee2,
                    validator: AuthValidator.isPasswordValid,
                    decoration: InputDecoration(
                      hintText: "Confirmar la contraseña",
                        hintStyle: TextStyle(color: Colors.white), // Color del texto de sugerencia
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Color de la línea
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white), // Color de la línea cuando está enfocado
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordSee2 = !passwordSee2;
                            setState(() {});
                          },
                          child: Icon(
                            passwordSee2
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey, // Color del icono de visibilidad
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Color del texto del campo
                    ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage, // Llamará a la función para seleccionar la imagen al tocar
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.photo_camera,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              ),
                  const SizedBox(height: 10),
                  MyButtonTwo(
                    text: "Crear",
                    onPressed: signUpButton,
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

  Future<void> signUpButton() async {
    if (_signUpGlobalKey.currentState!.validate()) {
      try {
        // Lógica para registro usando los controladores de texto
        // Lógica para mostrar el mensaje en un SnackBar
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordRetryController.dispose();
    super.dispose();
  }
}