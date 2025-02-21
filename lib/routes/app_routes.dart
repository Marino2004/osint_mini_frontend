import 'package:flutter/material.dart';
import '../pages/search_page.dart';
import '../pages/link_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String link = '/link';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const SearchPage(),
      link: (context) => const LinkPage(),
    };
  }
}