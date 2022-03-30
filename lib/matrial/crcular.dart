import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:soultion/Data/data.dart';
import 'package:soultion/matrial/const.dart';

class Circular extends StatelessWidget {
  const Circular({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
        min: 0,
        max: 100,
        initialValue: xp.toDouble(),
        appearance: CircularSliderAppearance(
            infoProperties: InfoProperties(
                bottomLabelText: "proogres",
                modifier: (double value) {
                  final roundedValue = value.ceil().toInt().toString();
                  return '$roundedValue xp ';
                },
                bottomLabelStyle: TextStyle(color: dark, fontSize: 12)),
            customColors: CustomSliderColors(
                progressBarColor: dark, trackColor: red, dynamicGradient: true),
            size: 100,
            customWidths: CustomSliderWidths(
              handlerSize: 1,
              shadowWidth: 1,
              progressBarWidth: 5,
            )),
        onChange: (double value) {
          print(value);
        });
  }
}
