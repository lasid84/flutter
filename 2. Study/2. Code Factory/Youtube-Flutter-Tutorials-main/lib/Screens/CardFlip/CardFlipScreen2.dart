import 'dart:math';

import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardFlipScreen2 extends StatefulWidget {
  @override
  _CardFlipScreenState2 createState() => _CardFlipScreenState2();
}

class _CardFlipScreenState2 extends State<CardFlipScreen2> {
  List<bool> showFronts;

  @override
  void initState() {
    super.initState();

    showFronts = [false, false];
  }

  renderCard({
    @required Key key,
    bool isBack = true,
    bool isThree = true,
  }) {
    assert(key != null);

    String path = 'assets/';

    if (isBack) {
      path += 'back.jpg';
    } else {
      if (isThree) {
        path += '3.jpg';
      } else {
        path += '8.jpg';
      }
    }

    return Image.asset(
      path,
      key: key,
      width: 150.0,
      height: 250.0,
    );
  }

  renderFront({
    bool isThree = true,
  }) {
    return renderCard(
      key: ValueKey(isThree ? 3 : 8),
      isThree: isThree,
      isBack: false,
    );
  }

  renderBack() {
    return renderCard(key: ValueKey(false));
  }

  Widget transitionBuilder(
      Widget widget, Animation<double> animation, bool showFront) {
    final rotate = Tween(begin: pi, end: 0.0).animate(animation);

    return AnimatedBuilder(
      animation: rotate,
      child: widget,
      builder: (_, widget) {
        final isBack = showFront
            ? widget.key == ValueKey(false)
            : widget.key != ValueKey(false);

        print(widget.key);

        final value = isBack ? min(rotate.value, pi / 2) : rotate.value;

        double tilt = ((animation.value - 0.5).abs() - 0.5) * 0.001;

        tilt *= isBack ? -1 : 1;

        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  // Widget transitionBuilder(Widget widget, Animation<double> animation) {
  //   final rotate = Tween(begin: pi, end: 0.0).animate(animation);
  //
  //   return AnimatedBuilder(
  //     animation: rotate,
  //     child: widget,
  //     builder: (_, widget) {
  //       // final isBack = showFront
  //       //     ? widget.key == ValueKey(false)
  //       //     : widget.key != ValueKey(false);
  //       //
  //       // final value = isBack ? min(rotate.value, pi / 2) : rotate.value;
  //       //
  //       // var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.0025;
  //       //
  //       // tilt *= isBack ? -1.0 : 1.0;
  //
  //       return Transform(
  //         // transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
  //         transform: Matrix4.rotationY(rotate.value),
  //         child: widget,
  //         alignment: Alignment.center,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showFronts = [
                      !showFronts[0],
                      showFronts[1],
                    ];
                  });
                },
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget widget, Animation<double> animation) {
                    return transitionBuilder(widget, animation, showFronts[0]);
                  },
                  layoutBuilder: (widget, list) {
                    return Stack(
                      children: [widget, ...list],
                    );
                  },
                  child: showFronts[0] ? renderFront() : renderBack(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showFronts = [
                      showFronts[0],
                      !showFronts[1],
                    ];
                  });
                },
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget widget, Animation<double> animation) {
                    return transitionBuilder(widget, animation, showFronts[1]);
                  },
                  layoutBuilder: (widget, list) {
                    return Stack(
                      children: [widget, ...list],
                    );
                  },
                  child: showFronts[1] ? renderFront(isThree: false) : renderBack(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
