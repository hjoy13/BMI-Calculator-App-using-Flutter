import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bmi_calculator.dart';

class ResultScreen extends StatefulWidget {
  final int height;
  final int weight;

  const ResultScreen({Key? key, required this.height, required this.weight})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late BMICALCULATOR bmiCalculator;

  @override
  void initState() {
    super.initState();
    bmiCalculator = BMICALCULATOR(widget.height, widget.weight);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Text(
                'YOUR RESULT',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 26.h),
              Container(
                width: 328.w,
                height: 481.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(14.sp),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ResultText(
                      title: bmiCalculator.getResult(),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ResultText(
                      title: bmiCalculator.calculateBMI(),
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    const ResultText(
                      title: 'EXPLANATION',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ResultText(
                      title: bmiCalculator.getInterpretation(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultText extends StatelessWidget {
  const ResultText({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}