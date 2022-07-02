import 'package:booktrip/constant.dart';
import 'package:booktrip/models/model_user.dart';
import 'package:booktrip/screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewRegister extends StatefulWidget {
  const NewRegister({Key? key}) : super(key: key);

  @override
  State<NewRegister> createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
  final _formKey = GlobalKey<FormState>();

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    usernameEditingController.dispose();
  }
// leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white.withOpacity(0.9)),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),

  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/3.jpg"), fit: BoxFit.cover)),
        child: Center(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPadding, right: kDefaultPadding),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(1, 4), // changes position of shadow
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
                                controller: nameEditingController,
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8)),
                                validator: (value) {
                                  RegExp regex = RegExp(r'^.{3,}$');
                                  if (value!.isEmpty) {
                                    return ("Name cannot be Empty");
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return ("Enter Valid name(Min. 3 Character)");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  nameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.account_circle,
                                    color: Colors.blue,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  label: Text("Name"),
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
                                controller: emailEditingController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Please Enter Your Email");
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return ("Please Enter a valid email");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  nameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.mail,
                                    color: Colors.blue,
                                  ),
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
                                controller: usernameEditingController,
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Please Enter Your Username");
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  nameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.person_add_alt_1_rounded,
                                    color: Colors.blue,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  label: Text("Username"),
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
                                controller: passwordEditingController,
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8)),
                                validator: (value) {
                                  RegExp regex = new RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                    return ("Password is required for login");
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return ("Enter Valid Password(Min. 6 Character)");
                                  }
                                },
                                onSaved: (value) {
                                  nameEditingController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.blue,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  label: Text("Password"),
                                  labelStyle: TextStyle(
                                      color: Colors.blue.withOpacity(0.8)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                                controller: confirmPasswordEditingController,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8)),
                                obscureText: true,
                                validator: (value) {
                                  if (confirmPasswordEditingController.text !=
                                      passwordEditingController.text) {
                                    return "Password don't match";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  confirmPasswordEditingController.text =
                                      value!;
                                },
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.blue,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  label: Text("Confirm Password"),
                                  labelStyle: TextStyle(
                                      color: Colors.blue.withOpacity(0.8)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                )),
                          ),
                          _buttonRegister(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: kDefaultPadding),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Already Have An Account',
                                      style: TextStyle(fontSize: 16)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))),
      ),
    );
  }

  Widget _buttonRegister() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ElevatedButton(
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ))),
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    Users userModel = Users();

    userModel.itemEmail = user!.email;
    userModel.itemNama = nameEditingController.text;
    userModel.itemPassword = passwordEditingController.text;
    userModel.itemUsername = usernameEditingController.text;
    userModel.itemId = user.uid;
    userModel.order = [];

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toJson());
    Fluttertoast.showToast(msg: "Account created successfully !!!");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
