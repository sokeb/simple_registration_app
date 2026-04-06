import 'package:flutter/material.dart';

class AnimatedTextField extends StatefulWidget {
  const AnimatedTextField({
    required this.hint,
    required this.controller,
    super.key,
    this.isPassword = false,
  });

  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField> {
  bool isFocused = false;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() => isFocused = value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const .only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isFocused ? const Color(0xFF092327): Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: widget.isPassword && obscure,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
            hintText: widget.hint,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() => obscure = !obscure);
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
