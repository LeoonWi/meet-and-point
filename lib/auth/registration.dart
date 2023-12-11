import 'package:flutter/material.dart';
import 'package:meet_and_point/api/api.dart';
import 'package:meet_and_point/auth/login.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController confirmPass = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF285BC0),
        resizeToAvoidBottomInset : false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: Column(
            children: [
              const SizedBox(height: 169),
              const Text(
                'Создать аккаунт',
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
              TextFormField(
                controller: confirmPass,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  prefixIconColor: const Color(0xFF6D7278),
                  hintText: 'Повторите пароль',
                  hintStyle: const TextStyle(
                    color: Color(0xFF6D7278),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: const Color(0xFFFFFFFF),
                  filled: true
                ),
              ),
              const SizedBox(height: 57),
              ElevatedButton(
                onPressed: () async {
                  if(email.text != null && pass.text != null && pass.text == confirmPass.text) {
                    final result = await Api().registration(email.text, pass.text);
                    if (result == 'Successfully') {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext) => LoginPage()));
                    } else {
                      showDialog(context: context, builder: (context) => new AlertDialog(
                        title: Text('ошибка', textAlign: TextAlign.center),
                        content: Text('Что-то пошло не так', textAlign: TextAlign.center),
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
                  minimumSize: const Size(182, 44),
                ),
                child: const Text('Создать аккаунт', style: TextStyle(color: Color(0xFF285BC0)))),
              const SizedBox(height: 26),
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF102F6A),
                  minimumSize: const Size(182, 44),
                ),
                child: const Text('Уже есть аккаунт?', style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}