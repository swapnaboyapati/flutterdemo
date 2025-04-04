import 'package:flutter/material.dart';

/// A customizable numeric keypad widget.
///
/// This widget provides a number pad with digits 0-9, a clear button ('C'), and a backspace button ('⌫').
/// Each key press triggers a callback function to handle user input.
class NumberPad extends StatelessWidget {
  /// Callback function triggered when a key is pressed.
  final Function(String) onKeyPressed;

  /// Creates a [NumberPad] widget.
  ///
  /// The [onKeyPressed] parameter is required to handle key press events.
  const NumberPad({super.key, required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    // List of keys displayed on the number pad.
    List<String> keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "C", "0", "⌫"];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
      ),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onKeyPressed(keys[index]),
          child: Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 2, offset: const Offset(2, 2)),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              keys[index],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}