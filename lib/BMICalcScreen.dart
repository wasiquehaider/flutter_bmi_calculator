import 'package:bmi_calculator_flutter/BMIModel.dart';
import 'package:bmi_calculator_flutter/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BMICalcScreen extends StatefulWidget {
  @override
  _BMICalcScreenState createState() => _BMICalcScreenState();
}

class _BMICalcScreenState extends State<BMICalcScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;

  double _bmi = 0;

  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset(
                  "assets/images/heart.svg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "We care about your health",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Height (cm)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (height) {
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "${_heightOfUser.roundToDouble()}",
                ),
              ),
              Text(
                "${_heightOfUser.roundToDouble()} cm",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Weight (kg)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 120.0,
                  onChanged: (height) {
                    setState(() {
                      _weightOfUser = height;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "${_weightOfUser.roundToDouble()}",
                ),
              ),
              Text(
                "${_weightOfUser.roundToDouble()} kg",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      _bmi = _weightOfUser /
                          ((_heightOfUser / 100) * (_heightOfUser / 100));

                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: "You are Totaly Fit");
                      } else if (_bmi < 18.5) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Underweighted");
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Overweighted");
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Obesed");
                      }
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  bmiModel: _bmiModel,
                                )));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text("CALCULATE"),
                  textColor: Colors.white,
                  color: Colors.pink,
                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
