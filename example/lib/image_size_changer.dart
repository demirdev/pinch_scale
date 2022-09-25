import 'package:flutter/material.dart';
import 'package:pinch_scale/pinch_scale.dart';

class ImageSizeChanger extends StatelessWidget {
  ImageSizeChanger({Key? key}) : super(key: key);

  final double imageHeightBaseValue = 250;
  late final ValueNotifier<double> imageHeight =
      ValueNotifier<double>(imageHeightBaseValue);

  @override
  Widget build(BuildContext context) {
    return PinchScale(
      baseValue: imageHeightBaseValue,
      maxValue: MediaQuery.of(context).size.height,
      currentValue: () => imageHeight.value,
      onValueChanged: (double height) => imageHeight.value = height,
      child: Center(
        child: ValueListenableBuilder<double>(
          valueListenable: imageHeight,
          builder: (context, fontSize, child) {
            return Image.network(
              'https://images.unsplash.com/photo-1520763185298-1b434c919102?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2532&q=80',
              height: imageHeight.value,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
