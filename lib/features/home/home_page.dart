import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:lixi/app/app_resources/app_colors.dart';
import 'package:lixi/app/app_resources/app_dimens.dart';
import 'package:lixi/app/app_resources/app_images.dart';

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

  List<int> onePercent = [0];
  List<int> sevenPercent = [2];
  List<int> twentyPercent = [4, 11];
  List<int> thirtyPercent = [6];
  List<int> fiftyPercent = [1, 3, 5, 7, 9];
  List<int> oneHundredPercent = [10];

  int _selected = 1;

  List<_Item> items = [
    _Item("500.000", Color(0xFF363D9E), 0),
    _Item("Lời chúc", Color(0xFF2B2668), 1),
    _Item("200.000", Color(0xFF72349A), 0),
    _Item("Lời chúc", Color(0xFF9E309A), 1),
    _Item("100.000", Color(0xFFF2212C), 0),
    _Item("Lời chúc", Color(0xFFF3662D), 1),
    _Item("50.000", Color(0xFFFDBB43), 0),
    _Item("Lời chúc", Color(0xFF95CD49), 1),
    _Item("20.000", Color(0xFF0D9E51), 0),
    _Item("Lời chúc", Color(0xFF18B2A6), 1),
    _Item("10.000", Color(0xFF2AB3E6), 0),
    _Item("Thêm lượt", Color(0xFF0A7EC0), 2),
  ];

  @override
  void dispose() {
    controller.close();
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
                  physics: CircularPanPhysics(
                    duration: Duration(seconds: 1),
                    curve: Curves.decelerate,
                  ),
                  onAnimationEnd: () {
                      var item = items[_selected];
                      if (item.type == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Chúc mừng năm mới"),
                        ));
                      }
                  },
                  animateFirst: false,
                  onFling: () {
                    _selected = random();
                    controller.add(_selected);
                  },
                  selected: controller.stream,
                  items: items
                      .map((e) => FortuneItem(
                          child: Text(
                            e.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                          ),
                          style: FortuneItemStyle(
                            color: e.color,
                            borderColor: Colors.white,
                            borderWidth: 2,
                          )))
                      .toList(),
                ),
              ))
        ],
      ),
    );
  }

  int random() {
    var rng = Random();
    int perCent = rng.nextInt(100);
    if (perCent < 1) {
      int r = rng.nextInt(onePercent.length);
      return onePercent[r];
    } else if (perCent < 7) {
      int r = rng.nextInt(sevenPercent.length);
      return sevenPercent[r];
    } else if (perCent < 20) {
      int r = rng.nextInt(twentyPercent.length);
      return twentyPercent[r];
    } else if (perCent < 30) {
      int r = rng.nextInt(thirtyPercent.length);
      return thirtyPercent[r];
    } else if (perCent < 50) {
      int r = rng.nextInt(fiftyPercent.length);
      return fiftyPercent[r];
    } else {
      int r = rng.nextInt(oneHundredPercent.length);
      return oneHundredPercent[r];
    }
  }
}

class _Item {
  String title;
  Color color;
  int type = 0;

  _Item(this.title, this.color, this.type);
}
