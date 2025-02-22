import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/search_result.dart';

class ApiService {
  static const String baseUrl = "http://192.168.226.250:8000/search/";

  Future<SearchResult?> fetchSearchResults(String query, String filetype) async {
    final uri = Uri.parse("$baseUrl?query=$query&filetype=$filetype");

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return SearchResult.fromJson(json.decode(response.body));
      } else {
        print("Erreur: ${response.statusCode}");
      }
    } catch (e) {
      print("Erreur lors de la récupération des données: $e");
    }
    return null;
  }
}
