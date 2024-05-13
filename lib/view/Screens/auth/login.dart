import 'package:flutter/material.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/view/Widgets/button_widget.dart';
import 'package:idirtrack/view/Widgets/server_utilisateur_switches.dart';
import 'package:idirtrack/view/Widgets/vertical_line.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;

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
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: kLoginScreenColor,
        body: AnimatedOpacity(
          duration: const Duration(milliseconds: 900),
          opacity: _isVisible ? 1.0 : 0.0,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Image(image: AssetImage('assets/images/Logo3.png')),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
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
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
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
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const SwitchTypes(),
                const SizedBox(height: 18),
                CustomizeButton(
                  label: "CONNEXION",
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  buttonColor: kButtonColor,
                  borderExist: false,
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
                          style: TextStyle(color: Colors.white, fontSize: 19)),
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
    );
  }
}
