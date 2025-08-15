import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ChangeDisplay extends StatelessWidget {
  final List<double> contextValues;
  final List<int> changeArray;
  final bool isLandscape;
  
  // Store the global BuildContext
  static late BuildContext _globalContext;

  const ChangeDisplay({
    Key? key,
    required this.contextValues,
    required this.changeArray,
    this.isLandscape = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Store the context for later use
    _globalContext = context;
    return isLandscape ? changeLandscape() : change();
  }

  Column change() {
    final context = _globalContext;
    final textColor = Theme.of(context).brightness == Brightness.dark 
        ? Colors.white 
        : Colors.black87;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var i = 0; i < DENOMINATIONS.length; i++) ...[
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${DENOMINATIONS[i]}: ${changeArray[i]}',
                  style: TextStyle(
                    fontSize: contextValues[0],
                    color: textColor,
                    fontWeight: changeArray[i] > 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: contextValues[2] / 70),
        ],
      ],
    );
  }

  Row changeLandscape() {
    final context = _globalContext;
    final textColor = Theme.of(context).brightness == Brightness.dark 
        ? Colors.white 
        : Colors.black87;
        
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i = 0; i < DENOMINATIONS.length ~/ 2; i++) ...[
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${DENOMINATIONS[i]}: ${changeArray[i]}',
                      style: TextStyle(
                        fontSize: contextValues[0],
                        color: textColor,
                        fontWeight: changeArray[i] > 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
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
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${DENOMINATIONS[i]}: ${changeArray[i]}',
                      style: TextStyle(
                        fontSize: contextValues[0],
                        color: textColor,
                        fontWeight: changeArray[i] > 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
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
