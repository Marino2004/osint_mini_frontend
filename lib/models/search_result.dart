class SearchResult {
  final String query;
  final String filetype;
  final List<String> results;
  final int length;

  SearchResult({
    required this.query,
    required this.filetype,
    required this.results,
    required this.length,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      query: json['query'],
      filetype: json['filetype'],
      results: List<String>.from(json['results']),
      length: json['length'],
    );
  }
}
