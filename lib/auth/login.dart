import 'package:flutter/material.dart';
import 'package:meet_and_point/api/api.dart';
import 'package:meet_and_point/auth/registration.dart';
import 'package:meet_and_point/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();

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
                    controller: email,
                    textInputAction: TextInputAction.next,
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
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    obscureText: true,
                    controller: pass,
                    textInputAction: TextInputAction.next,
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
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 57),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {

                          if (email.text != null && pass.text != null) {
                            final results = await Api().login(email.text!, pass.text!);
                            if (results != 'Error') {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext) => HomePage(
                                  id: results as int,
                              )));
                            } else {
                              showDialog(context: context, builder: (context) => new AlertDialog(
                                title: Text('ошибка', textAlign: TextAlign.center),
                                content: Text('Некорректные данные для входа', textAlign: TextAlign.center),
                              ));
                            }
                          } else {
                            showDialog(context: context, builder: (context) => new AlertDialog(
                              title: Text('ошибка', textAlign: TextAlign.center),
                              content: Text('Заполните все поля', textAlign: TextAlign.center),
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(182, 44)
                        ),
                        child: const Text('Войти', style: TextStyle(color: Color(0xFF285BC0)))),
                      const SizedBox(height: 26),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => const RegistrationPage()));
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