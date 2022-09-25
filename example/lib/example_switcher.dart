import 'package:example/image_size_changer.dart';
import 'package:example/text_size_changer.dart';
import 'package:flutter/material.dart';

class ExampleSwitcher extends StatefulWidget {
  const ExampleSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  State<ExampleSwitcher> createState() => _ExampleSwitcherState();
}

class _ExampleSwitcherState extends State<ExampleSwitcher> {
  final examples = [
    TextSizeChanger(),
    ImageSizeChanger(),
  ];
  int currentExample = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        examples[currentExample],
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Card(
            margin: EdgeInsets.zero,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Select Example',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () => showExample(1),
                          child: Row(children: [
                            Icon(Icons.image),
                            Text('Scale image')
                          ])),
                      ElevatedButton(
                          onPressed: () => showExample(0),
                          child: Row(children: [
                            Icon(Icons.text_decrease),
                            Text('Scale Text')
                          ])),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void showExample(int i) {
    return setState(() {
      currentExample = i;
    });
  }
}
