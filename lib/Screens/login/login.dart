import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/Widgets/button_widget.dart';
import 'package:idirtrack/Widgets/server_utilisateur_switches.dart';
import 'package:idirtrack/Widgets/vertical_line.dart';
import 'package:idirtrack/models/location.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;
  bool _hasError = false; // Track if there is an error
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: kLoginScreenColor,
        body: AnimatedOpacity(
          duration: const Duration(milliseconds: 900),
          opacity: _isVisible ? 1.0 : 0.0,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Image(image: AssetImage('assets/images/Logo3.png')),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: usernameController,
                      decoration: InputDecoration(
                        fillColor: kInputsColor,
                        filled: true,
                        labelText: "NOM D'UTILISATEUR",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: kIconColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _hasError ? Colors.red : kIconColor,
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kInputsColor,
                        labelText: "MOT DE PASS",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: kIconColor,
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off,
                          color: kIconColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _hasError ? Colors.red : kIconColor,
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const SwitchTypes(),
                  const SizedBox(height: 18),
                  CustomizeButton(
                    label: "CONNEXION",
                    onPressed: () {
                      String username = usernameController.text;
                      String password = passwordController.text;
                      Location location = Location(
                        username,
                        password,
                      );
                      if (location.username == 'admin' &&
                          location.password == 'admin') {
                        setState(() {
                          _hasError = false;
                        });
                        Navigator.pushNamed(context, '/PrincipalePage');
                      } else {
                        setState(() {
                          _hasError = true;
                        });
                      }
                    },
                    buttonColor: kButtonColor,
                    borderExist: false,
                  ),
                  if (_hasError) // Display error message if there is an error
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Something is wrong. Please try again.',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Row(
                      children: [
                        VerticalLine(
                          height: 2,
                          strokeWidth: 158,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text('OU',
                            style:
                                TextStyle(color: Colors.white, fontSize: 19)),
                        SizedBox(width: 10),
                        VerticalLine(
                          height: 2,
                          strokeWidth: 158,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomizeButton(
                    label: "CONTACTER LE SUPPORT",
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    buttonColor: kButtonTwoColor,
                    borderExist: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}