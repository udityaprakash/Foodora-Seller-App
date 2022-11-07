import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/homepage/homepage.dart';
import 'package:foodora_seller/screens/main_home_pages/main_home.dart';

import '../desigining.dart';

class home_page_redirector extends StatefulWidget {
  const home_page_redirector({super.key});

  @override
  State<home_page_redirector> createState() => _home_page_redirectorState();
}

class _home_page_redirectorState extends State<home_page_redirector> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: idgrabber(),
      builder: (BuildContext context, AsyncSnapshot id_storage) {
        if (id_storage.data == null || id_storage.data == 'GUEST USER') {
          return Homepage();
        } else if (id_storage.hasData) {
          return main_home();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        ;
      },
    );
  }
}
