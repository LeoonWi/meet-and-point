import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newUsername;
    String? newEmail;
    String? newPass;
    String? confirmPass;

    return Scaffold(
      backgroundColor: Color(0xFF285BC0), // Added background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field to change username
            const SizedBox(height: 16.0),
            const Text( 'Настройки',textAlign : TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 34.0)),
            const SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                newUsername = value;
              },
              decoration: const InputDecoration(
                labelText: 'Изменить имя',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 16.0),

            // Input field to change email
            TextFormField(
              onChanged: (value) {
                newEmail = value;
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                prefixIconColor: const Color(0xFF6D7278),
                hintText: 'Изменить email',
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
              initialValue: newEmail,
            ),
            SizedBox(height: 40.0),

            // Button to change username
            ElevatedButton(
              onPressed: () {
                // Implement logic to change username
                // You can use the value in 'newUsername'
                // For example: updateUser(username: newUsername);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF102F6A),
                minimumSize: Size(182, 44),
              ),
              child: Text('Изменить имя', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 8.0),

            // Button to change password
            ElevatedButton(
              onPressed: () {
                // Implement logic to change password
                // You can use the values in 'newPass' and 'confirmPass'
                // For example: updatePassword(password: newPass);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF102F6A),
                minimumSize: Size(182, 44),
              ),
              child: Text('Изменить пароль', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 8.0),

            // Button to sign out
            ElevatedButton(
              onPressed: () {
                // Implement logic to sign out
                // For example: signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF102F6A),
                minimumSize: Size(182, 44),
              ),
              child: Text('Выйти', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}