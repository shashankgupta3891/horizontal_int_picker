library horizontal_int_picker;

import 'dart:math' as math;
import 'package:flutter/material.dart';

class HorizontalIntPicker extends StatefulWidget {
  const HorizontalIntPicker({
    this.minValue = 0,
    @required this.maxValue,
    this.initial,
    @required this.onSelectedItemChanged,
    this.selectedColor = Colors.blue,
    this.unSelectedColor = Colors.grey,
    this.unitName = '',
    this.scrollWheelDiameterRatio = 2.0,
    this.fontSize = 40,
    this.itemSize = 80.0,
  });

  final int minValue;
  final int maxValue;
  final int initial;
  final ValueChanged<int> onSelectedItemChanged;
  final Color selectedColor;
  final Color unSelectedColor;
  final String unitName;
  final double scrollWheelDiameterRatio;
  final double fontSize;
  final double itemSize;

  @override
  _HorizontalIntPickerState createState() => _HorizontalIntPickerState();
}

class _HorizontalIntPickerState extends State<HorizontalIntPicker> {
  int currentValue;
  FixedExtentScrollController fixedExtentScrollController;

  @override
  void initState() {
    super.initState();
    currentValue = widget.minValue;
    fixedExtentScrollController = FixedExtentScrollController(
        initialItem: widget.initial == null
            ? widget.minValue
            : widget.initial - widget.minValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRect(
        child: Align(
          heightFactor: widget.itemSize / MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Transform.rotate(
              angle: -90 * (math.pi / 180),
              child: ListWheelScrollView.useDelegate(
                controller: fixedExtentScrollController,
                diameterRatio: widget.scrollWheelDiameterRatio,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: (val) {
                  setState(() {
                    currentValue = val + widget.minValue;
                  });
                  widget.onSelectedItemChanged(
                      currentValue); // Sending current value out from widget
                },
                itemExtent: widget.itemSize, //width of child
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: widget.maxValue - widget.minValue + 1,
                  builder: (context, index) {
                    int value = index + widget.minValue;

                    return Transform.rotate(
                      angle: 90 * (math.pi / 180),
                      child: Container(
                        width: widget.itemSize, //height of Child

                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '$value',
                                style: TextStyle(
                                  color: currentValue == value
                                      ? widget.selectedColor
                                      : widget.unSelectedColor,
                                  fontSize: widget.fontSize,
                                  fontWeight: currentValue == value
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              Visibility(
                                visible: currentValue == value,
                                child: Text(
                                  widget.unitName ?? '',
                                  style: TextStyle(
                                    color: currentValue == value
                                        ? widget.selectedColor
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
