import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, outlined }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;

    switch (variant) {
      case ButtonVariant.primary:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: isDisabled ? Colors.grey : Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
        break;
      case ButtonVariant.secondary:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: isDisabled ? Colors.grey.shade300 : Colors.grey,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
        break;
      case ButtonVariant.outlined:
        buttonStyle = OutlinedButton.styleFrom(
          side: BorderSide(
            color: isDisabled ? Colors.grey : Colors.blue,
            width: 2,
          ),
          foregroundColor: isDisabled ? Colors.grey : Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
        break;
    }

    return variant == ButtonVariant.outlined
        ? OutlinedButton(
            onPressed: isDisabled ? null : onPressed,
            style: buttonStyle,
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: isDisabled ? null : onPressed,
            style: buttonStyle,
            child: Text(label),
          );
  }
}
