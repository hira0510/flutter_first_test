import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_first_test/size_fit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///🟢DEBUG模式🟢 debugPaintSizeEnabled = true;
    HYSizeFit.init(context);
    return Center(
        child: Container(
      width: HYSizeFit.W(300),
      height: HYSizeFit.W(300),

      ///🟢全部外部間距🟢 margin: const EdgeInsets.all(10),
      ///🟢單邊外部間距🟢 margin: const EdgeInsets.only(left: HYSizeFit.W(30), right: 10, top: 100, bottom: 200),
      ///🟢內部間距🟢
      padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
      constraints: const BoxConstraints(
          maxWidth: 375, maxHeight: 667, minWidth: 50, minHeight: 50),
      alignment: Alignment.topCenter,

      /// 🟢有decoration就不能在這設定顏色🟢color: Colors.deepPurple,
      child: const Text(
        '首頁首頁首頁首頁首頁首頁首頁首頁首頁首頁首頁首頁',
        style: TextStyle(color: Colors.cyanAccent),

        ///🟢尾句為...🟢
        overflow: TextOverflow.ellipsis,
      ),
      decoration: BoxDecoration(
          color: Colors.pink,

          /// 🟢形状（圆形与矩形）🟢shape: BoxShape.circle,
          border: Border.all(width: 3, color: Colors.green),
          borderRadius: const BorderRadius.all(Radius.circular(20)),

          ///🟢漸層🟢
          gradient: const RadialGradient(
              colors: [Colors.deepPurple, Colors.teal, Colors.lightBlue],
              radius: 1,
              tileMode: TileMode.decal),
          ///🟢背景圖🟢
          image: const DecorationImage(
              image: NetworkImage(
                  'https://avatar.csdn.net/8/9/A/3_chenlove1.jpg')),

          /// 🟢可控其中一角🟢 borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          /// 🟢可控其中一邊🟢 borderRadius: const BorderRadius.all(Radius.elliptical(100, 100)),
          /// 🟢位置由offset决定,模糊层度由blurRadius大小决定（大就更透明更扩散）,模糊大小由spreadRadius决定🟢
          boxShadow: const [
            BoxShadow(
                color: Colors.amber,
                offset: Offset(5.0, 5.0),
                blurRadius: 10,
                spreadRadius: 2),
            BoxShadow(
                color: Colors.black,
                offset: Offset(1, 1),
                blurRadius: 5,
                spreadRadius: 3)
          ]),
    ));
  }
}
