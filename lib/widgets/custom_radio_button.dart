import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final Function(String) onChanged;

  const CustomRadioButton({super.key, required this.onChanged});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? _selectedFormat;
  final List<_RadioOption> _options = const [
    _RadioOption("PDF", Icons.picture_as_pdf),
    _RadioOption("DOCX", Icons.article),
    _RadioOption("TXT", Icons.text_snippet),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ..._options.map((option) => _buildRadioTile(option)),
        _buildSendButton(),
      ],
    );
  }

  Widget _buildRadioTile(_RadioOption option) {
    bool isSelected = _selectedFormat == option.value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
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
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          value: option.value,
          groupValue: _selectedFormat,
          onChanged: (String? newValue) {
            setState(() => _selectedFormat = newValue);
            if (newValue != null) widget.onChanged(newValue);
          },
          activeColor: Colors.blue,
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
          onPressed: _selectedFormat != null ? () => widget.onChanged(_selectedFormat!) : null,
          child: Text(
            "Envoyer",
            style: TextStyle(
              color: _selectedFormat != null ? Colors.black : Colors.grey,
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

class _RadioOption {
  final String value;
  final IconData icon;

  const _RadioOption(this.value, this.icon);
}