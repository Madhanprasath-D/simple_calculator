import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.bottomRight,
            child: Text(
              text,
              style:
                  const TextStyle(fontSize: 50.0, fontWeight: FontWeight.w400),
            ),
          )),
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                buttonoperation("7"),
                buttonoperation("8"),
                buttonoperation("9"),
                buttonoperation("/"),
              ],
            ),
          ),
          Row(
            children: [
              buttonoperation("4"),
              buttonoperation("5"),
              buttonoperation("6"),
              buttonoperation("*"),
            ],
          ),
          Row(
            children: [
              buttonoperation("1"),
              buttonoperation("2"),
              buttonoperation("3"),
              buttonoperation("-"),
            ],
          ),
          Row(
            children: [
              buttonoperation("00"),
              buttonoperation("0"),
              buttonoperation("%"),
              buttonoperation("+"),
            ],
          ),
          Row(
            children: [
              buttonoperation("Clear"),
              buttonoperation("="),
            ],
          ),
        ],
      ),
    );
  }

  Expanded buttonoperation(String valutext) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
            onPressed: () {
              btnclick(valutext);
            },
            child: Text(
              valutext,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )),
      ),
    );
  }

  late int first, second;
  late String result, text = "";
  late String option;
  void btnclick(String btn) {
    if (btn == "Clear") {
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btn == "+" || btn == "-" || btn == "*" || btn == "/") {
      first = int.parse(text);
      result = "";
      option = btn;
    } else if (btn == "=") {
      second = int.parse(text);
      if (option == "+") {
        result = (first + second).toString();
      } else if (option == "-") {
        result = (first - second).toString();
      } else if (option == "/") {
        result = (first / second).toString();
      } else if (option == "%") {
        result = (first % second).toString();
      } else {
        result = (first * second).toString();
      }
    } else {
      result = text + btn;
    }

    setState(() {
      text = result;
    });
  }
}
