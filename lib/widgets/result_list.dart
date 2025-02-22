import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultList extends StatelessWidget {
  final List<String> results;

  const ResultList({super.key, required this.results});

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("Impossible d'ouvrir l'URL: $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index], style: const TextStyle(color: Colors.blue)),
          onTap: () => _launchUrl(results[index]),
        );
      },
    );
  }
}
