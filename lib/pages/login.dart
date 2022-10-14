import 'package:erp_login/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
 class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Welcome, Please Login to Continue"),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text("email"),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.email)
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("password"),
                  border: OutlineInputBorder(),
                  /*suffixIcon: IconButton(
                    onPressed:setState(() {
                      _isObsecure = !_isObsecure
                    });,
                   icon: Icon(Icons.password)
                   )*/
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),

            Center(child: OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.login), label: const Text("Login"))),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New User?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
                ),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                }, child: const Text("Signup"))
              ],
            )
          ],
        ),
      ),
    );
  }
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email:emailController.text.trim(),
      password: passwordController.text.trim()
    );
  }
}