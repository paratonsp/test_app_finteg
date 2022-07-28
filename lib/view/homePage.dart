// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app_finteg/view/resultPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numberController = TextEditingController();

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(width: 200, child: Text("Number")),
              SizedBox(height: 5),
              SizedBox(
                width: 200,
                height: 40,
                child: CupertinoTextField(
                  controller: numberController,
                  placeholder: "1-100",
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: CupertinoButton(
                    color: Colors.blueAccent,
                    child: Text("Lanjutkan"),
                    onPressed: () {
                      if (numberController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Number cannot be empty'),
                        ));
                      } else {
                        if (double.parse(numberController.text) > 100) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Number must be less than 100'),
                          ));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultPage(numberController.text)),
                          );
                        }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
