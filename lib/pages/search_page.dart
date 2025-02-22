import '../widgets/send_button.dart';
import '../widgets/result_list.dart';
import '../services/api_service.dart';
import '../models/search_result.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_radio_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _queryController = TextEditingController();
  String? selectedFileType;
  SearchResult? searchResult;
  bool isLoading = false;

  final ApiService apiService = ApiService();

  final List<RadioOption> fileOptions = const [
    RadioOption("PDF", Icons.picture_as_pdf),
    RadioOption("DOCX", Icons.article),
    RadioOption("TXT", Icons.text_snippet),
  ];

  void _performSearch() async {
    if (selectedFileType == null) return;

    setState(() {
      isLoading = true;
    });

    final result = await apiService.fetchSearchResults(_queryController.text, selectedFileType!.toLowerCase());

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
      body: Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Mot clés",
                labelStyle: const TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.grey),
                  onPressed: _performSearch,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0, top: 20.0, right: 50.0),
            child: Row(
              children: [
                Text(
                  "Format de fichiers",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 2.0,
                    height: 20.0,
                  ),
                ),
              ],
            ),
          ),
          CustomRadioButton(
            options: fileOptions,
            selectedFormat: selectedFileType,
            onChanged: (value) {
              setState(() {
                selectedFileType = value;
              });
            },
            onSendPressed: _performSearch,
          ),
          SendButton(
            isEnabled: selectedFileType?.isNotEmpty ?? false,
            onSendPressed: _performSearch,
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