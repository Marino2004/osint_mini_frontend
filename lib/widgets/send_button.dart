import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final VoidCallback? onSendPressed;
  final bool isEnabled;

  const SendButton({
    super.key,
    required this.onSendPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
          ),
          onPressed: isEnabled ? onSendPressed : null,
          child: Text(
            "Envoyer",
            style: TextStyle(
              color: isEnabled ? Colors.black : Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}