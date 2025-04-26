import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final String label;
  final String hints;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const NormalTextField({
    Key? key,
    required this.label,
    required this.hints,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2), // least space
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 12
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hints,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            isDense: true, // makes it tighter
            contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
          ),
        ),
      ],
    );
  }
}
