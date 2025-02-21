import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Impossible d\'ouvrir l\'URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12), // Espacement entre les items
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Fond gris foncé
        borderRadius: BorderRadius.circular(10), // Bords arrondis
      ),
      child: InkWell(
        onTap: _launchUrl, // Ouvrir le lien au clic
        child: Align(
          alignment: Alignment.topRight, // Aligner le texte à droite
          child: Text(
            url, // Texte dynamique
            style: const TextStyle(
              color: Colors.white, // Texte en bleu pour indiquer un lien
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline, // Souligné pour ressembler à un lien
            ),
          ),
        ),
      ),
    );
  }
}
