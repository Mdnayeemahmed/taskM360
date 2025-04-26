import 'package:flutter/material.dart';

class PhoneNumberWidget extends StatelessWidget {
  final String label;
  final String countryCode;
  final String flag;
  final String placeholder;
  final TextEditingController? controller;

  const PhoneNumberWidget({
    Key? key,
    this.label = "Phone Number",
    this.countryCode = "+880",
    this.flag = "🇧🇩",
    required this.controller,
    this.placeholder = "17XXXXXXXX",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              children: [
                Text(
                  '$flag $countryCode',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: placeholder,
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,

                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
