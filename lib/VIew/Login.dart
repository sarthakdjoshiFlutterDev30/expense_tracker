import 'package:flutter/material.dart';

import '../controller/Firebase_Controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var password = TextEditingController();
  bool isloading = false;
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/Background.jpeg"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Email Address",
                  hintStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: password,
                style: const TextStyle(fontSize: 20, color: Colors.white),

                keyboardType: TextInputType.text,
                obscureText: show,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: Text(
                      (show) ? "Show" : "Hide",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              (isloading)
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                    onPressed: () async {
                      if (email.text.trim().isEmpty ||
                          password.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Enter Email Or Password",
                              style: TextStyle(fontSize: 18),
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        isloading = true;
                        setState(() {});
                        final lc = Firebase_Controller();
                        if (await lc.signIn(
                          email.text.trim().toString(),
                          password.text.trim().toString(),
                        )) {
                          Navigator.pushReplacementNamed(context, "/home");
                        } else {
                          isloading = false;
                          setState(() {});
                          print("Not Navigate");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have An Account?",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      if (email.text.trim().isNotEmpty) {
                        Firebase_Controller.resetPassword(
                          email.text.trim().toString(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Password Reset Email Sent",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Enter Email To Reset Password",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
