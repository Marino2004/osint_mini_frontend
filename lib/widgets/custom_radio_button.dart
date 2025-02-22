import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final List<RadioOption> options;
  final String? selectedFormat;
  final Function(String) onChanged;
  final VoidCallback onSendPressed;

  const CustomRadioButton({
    super.key,
    required this.options,
    required this.selectedFormat,
    required this.onChanged,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...options.map((option) => _buildRadioTile(option)),
      ],
    );
  }

  Widget _buildRadioTile(RadioOption option) {
    bool isSelected = selectedFormat == option.value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[700]!,
            width: isSelected ? 2.0 : 1.5,
          ),
        ),
        child: RadioListTile<String>(
          title: Row(
            children: [
              Icon(option.icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                option.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          value: option.value,
          groupValue: selectedFormat,
          onChanged: (String? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          activeColor: Colors.blue,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ),
    );
  }
}

class RadioOption {
  final String value;
  final IconData icon;

  const RadioOption(this.value, this.icon);
}