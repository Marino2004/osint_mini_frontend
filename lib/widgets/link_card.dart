import 'package:flutter/material.dart';
import '../data/fixtures.dart';

class CardLink extends StatelessWidget {
  const CardLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return LinkCard(url: data[index]);
        },
      ),
    );
  }
}

class LinkCard extends StatelessWidget {
  final String url;

  const LinkCard({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12), // Espacement entre les items
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Fond gris foncé
        borderRadius: BorderRadius.circular(10), // Bords arrondis
      ),
      child: Align(
        alignment: Alignment.centerRight, // Aligner le texte à droite
        child: Text(
          url, // Texte dynamique
          style: TextStyle(
            color: Colors.grey[400], // Texte gris clair
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
