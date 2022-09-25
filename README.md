Pinch to scale any double value for text / image size or what you want, you can save new value to local storage.

[Get on pub.dev](https://pub.dev/packages/pinch_scale)

<img src="https://raw.githubusercontent.com/demirdev/pinch_scale/main/example/doc/assets/demo.gif" alt="Example Project" />

## Usage for text size changer
```dart
class TextSizeChanger extends StatelessWidget {
  TextSizeChanger({Key? key}) : super(key: key);

  final baseTextSizeValue = 20.0;
  late final fontSize = ValueNotifier<double>(baseTextSizeValue);

  @override
  Widget build(BuildContext context) {
    return PinchScale(
      baseValue: baseTextSizeValue,
      currentValue: () => fontSize.value,
      onValueChanged: (double newFontSize) => fontSize.value = newFontSize,
      child: Center(
        child: ValueListenableBuilder<double>(
          valueListenable: fontSize,
          builder: (context, fontSize, child) {
            return Text(
              r'''Balıklıgöl appears to have been a venerated site long before the time of Abraham, as a statue was found there which dates to the Pre-Pottery Neolithic period (roughly 8000 B.C.).[1] Like the city of Urfa itself, the subsequent history of the site is uncertain until the Hellenistic period, when the city was conquered by Macedonian forces under Alexander the Great, and it was renamed Edessa by the general Seleucus I. During the Hellenistic period, Edessa was one of the holy sites of the Syrian goddess Atargatis, which also had prominent centers throughout Syria and the Levant in places such as Hierapolis and Ashkelon. In these locations as well, pools of fish were sacred locations, and people were forbidden from consuming them.[2] While Lucian himself does not explicitly mention Edessa as a holy site for Atargatis, it is a plausible speculation given the widespread presence of sacred pools throughout the region.

In the period of Late Antiquity, the site was connected to the history of Abraham and his confrontation with Nimrod. This connection originally dates back to a first century AD Jewish haggada by Pseudo-Philo, which sketches out the basic outline of the story which would eventually have so much significance, where Nimrod, angered by Abraham's rejection of his worship of idols and construction of the Tower of Babel, attempted to burn the patriarch alive, only for him to be miraculously rescued from the flames.[3] The story would later appear in rabbinic literature such as the Genesis Rabbah. Due to the similarity between the Hebrew word ’or (“flame, fire”) and the city Ur, later commentators saw the declaration “I am the Lord who brought you out of Ur of the Chaldees [lit: Ur Kasdim]” in Genesis 15:7 as a reference to this confrontation.[4] Even amongst the scholars who identified Ur of the Chaldees as a location rather than an event, many still sought to connect it to the conflict between Abraham and Nimrod. While one proposed location was the ancient city of Ur in southern Mesopotamia, another was Urfa, and this latter location was favored by most of the ancient traditions.[5] Even as late as eighteenth century, the local Jewish population claimed Urfa to be the site of this confrontation between Abraham and Nimrod.[6]

While the majority of Jewish and subsequent Christian and Muslim commentators considered Urfa to be the birthplace of Abraham, this did not necessarily mean there was an explicit connection to Nimrod. For instance, when the late fourth century AD Christian pilgrim Egeria visited the city, she noted in particular that “there were fountains full of fish such as I never saw before, of so great size, so bright and of so good a flavour were they.”[7] However, in her detailed description of the pool, instead of Abraham and Nimrod, she associated the site with the more recent history of King Abgar V of Osroene, who supposedly was one of the first monarchs to convert to Christianity. According to Egeria, the local bishop claimed the pool was created when the city was besieged by the Persians, who had diverted the city's water supply to their own camp. However, as soon as they had done so, “the fountains which you see in this place burst forth at once at God's bidding, and by the favour of God they remain here from that day to this.”[8] For some early Christians then, the pool did have a miraculous origin, but it was one unrelated to Abraham.''',
              style: TextStyle(fontSize: fontSize),
            );
          },
        ),
      ),
    );
  }
}
```
## Usage for image height changer
```dart
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
```

## Additional information
