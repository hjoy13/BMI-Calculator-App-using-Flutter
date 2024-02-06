import "package:bmi_calculator/bmi_button.dart";
import "package:bmi_calculator/bmi_card.dart";
import "package:bmi_calculator/result_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 15;
  int weight = 75;
  int height = 150;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.sp,
            vertical: 24.0.sp,
          ),
          child: Column(
            children: [
              Text(
                'Check your Body Mass Index (BMI) to know if you are in shape',
                style: TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 23.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BmiCard(
                    width: 156,
                    height: 215,
                    title: 'AGE',
                    value: age.toString(),
                    label: 'YRS',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BmiButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        BmiButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  BmiCard(
                    width: 156,
                    height: 215,
                    title: 'WEIGHT',
                    value: weight.toString(),
                    label: 'KG',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BmiButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        BmiButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              BmiCard(
                width: double.infinity,
                height: 215,
                title: 'HEIGHT',
                value: height.toString(),
                label: 'CM',
                child: Slider(
                  min: 100.0,
                  max: 200.0,
                  value: height.toDouble(),
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.45),
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 43.h,
              ),
              Text(
                'Tap the button below to check your BMI result',
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          height: height,
                          weight: weight,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}