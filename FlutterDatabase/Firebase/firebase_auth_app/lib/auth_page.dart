
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/custom_assets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_app/home_page.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your password",
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String uEmail = emailController.text.toString();
                    String uPass = passwordController.text.toString();
                     print(uEmail);
                     print(uPass);
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: uEmail,
                        password: uPass,
                      );
                      
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Sign Ups",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your password",
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String uEmail = emailController.text.toString();
                    String uPass = passwordController.text.toString();

                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: uEmail, password: uPass);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Container(
                child: TextButton(onPressed: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ));
                }, child: const Text("Dont have account SignUp")),
              )
            ],
          ),
        ),
      ),
    );
  }
}