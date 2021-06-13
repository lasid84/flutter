import 'dart:math';

import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:flutter/material.dart';

class CardFlipScreen extends StatefulWidget {
  @override
  _CardFlipScreenState createState() => _CardFlipScreenState();
}

class _CardFlipScreenState extends State<CardFlipScreen> {
  renderCard({
    @required Key key,
    bool isBack = true,
    bool isThree = true,
  }) {
    assert(key != null);

    String basePath = 'assets/';

    if (isBack) {
      basePath += 'back.jpg';
    } else {
      if (isThree) {
        basePath += '3.jpg';
      } else {
        basePath += '8.jpg';
      }
    }

    return Image.asset(
      basePath,
      width: 150.0,
      height: 250.0,
    );
  }

  renderFront({
    bool isThree = true,
  }) {
    return renderCard(
      key: ValueKey(isThree ? 3 : 2),
      isBack: false,
      isThree: isThree,
    );
  }

  renderBack() {
    return renderCard(
      key: ValueKey(false),
      isBack: true,
    );
  }

  bool showFront;

  @override
  void initState() {
    super.initState();

    showFront = false;
  }

  Widget wrapAnimatedBuilder(Widget widget, Animation<double> animation) {
    final rotate = Tween(begin: pi, end: 0.0).animate(animation);

    return AnimatedBuilder(
      animation: rotate,
      child: widget,
      builder: (_, widget) {
        final isBack = showFront
            ? widget.key == ValueKey(false)
            : widget.key != ValueKey(false);

        final value = isBack ? min(rotate.value, pi / 2) : rotate.value;

        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.0025;

        tilt *= isBack ? -1.0 : 1.0;

        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showFront = !showFront;
                });
              },
              child: AnimatedSwitcher(
                transitionBuilder: wrapAnimatedBuilder,
                layoutBuilder: (widget, list) {
                  return Stack(
                    children: [widget, ...list],
                  );
                },
                duration: Duration(milliseconds: 1000),
                child: showFront ? renderFront() : renderBack(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
