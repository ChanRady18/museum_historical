
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/data_provider.dart';
import 'widget/Banner_Widget.dart';
import 'widget/GetData_Widget.dart';
import 'widget/header_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.only(top: 25.0,left: 20,right: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HeaderAppBar(),
            ),
             SliverToBoxAdapter(
              child:  SizedBox(height: 30.0,),
            ),
            SliverToBoxAdapter(
              child:  BannerWidget(),
            ),
            SliverToBoxAdapter(
              child: DataListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}




