import 'package:flutter/material.dart';

class LinkPage extends StatelessWidget
{
  const LinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_outlined, size: 35),
          onPressed:() {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // Nombre d'éléments (modifiable)
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12), // Espacement entre les items
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[900], // Fond gris foncé
                borderRadius: BorderRadius.circular(10), // Bords arrondis
              ),
              child: Align(
                alignment: Alignment.topRight, // Aligner le texte à droite
                child: Text(
                  'https://www.walthamforest.gov.uk/sites/default/files/2024-01/Public%20Register%20Selective%20Licences%20January%202024_1.pdf', // Texte statique (modifie selon besoin)
                  style: TextStyle(
                    color: Colors.grey[400], // Texte gris clair
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}