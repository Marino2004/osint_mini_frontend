import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/search_result.dart';
import '../widgets/custom_radio_button.dart';
import '../widgets/result_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _queryController = TextEditingController();
  String selectedFileType = "txt"; // Par défaut
  SearchResult? searchResult;
  bool isLoading = false;

  final ApiService apiService = ApiService();

  void _performSearch() async {
    setState(() {
      isLoading = true;
    });

    final result = await apiService.fetchSearchResults(_queryController.text, selectedFileType);

    setState(() {
      searchResult = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: const Icon(Icons.search, size: 35),
          onPressed: () {},
        ),
        actions: const [
          Text(
            "Osint Lite  ",
            style: TextStyle(
                fontSize: 40,
                fontFamily: "Billabong",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40.0, top: 50.0),
              child: Text(
                "Mots clés",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: TextField(
                style: const TextStyle(
                    color: Colors.black), // Couleur du texte en noir
                decoration: InputDecoration(
                    labelText: "Mot clés",
                    labelStyle: const TextStyle(
                        color: Colors.black), // Couleur du label en noir
                    filled: true, // Active le remplissage du fond
                    fillColor:
                        Colors.white, // Couleur de fond du champ en blanc
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0)), // Bordure arrondie
                      borderSide: BorderSide(
                          color: Colors.grey), // Couleur de la bordure en gris
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          20.0)), // Bordure arrondie lorsqu'il est activé
                      borderSide: BorderSide(
                          color: Colors.grey), // Couleur de la bordure en gris
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          20.0)), // Bordure arrondie lorsqu'il est en focus
                      borderSide: BorderSide(
                          color: Colors.blue), // Couleur de la bordure en bleu
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search,
                          color: Colors.grey), // Icône à droite
                      onPressed: _performSearch,
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0, top: 20.0, right: 50.0),
              child: Row(
                children: [
                  // Texte "Format de fichiers"
                  Text(
                    "Format de fichiers",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Espace entre le texte et le Divider
                  SizedBox(width: 10.0), // Ajustez la valeur selon vos besoins
                  // Divider vertical
                  Expanded(
                    child: Divider(
                      color: Colors.white, // Couleur de la ligne
                      thickness: 2.0, // Épaisseur de la ligne
                      height: 20.0, // Espace vertical autour de la ligne
                    ),
                  ),
                ],
              ),
            ),
            CustomRadioButton(
              onChanged: (value) {
                setState(() {
                  selectedFileType = value;
                });
              },
            ),
            const SizedBox(height: 20),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : searchResult != null
                    ? Expanded(child: ResultList(results: searchResult!.results))
                    : const SizedBox.shrink(),
          ],
        ),
      );
  }
}