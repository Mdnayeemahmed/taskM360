import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const PasswordField({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2), // least space
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.controller,
          obscureText: _isObscured,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: "************",
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: _toggleVisibility,
            ),
          ),
        ),
      ],
    );
  }
}