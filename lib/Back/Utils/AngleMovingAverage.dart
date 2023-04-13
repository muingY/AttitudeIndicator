// ignore_for_file: file_names
import 'dart:math' as math;

class AngleMovingAverage {
  int scopeSize;
  List<double> cosBuffer;
  List<double> sinBuffer;
  int index = 0;

  AngleMovingAverage({required this.scopeSize})
      : cosBuffer = List.generate(scopeSize, (i) => 0.0),
        sinBuffer = List.generate(scopeSize, (i) => 0.0);

  double update(double angle) {
    double radian = angle * math.pi / 180;
    double cosValue = math.cos(radian);
    double sinValue = math.sin(radian);

    cosBuffer[index] = cosValue;
    sinBuffer[index] = sinValue;
    index = (index + 1) % scopeSize;

    double cosSum = cosBuffer.fold(0.0, (acc, val) => acc + val);
    double sinSum = sinBuffer.fold(0.0, (acc, val) => acc + val);

    double cosAvg = cosSum / scopeSize.toDouble();
    double sinAvg = sinSum / scopeSize.toDouble();

    double avgAngle = math.atan2(sinAvg, cosAvg) * 180 / math.pi;
    return avgAngle;
  }
}
