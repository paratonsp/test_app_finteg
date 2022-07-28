// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, must_be_immutable, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_finteg/controller/generateNumber.dart';
import 'package:test_app_finteg/model/formatNumber.dart';
import 'package:collection/collection.dart';

class ResultPage extends StatefulWidget {
  ResultPage(this.number);

  String number;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool loadContent = true;
  List<ResultNumber> listNumber = [];
  String msgg;
  int total = 0;

  getNumber(int num) async {
    await GenerateNumber.load(num).then((val) {
      setState(() {
        listNumber = val;
        var x = listNumber.map((e) => e.toJson()).toList();
        final msg = jsonEncode({"data": x});
        msgg = msg;
        for (var item in listNumber) {
          total += item.id;
        }
        loadContent = false;
      });
    });
  }

  @override
  void initState() {
    getNumber(int.parse(widget.number));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          previousPageTitle: "Home",
        ),
        middle: Text("Response"),
      ),
      body: (loadContent)
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Response: \n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        for (int i = 0; i < int.parse(widget.number); i++) ...[
                          Text(
                            listNumber[i].id.toString() +
                                ". " +
                                listNumber[i].text,
                            style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Json Response: \n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        Text(
                          msgg.toString(),
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Psuedocode: \n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        Text(
                          "--\nExample:\n",
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        Text(
                          "total=0\nlistNumber=[]\nfor (var item in listNumber)\n  {total += item.id;}\nreturn total;",
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        Text(
                          "\n--\nResult:\n",
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        Text(
                          "total=0\nlistNumber=[" +
                              listNumber[0].id.toString() +
                              ". " +
                              listNumber[0].text +
                              ".." +
                              listNumber[int.parse(widget.number) - 1]
                                  .id
                                  .toString() +
                              ". " +
                              listNumber[int.parse(widget.number) - 1].text +
                              "]\nfor (var item in listNumber)\n  {total += item.id;}\nreturn $total;",
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
