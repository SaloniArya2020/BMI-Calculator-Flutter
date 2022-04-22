import 'package:bmi_calculator/Constants/app_constant.dart';
import 'package:bmi_calculator/Widgets/left_bar.dart';
import 'package:flutter/material.dart';

import '../Widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('BMI Calculator', style: TextStyle(fontSize: 18, color: kPrimaryColor),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Height Input
                Container(
                  width: 150,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300, color: kPrimaryColor),
                    decoration: InputDecoration(
                      hintText: 'Height(m)',
                      hintStyle: TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.4)),
                      border: InputBorder.none
                    ),
                  ),
                ),

                //Weight Input
                Container(
                  width: 150,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300, color: kPrimaryColor),
                    decoration: InputDecoration(
                        hintText: 'Weight(kg)',
                        hintStyle: TextStyle(fontSize: 25, color: Colors.white.withOpacity(0.4)),
                        border: InputBorder.none
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),

            //Calculate Button
            GestureDetector(
              onTap: (){
                double h = double.parse(_heightController.text.trim());
                double w = double.parse(_weightController.text.trim());

                setState(() {
                  _bmiResult = (w) /(h * h);


                  if(_bmiResult < 18.5){
                    _textResult = 'You are underweight!';
                  }else if(_bmiResult >= 18.5 && _bmiResult <=24.9){
                    _textResult = 'Normal Weight';
                  }else{
                    _textResult = 'You are overweight!';
                  }
                });


              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[700],
                ),
                child: Text('Calculate', style: TextStyle(
                  color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.w600
                ),),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2), style: TextStyle(
                  color: kPrimaryColor, fontSize: 60, fontWeight: FontWeight.w400
              ),),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(_textResult, style: TextStyle(
                  color: kPrimaryColor, fontSize: 34,
              ),),
            ),

            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                RightBar(barWidth: 30),
                SizedBox(
                  height: 20,
                ),
                RightBar(barWidth: 70),
                SizedBox(
                  height: 20,
                ),
                RightBar(barWidth: 30),
                SizedBox(
                  height: 10,
                ),
                LeftBar(barWidth: 40),
                SizedBox(
                  height: 40,
                ),
                LeftBar(barWidth: 40),

              ],
            )

          ],
        ),
      ),
    );
  }
}
