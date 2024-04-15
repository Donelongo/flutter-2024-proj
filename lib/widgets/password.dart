import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({Key? key});

  @override
  PasswordWidgetState createState() => PasswordWidgetState();
}

class PasswordWidgetState extends State<PasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(height: 57, 
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center( // Wrap TextFormField with Center
        child: TextFormField(
          obscureText: obscureText,
          textAlignVertical: TextAlignVertical.center, // Align text vertically to center
          decoration: InputDecoration(
            labelText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 10), // Add padding
            border: InputBorder.none,
            suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility, color:Colors.blueGrey,
              ),
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
    );
  }
}
