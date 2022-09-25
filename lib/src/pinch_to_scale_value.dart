import 'package:flutter/material.dart';

class PinchScale extends StatefulWidget {
  final Widget child;

  PinchScale(
      {Key? key,
      required this.child,
      required this.currentValue,
      required this.onValueChanged,
      required this.baseValue,
      this.ratioForUpdateValueUp = 1.1,
      this.ratioForUpdateValueDown = 0.9,
      this.minValue = 0.5,
      this.maxValue = 15.0})
      : super(key: key);
  final double baseValue;

  final double minValue;
  final double maxValue;

  final double ratioForUpdateValueUp;
  final double ratioForUpdateValueDown;

  final double Function() currentValue;
  final Function(double newFontSize) onValueChanged;

  @override
  State<PinchScale> createState() => _PinchScaleState();
}

class _PinchScaleState extends State<PinchScale> {
  late final double baseSize;
  double baseScale = 1.0;
  double scale = 1.0;
  double size = 24.0;

  @override
  void initState() {
    baseSize = widget.baseValue;
    size = widget.currentValue();
    baseScale = size / baseSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onScaleStart: (details) {
          baseScale = scale;
        },
        onScaleUpdate: (details) {
          if (details.scale == 1.0) {
            return;
          }
          final _fontScale = (baseScale * details.scale)
              .clamp(widget.minValue, widget.maxValue);
          final _value = _fontScale * baseSize;

          final _currentValue = widget.currentValue();

          final thresoldCurrentFontSizeUp =
              (widget.ratioForUpdateValueUp * _currentValue);
          final thresoldCurrentFontSizeDown =
              (widget.ratioForUpdateValueDown * _currentValue);

          if (_value <= thresoldCurrentFontSizeDown ||
              _value >= thresoldCurrentFontSizeUp) {
            size = _value;
            scale = _fontScale;
            widget.onValueChanged(_value);
          }
        },
        child: widget.child);
  }
}
