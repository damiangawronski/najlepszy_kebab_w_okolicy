import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('zaloguj się'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Hasło'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text('zaloguj się'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
