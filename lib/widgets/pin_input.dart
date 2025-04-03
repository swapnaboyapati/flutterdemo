import 'package:flutter/material.dart';

/// A stateless widget that displays a masked PIN input field.
///
/// This widget takes a PIN string and displays a series of boxes, where each
/// entered digit is represented by an asterisk (*).
class PinInput extends StatelessWidget {
  /// The PIN value to be displayed as masked input.
  final String pin;

  /// Creates a [PinInput] widget.
  ///
  /// The [pin] parameter is required and represents the entered PIN.
  const PinInput({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              index < pin.length ? "*" : "",
              style: const TextStyle(fontSize: 24),
            ),
          );
        }),
      ),
    );
  }
}