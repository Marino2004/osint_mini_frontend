import 'package:flutter/material.dart';
import '../widgets/link_card.dart';

class LinkPage extends StatelessWidget {
  const LinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left_sharp),
          onPressed: (){
            Navigator.pushNamed(context, '/');
          }
        ),
      ),
      body: const CardLink(),
    );
  }
}
