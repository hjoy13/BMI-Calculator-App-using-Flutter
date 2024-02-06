import 'dart:math';


class BMICALCULATOR {
  final int height;
  final int weight;
  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  BMICALCULATOR(this.height, this.weight) {
    _bmi = double.parse(calculateBMI());
  }




  String getResult() {
    print('_bmi:$_bmi');
    if (_bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'HEALTHY WEIGHT';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'OVERWEIGHT';
    } else {
      return 'OBESE';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'You need to eat more and probably you need to exercise more. Consult your doctor for more information.';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'You are in a healthy weight range. You can eat more and exercise more.';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'You need to eat less and probably you need to exercise. Consult your doctor for more information.';
    } else {
      return 'You are in an obese weight range. You need to eat less and probably you need to do routine-bound exercise. Consult your doctor for more information. ';
    }
  }
}