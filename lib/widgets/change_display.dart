import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ChangeDisplay extends StatelessWidget {
  final List<double> contextValues;
  final List<int> changeArray;
  final bool isLandscape;

  const ChangeDisplay({
    Key? key,
    required this.contextValues,
    required this.changeArray,
    this.isLandscape = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLandscape ? changeLandscape() : change();
  }

  Column change() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var i = 0; i < DENOMINATIONS.length; i++) ...[
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              style: TextStyle(fontSize: contextValues[0]),
              '${DENOMINATIONS[i]}: ${changeArray[i]}',
            ),
          ),
          SizedBox(height: contextValues[2] / 70),
        ],
      ],
    );
  }

  Row changeLandscape() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i = 0; i < DENOMINATIONS.length ~/ 2; i++) ...[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  style: TextStyle(fontSize: contextValues[0]),
                  '${DENOMINATIONS[i]}: ${changeArray[i]}',
                ),
              ),
              SizedBox(height: contextValues[2] / 40),
            ],
          ],
        ),
        SizedBox(width: contextValues[1]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i = DENOMINATIONS.length ~/ 2; i < DENOMINATIONS.length; i++) ...[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  style: TextStyle(fontSize: contextValues[0]),
                  '${DENOMINATIONS[i]}: ${changeArray[i]}',
                ),
              ),
              SizedBox(height: contextValues[2] / 35),
            ],
          ],
        ),
      ],
    );
  }
}
