import 'package:booktrip/constant.dart';
import 'package:booktrip/screen/home_screen.dart';
import 'package:booktrip/screen/landing/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/3.jpg"), fit: BoxFit.cover)),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Container(
                    height: kDefaultPadding * 18,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(1, 4), // changes position of shadow
                          )
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BookTrip',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.blue.withOpacity(0.8),
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: TextFormField(
                              autofocus: false,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please Enter Your Email");
                                }
                                // reg expression for email validation
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please Enter a valid email");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8)),
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.mail, color: Colors.blue),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 15, 20, 15),
                                label: Text("Email"),
                                labelStyle: TextStyle(
                                    color: Colors.blue.withOpacity(0.8)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: TextFormField(
                              autofocus: false,
                              controller: passwordController,
                              obscureText: true,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Password is required for login");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid Password(Min. 6 Character)");
                                }
                              },
                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8)),
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.vpn_key, color: Colors.blue),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 15, 20, 15),
                                label: Text("Password"),
                                labelStyle: TextStyle(
                                    color: Colors.blue.withOpacity(0.8)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              )),
                        ),
                        _buttonLogin(),
                        _buttonRegister(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ElevatedButton(
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ))),
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Row(
              children: [
                Text("Don't Have An Account ?", style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewRegister(),
                      ),
                    );
                  },
                  child: const Text('Sign Up', style: TextStyle(fontSize: 16)),
                ),
              ],
            )));
  }

  void signIn(String email, String password) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  // prefs.setString('email', email),
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
