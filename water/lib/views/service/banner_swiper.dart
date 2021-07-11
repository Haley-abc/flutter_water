import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerSwiperDemo extends StatefulWidget {
  const BannerSwiperDemo({Key? key}) : super(key: key);
  @override
  _BannerSwiperDemoState createState() => _BannerSwiperDemoState();
}

class _BannerSwiperDemoState extends State<BannerSwiperDemo> {
  List<String> banners = <String>[
    'assets/images/activity1.png',
    'assets/images/activity2.png',
    'assets/images/activity3.png',
    'assets/images/activity4.png',
  ];

  @override
  Widget build(BuildContext context) {
    // 计算宽高（按比例）
    double width = MediaQuery.of(context).size.width;
    double height = width * 1.0 / 2.0;
    return Container(
      width: width,
      height: height,
      child: Swiper(// 轮播图组件
        // 轮播图构建器
        itemBuilder: (BuildContext context, index) {
          return Container(
            // 图片左右内边距
            // margin: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
            child: Image.asset(
              // 根据索引获取图片
              banners[index],
              width: width,
              height: height,
              // 指定填充模式
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: banners.length,// 轮播数量
        scrollDirection: Axis.horizontal,// 方向
        autoplay: true,// 是否自动播放
      ),
    );
  }
}
