import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key, required String label});

  @override
  PasswordWidgetState createState() => PasswordWidgetState();
}

class PasswordWidgetState extends State<PasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.lock_outline, color: Colors.grey),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}