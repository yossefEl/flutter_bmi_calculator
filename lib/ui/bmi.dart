import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiCalculatorState();
  }
}

class BmiCalculatorState extends State<BmiCalculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double bmi = 0;
  String _result = "";
  void claculateBmi() {
    
    setState(() {
      if (_heightController.text.isNotEmpty &&
        _weightController.text.isNotEmpty &&
        _heightController.text != "0" &&
        _weightController.text != "0")
    {
        bmi = double.parse(_weightController.text) /
          (double.parse(_heightController.text) *
              double.parse(_heightController.text));
      if (bmi != 0) {
        if (bmi < 18.5) {
          _result = "your BMI is ${bmi.toStringAsFixed(2)} :Underweight";
        } else if (bmi >= 18.5 && bmi <= 25.5) {
          _result = "your BMI is ${bmi.toStringAsFixed(2)} :Normal Weight";
        } else if (bmi > 25.5 && bmi <= 30) {
          _result = "your BMI is ${bmi.toStringAsFixed(2)} :Overweight";
        } else {
          _result = "your BMI is ${bmi.toStringAsFixed(2)} :Obese";
        }
      }
    }else
    _result="Please enter a valid height and wieght";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 10),
            child: new Column(
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(top: 15),
                      child: new Image.asset(
                        'images/bmilogo.png',
                        height: 100,
                      ),
                    ),
                    new Text(
                      "For Adults",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    )
                  ],
                ),
                new TextField(
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  decoration: new InputDecoration(
                    labelText: "Enter you height here (m)",
                    hintText: 'Height',
                    icon: Icon(Icons.person_outline),
                  ),
                ),
                new TextField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  decoration: new InputDecoration(
                    labelText: "Enter you weight here (kg)",
                    hintText: 'Weight',
                    icon: Icon(Icons.graphic_eq),
                  ),
                ),
                new Center(
                  child: new Container(
                    margin: EdgeInsets.only(top: 10),
                    child: new MaterialButton(
                      onPressed: claculateBmi,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      color: Colors.pink,
                      textColor: Colors.white,
                      child: Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: new Text(
                    '$_result',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
