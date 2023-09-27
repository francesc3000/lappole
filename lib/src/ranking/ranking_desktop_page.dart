import 'package:flutter/material.dart';
import 'package:lappole/src/ranking/ranking_basic_page.dart';

class RankingDesktopPage extends RankingBasicPage {
  RankingDesktopPage(String title, {Key? key}) : super(title, key: key);

  @override
  Widget body(BuildContext context) {
    return const Text('Aquí se muestra el ranking del club e interclubes');
  }
}
