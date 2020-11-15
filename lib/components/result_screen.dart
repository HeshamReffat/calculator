import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String output = "0";
  String result = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = "";

  Widget customButton(String value, {Color color}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(2.0, 2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-2.0, -2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(20.0),
          child: Text(
            value,
            style: TextStyle(fontSize: 22.0),
          ),
          onPressed: () => brain(value),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            output,
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Column(
                children: [
                  Row(
                    children: [
                      customButton('AC', color: Colors.deepOrangeAccent[200]),
                      customButton('+/-', color: Colors.white),
                      customButton('%', color: Colors.white),
                      customButton('/', color: Colors.white),
                    ],
                  ),
                  Row(
                    children: [
                      customButton('7', color: Colors.grey[200]),
                      customButton('8', color: Colors.grey[200]),
                      customButton('9', color: Colors.grey[200]),
                      customButton('x', color: Colors.white),
                    ],
                  ),
                  Row(
                    children: [
                      customButton('4', color: Colors.grey[200]),
                      customButton('5', color: Colors.grey[200]),
                      customButton('6', color: Colors.grey[200]),
                      customButton('-', color: Colors.white),
                    ],
                  ),
                  Row(
                    children: [
                      customButton('1', color: Colors.grey[200]),
                      customButton('2', color: Colors.grey[200]),
                      customButton('3', color: Colors.grey[200]),
                      customButton('+', color: Colors.white),
                    ],
                  ),
                  Row(
                    children: [
                      customButton('.', color: Colors.grey[200]),
                      customButton('0', color: Colors.grey[200]),
                      customButton('00', color: Colors.deepOrangeAccent[200]),
                      customButton('=', color: Colors.yellow[300]),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void brain(String value) {
    if (value == 'AC') {
      result = "0";
      num1 = 0.0;
      num2 = 0.0;
      operation = "";
    } else if (value == '+' ||
        value == '-' ||
        value == '/' ||
        value == 'x' ||
        value == '%') {
      num1 = double.parse(output);
      operation = value;
      result = '0';
    } else if (value == '.') {
      if (result.contains('.')) {
        return;
      } else {
        result = result + value;
      }
    } else if (value == '+/-') {
      result.startsWith('-')
          ? result = result.substring(1)
          : result = '-' + result;
    } else if (value == '=') {
      num2 = double.parse(output);

      if (operation == '+') {
        result = (num1 + num2).toString();
      }
      if (operation == '-') {
        result = (num1 - num2).toString();
      }
      if (operation == 'x') {
        result = (num1 * num2).toString();
      }
      if (operation == '/') {
        result = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operation = "";
    } else {
      result = result + value;
    }
    if (operation == '%') {
      result = (num1 / 100).toString();
    }
    print(result);
    setState(() {
      output = double.parse(result).toStringAsFixed(2);
    });
  }
}
