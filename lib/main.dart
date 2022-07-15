import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:museum_test_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

import 'widget/banner_widget.dart';
import 'widget/header_widget.dart';
import 'widget/list_article_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: CustomScrollView(
          slivers: [
            //HEADER
            SliverToBoxAdapter(
              child: HeaderAppBar(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 30),
            ),
            //BANNER
            SliverToBoxAdapter(
              child: BannerWidget(),
            ),
            //HEADER TITLE
            SliverToBoxAdapter(
              child: Text(
                "TRENDING STORIES",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            //LIST
            SliverToBoxAdapter(
              child: ListArticle(),
            ),
          ],
        ),
      ),
    );
  }
}
