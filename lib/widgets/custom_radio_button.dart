import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? _selectedFormat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildRadioTile("PDF", Icons.picture_as_pdf),
        _buildRadioTile("DOCX", Icons.article),
        _buildRadioTile("TXT", Icons.text_snippet),
        _buildSendButton(),
      ],
    );
  }

  Widget _buildRadioTile(String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: _selectedFormat == value ? Colors.blue : Colors.grey[700]!,
            width: 1.5,
          ),
        ),
        child: RadioListTile<String>(
          title: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          value: value,
          groupValue: _selectedFormat,
          onChanged: (String? newValue) {
            setState(() {
              _selectedFormat = newValue;
            });
          },
          activeColor: Colors.grey,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ),
    );
  }

  Widget _buildSendButton() {
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
          onPressed: () {},
          child: const Text(
            "Envoyer",
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
