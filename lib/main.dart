import 'dart:convert';

import 'package:custom_line_chart/brath_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chart_page.dart';
import 'custom_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<BreathModel>> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    var decode = json.decode(response) as List;
    var breaths = <BreathModel>[];
    decode.forEach((element) {
      breaths.add(BreathModel.fromJson(element));
    });
    return breaths;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<BreathModel>>(
                future: readJson(),
                builder: (context, snapshot) {
                  List<BreathModel> breaths = snapshot.data ?? [];
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: breaths.length,
                      itemBuilder: (context, index) {
                        BreathModel breath = breaths[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChartPage(breath.flow)),
                            );
                          },
                          child: Column(
                            children: <Widget>[Text(breath.date), Text("Is valid ${breath.isValid}")],
                          ),
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}
