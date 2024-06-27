import 'package:flutter/material.dart';
import 'package:idirtrack/Screens/home/principale_page_screen.dart';
import 'package:idirtrack/Widgets/button_widget.dart';
import 'package:idirtrack/Widgets/server_switch_user.dart';
import 'package:idirtrack/Widgets/vertical_line.dart';
import 'package:idirtrack/constant.dart';
import 'package:idirtrack/global/global_state.dart';
import 'package:idirtrack/providers/sing_in_provider.dart';
import 'package:idirtrack/providers/vehicle_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    loginProvider.initializeVisibility();

    return Scaffold(
      backgroundColor: kLoginScreenColor,
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 900),
        opacity: loginProvider.isVisible ? 1.0 : 0.0,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Image(
                  image: AssetImage('assets/images/Logo3.png'),
                  height: 170,
                  width: 170,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: loginProvider.usernameController,
                    decoration: InputDecoration(
                      fillColor: kInputsColor,
                      filled: true,
                      labelText: "NOM D'UTILISATEUR",
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.person, color: kIconColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              loginProvider.hasError ? Colors.red : kIconColor,
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
                    controller: loginProvider.passwordController,
                    obscureText: loginProvider.obscureText,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kInputsColor,
                      labelText: "MOT DE PASS",
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.lock, color: kIconColor),
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginProvider.obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        color: kIconColor,
                        onPressed: loginProvider.toggleVisibility,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              loginProvider.hasError ? Colors.red : kIconColor,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                buildSwitchTypes(context),
                const SizedBox(height: 18),
                buildCustomizeButton(
                  label: "CONNEXION",
                  onPressed: () async {
                    final location = await loginProvider.authenticate(context);
                    if (location != null) {
                      // ignore: use_build_context_synchronously
                      Provider.of<GlobalState>(context, listen: false)
                          .setLocation(location);

                      if (!context.mounted) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (_) =>
                                    VehicleProvider(location.id as int),
                              ),
                            ],
                            child: PrincipalePage(location: location),
                          ),
                        ),
                      );
                    }
                  },
                  buttonColor: kButtonColor,
                  borderExist: false,
                ),
                if (loginProvider.hasError)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Something is wrong. Please try again.',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Row(
                    children: [
                      verticalLine(
                        height: 2,
                        strokeWidth: 158,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      const Text('OU',
                          style: TextStyle(color: Colors.white, fontSize: 19)),
                      const SizedBox(width: 10),
                      verticalLine(
                          height: 2, strokeWidth: 158, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                buildCustomizeButton(
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
