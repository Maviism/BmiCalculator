import 'dart:math';

class BrainCalc {
  BrainCalc({this.heeight, this.weeight});
  int heeight;
  int weeight;
  double result;

  String perhitungan() {
    result = weeight / pow(heeight / 100, 2);
    return result.toStringAsFixed(3);
  }

  String hasil() {
    if (result >= 24) {
      return 'Upss...sepertinya kamu harus diet';
    } else if (result > 18.5) {
      return 'Ideal, dijaga pola makanya ya sayang...';
    } else {
      return 'Ayo...perbanyak makan lagi!!';
    }
  }
}
