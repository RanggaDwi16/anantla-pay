import 'package:flutter/material.dart';

class NumpadButtonWidget extends StatefulWidget {
  final String number;

  const NumpadButtonWidget({Key? key, required this.number}) : super(key: key);

  @override
  _NumpadButtonWidgetState createState() => _NumpadButtonWidgetState();
}

class _NumpadButtonWidgetState extends State<NumpadButtonWidget> {
  String _amount = "0";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.number == "<") {
            if (_amount.length > 1) {
              _amount = _amount.substring(0, _amount.length - 1);
            } else {
              _amount = "0";
            }
          } else if (_amount == "0") {
            _amount = widget.number;
          } else {
            _amount += widget.number;
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Text(
          widget.number,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
