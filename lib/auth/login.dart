import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? pass;
    String? confirmPass;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF285BC0),
        ),
        home: Scaffold(
            resizeToAvoidBottomInset : false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
              child: Column(
                children: [
                  const SizedBox(height: 169),
                  const Text(
                    'Войти в аккаунт',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 113),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      prefixIconColor: const Color(0xFF6D7278),
                      hintText: 'Электронная почта',
                      hintStyle: const TextStyle(
                        color: Color(0xFF6D7278),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 10.0, color: Colors.black),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    initialValue: email,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      prefixIconColor: const Color(0xFF6D7278),
                      hintText: 'Пароль',
                      hintStyle: const TextStyle(
                        color: Color(0xFF6D7278),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    initialValue: pass,
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 57),
                  Column(
                    children: [ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(182, 44)
                        ),
                        child: const Text('Войти', style: TextStyle(color: Color(0xFF285BC0)))),
                      const SizedBox(height: 26),
                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF102F6A),
                          minimumSize: Size(182, 44)
                        ),
                        child: const Text('Создать аккаунт', style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                      ),],)
                ],
              ),
            )
        )
    );
  }
}