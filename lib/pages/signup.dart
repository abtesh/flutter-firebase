import 'package:erp_login/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var confrimPasswordController = TextEditingController();
  bool _isObsecure = true;
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
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Full Name"),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person)
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
                keyboardType: TextInputType.phone,
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text("phone number"),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.phone)
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
                obscureText: _isObsecure,
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
             Center(
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: confrimPasswordController,
                decoration: const InputDecoration(
                  label: Text("confirm password"),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.password_outlined)
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 45,
            ),

            Center(child: OutlinedButton.icon(onPressed: signUp, icon: const Icon(Icons.sign_language), label: const Text("sign up"))),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
                ),),
                TextButton(
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                }, child: const Text("Log-in"))
                
              ],
            )
          ],
        ),
      ),
    );
  }
  Future signUp() async {
    showDialog(context: context,
    barrierDismissible: false,
     builder: (context) => Center(child: CircularProgressIndicator(),));
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim());
    }on FirebaseAuthException catch (e){
       print(e);
    }
  }
}
  