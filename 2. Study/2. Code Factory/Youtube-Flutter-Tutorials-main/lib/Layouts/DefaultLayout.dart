import 'package:flutter/material.dart';

class DefaultAppbarLayout extends StatefulWidget {
  final String title;
  final Widget child;
  final Widget floatingActionButton;

  DefaultAppbarLayout(
      {@required Widget child, String title, Widget floatingActionButton})
      : this.title = title ?? '코드팩토리',
        this.child = child,
        this.floatingActionButton = floatingActionButton;

  @override
  _DefaultAppbarLayoutState createState() => _DefaultAppbarLayoutState();
}

class _DefaultAppbarLayoutState extends State<DefaultAppbarLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: widget.child,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
