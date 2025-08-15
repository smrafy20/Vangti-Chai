import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/keypad.dart';
import '../widgets/change_display.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int point = 0;
  String taka = "";
  int takaCounter = 0;
  List<int> changeArray = [0, 0, 0, 0, 0, 0, 0, 0];
  
  void addTaka(String digit) {
    setState(() {
      if (digit == "CLEAR") {
        taka = "";
        takaCounter = 0;
        changeArray = [0, 0, 0, 0, 0, 0, 0, 0];
      } else {
        taka += digit;
        takaCounter = int.parse(taka);
        for (int i = 0; i < DENOMINATIONS.length; i++) {
          changeArray[i] = takaCounter ~/ int.parse(DENOMINATIONS[i]);
          takaCounter -= changeArray[i] * int.parse(DENOMINATIONS[i]);
        }
      }
    });
  }

  List<double> _getContextValues(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return [
        14,
        MediaQuery.sizeOf(context).width / 10,
        MediaQuery.sizeOf(context).height / 20,
      ];
    } else {
      return [
        16,
        MediaQuery.sizeOf(context).width / 6,
        MediaQuery.sizeOf(context).height / 12,
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final contextValues = _getContextValues(context);
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                style: TextStyle(fontSize: contextValues[0]),
                'Taka: $taka',
              ),
            ),
            SizedBox(height: isLandscape ? contextValues[2] / 40 : contextValues[2] / 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChangeDisplay(
                  contextValues: contextValues,
                  changeArray: changeArray,
                  isLandscape: isLandscape,
                ), 
                Keypad(
                  contextValues: contextValues,
                  onKeyPress: addTaka,
                  isLandscape: isLandscape,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
