import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  final List<double> contextValues;
  final Function(String) onKeyPress;
  final bool isLandscape;
  
  // Store the global BuildContext
  static late BuildContext _globalContext;

  const Keypad({
    Key? key,
    required this.contextValues,
    required this.onKeyPress,
    this.isLandscape = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Store the context for later use
    _globalContext = context;
    return isLandscape ? keypadLandscape() : keypad();
  }
  
  // Method to get the global context
  BuildContext _getGlobalContext() {
    return _globalContext;
  }

  Column keypad() => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      keypadRow(["1", "2", "3"]),
      SizedBox(height: 5),
      keypadRow(["4", "5", "6"]),
      SizedBox(height: 5),
      keypadRow(["7", "8", "9"]),
      SizedBox(height: 5),
      keypadRow(["0", "CLEAR"]),
    ],
  );

  Column keypadLandscape() => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      keypadRowLandscape(["1", "2", "3", "4"]),
      SizedBox(height: 5),
      keypadRowLandscape(["5", "6", "7", "8"]),
      SizedBox(height: 5),
      keypadRowLandscape(["9", "0", "CLEAR"]),
    ],
  );

  Row keypadRow(List<String> digits) {
    if (digits.length == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 5),
          keypadButton(digits[0]),
          SizedBox(width: 5),
          keypadButton(digits[1]),
          SizedBox(width: 5),
          keypadButton(digits[2]),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 10),
          keypadButton(digits[0]),
          SizedBox(width: 5),
          keypadButton(digits[1]),
        ],
      );
    }
  }

  Row keypadRowLandscape(List<String> digits) {
    if (digits.length == 4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 5),
          keypadButton(digits[0]),
          SizedBox(width: 5),
          keypadButton(digits[1]),
          SizedBox(width: 5),
          keypadButton(digits[2]),
          SizedBox(width: 5),
          keypadButton(digits[3]),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 5),
          keypadButton(digits[0]),
          SizedBox(width: 5),
          keypadButton(digits[1]),
          SizedBox(width: 5),
          keypadButton(digits[2]),
        ],
      );
    }
  }

  ElevatedButton keypadButton(String digit) {
    final context = _getGlobalContext();
    
    if (digit == "CLEAR") {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: digit == "CLEAR" 
              ? Theme.of(context).colorScheme.error 
              : Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(contextValues[1] * 2 + 5, contextValues[2]),
        ),
        onPressed: () => onKeyPress(digit),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            digit,
            style: TextStyle(
              fontSize: contextValues[0],
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(contextValues[1], contextValues[2]),
      ),
      onPressed: () => onKeyPress(digit),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          digit,
          style: TextStyle(
            fontSize: contextValues[0], 
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
