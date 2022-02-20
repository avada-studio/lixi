import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lixi/app/app_resources/app_colors.dart';
import 'package:lixi/app/app_resources/app_dimens.dart';
import 'package:lixi/app/app_resources/app_images.dart';
import 'package:lixi/entities/item.dart';
import 'package:lixi/enums/item_type.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ContentView();
  }
}

class _ContentView extends StatefulWidget {
  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<_ContentView> {
  StreamController<int> controller = StreamController<int>();

  final AudioPlayer audioPlayer = AudioPlayer();

  int _selected = 1;

  List<Item> items = [
    Item("500.000", "", ItemType.Normal, 1),
    Item(
      "Lời chúc",
      "Hoa đào nở, chim én về, mùa xuân lại đến. Chúc một năm mới: nghìn sự như ý, vạn sự như mơ, triệu sự bất ngờ, tỷ lần hạnh phúc.",
      ItemType.Message,
      5,
    ),
    Item("200.000", "", ItemType.Normal, 5),
    Item(
      "Lời chúc",
      "Hoa đào nở, chim én về, mùa xuân lại đến. Chúc một năm mới: nghìn sự như ý, vạn sự như mơ, triệu sự bất ngờ, tỷ lần hạnh phúc.",
      ItemType.Message,
      5,
    ),
    Item("100.000", "", ItemType.Normal, 10),
    Item(
      "Lời chúc",
      "Hoa đào nở, chim én về, mùa xuân lại đến. Chúc một năm mới: nghìn sự như ý, vạn sự như mơ, triệu sự bất ngờ, tỷ lần hạnh phúc.",
      ItemType.Message,
      5,
    ),
    Item("50.000", "", ItemType.Normal, 20),
    Item(
      "Lời chúc",
      "Hoa đào nở, chim én về, mùa xuân lại đến. Chúc một năm mới: nghìn sự như ý, vạn sự như mơ, triệu sự bất ngờ, tỷ lần hạnh phúc.",
      ItemType.Message,
      5,
    ),
    Item("20.000", "", ItemType.Normal, 30),
    Item(
      "Lời chúc",
      "Hoa đào nở, chim én về, mùa xuân lại đến. Chúc một năm mới: nghìn sự như ý, vạn sự như mơ, triệu sự bất ngờ, tỷ lần hạnh phúc.",
      ItemType.Message,
      5,
    ),
    Item("10.000", "", ItemType.Normal, 50),
    Item("Thêm lượt", "", ItemType.Normal, 10),
  ];

  List<Color> colors = [
    Color(0xFF363D9E),
    Color(0xFF2B2668),
    Color(0xFF72349A),
    Color(0xFF9E309A),
    Color(0xFFF2212C),
    Color(0xFFF3662D),
    Color(0xFFFDBB43),
    Color(0xFF95CD49),
    Color(0xFF0D9E51),
    Color(0xFF18B2A6),
    Color(0xFF2AB3E6),
    Color(0xFF0A7EC0),
  ];

  @override
  void dispose() {
    controller.close();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
              child: Image.asset(
            AppImages.background,
            fit: BoxFit.cover,
          )),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.huge,
                  right: AppDimens.huge,
                ),
                child: FortuneWheel(
                  rotationCount: 800,
                  duration: Duration(seconds: 40),
                  physics: CircularPanPhysics(
                    duration: Duration(seconds: 1),
                    curve: Curves.decelerate,
                  ),
                  onAnimationEnd: () {
                    var item = items[_selected];
                    if (item.type == ItemType.Message) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(item.message),
                      ));
                    }
                    stop();
                  },
                  animateFirst: false,
                  onFling: () {
                    _selected = findLuckyItem(items, items.length - 1);
                    controller.add(_selected);
                    play();
                  },
                  selected: controller.stream,
                  items: renderFortuneItems(),
                ),
              ))
        ],
      ),
    );
  }

  List<FortuneItem> renderFortuneItems() {
    List<FortuneItem> rs = [];
    for (var i = 0; i < items.length; i++) {
      Item e = items[i];
      rs.add(FortuneItem(
          child: Text(
            e.title,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
          ),
          style: FortuneItemStyle(
            color: getColor(i),
            borderColor: Colors.white,
            borderWidth: 2,
          )));
    }
    return rs;
  }

  Color getColor(int index) {
    return colors[index % colors.length];
  }

  int findLuckyItem(List<Item> items, int defaultIndex) {
    var rng = Random();
    int total = items.fold(0, (p, e) => p + e.range);
    int luckyNumber = rng.nextInt(total);
    print(luckyNumber);
    int flag = 0;
    for (var i = 0; i < items.length; i++) {
      Item e = items[i];
      if (luckyNumber >= flag && luckyNumber < flag + e.range) {
        return i;
      }
      flag += e.range;
    }
    return defaultIndex;
  }

  play() async {
    await audioPlayer.setAsset('assets/audio/bgm.mp3');
    audioPlayer.play();
    await Future.delayed(Duration(milliseconds: 41700));
    audioPlayer.stop();
  }

  stop() async {
    //audioPlayer.stop();
  }

}
