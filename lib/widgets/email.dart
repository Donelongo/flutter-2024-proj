import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  EmailFieldState createState() => EmailFieldState();
}

class EmailFieldState extends State<EmailField> {
  final TextEditingController _emailController = TextEditingController();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final email = _emailController.text.trim();
    final isValid = email.isNotEmpty && email.contains('@') && email.contains('.');
    setState(() {
      _isValid = isValid;
    });
  }

  bool isSignUpEnabled() {
    return _isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      padding: EdgeInsets.all(1), // Add padding to the container
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
        ),
        style: TextStyle(
          fontFamily: 'San Serif',
          fontSize: 16,
        ),
        onChanged: (_) => _validateEmail(),
      ),
    );
  }
}
