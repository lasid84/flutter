import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextAnimation extends GetxController with SingleGetTickerProviderMixin {
  Map<String, String?>? post;

  AnimationController? animationController;
  Animation<Offset>? animationOffset;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this);

    final curve =
        CurvedAnimation(parent: animationController!, curve: Curves.bounceIn);
    animationOffset = Tween<Offset>(
            begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0))
        .animate(curve);

    animationController!.repeat();

    _loadData();
  }

  void _loadData() {
    post = Get.parameters;
  }
}
