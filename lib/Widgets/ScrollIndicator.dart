import 'package:flutter/material.dart';

//from pub.dev
class ScrollIndicatore extends StatefulWidget {

  ///
  final ScrollController scrollController;
  final double width, height, indicatorHeight;
  final Decoration decoration, indicatorDecoration;
  final AlignmentGeometry alignment;
  ScrollIndicatore(
      {required this.scrollController,
        this.width =10 ,
        this.height = 100,
        this.indicatorHeight = 30,
        this.decoration = const BoxDecoration(color: Colors.black26),
        this.indicatorDecoration = const BoxDecoration(color: Colors.black),
        this.alignment = Alignment.center});

  @override
  _ScrollIndicatoreState createState() => _ScrollIndicatoreState();
}

class _ScrollIndicatoreState extends State<ScrollIndicatore> {
  double currentPixels = 0.0;
  double mainContainer = 0.0;
  double move = 0.0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  void _scrollListener() {
    setState(() {
      currentPixels = widget.scrollController.position.pixels;
      mainContainer =
          widget.scrollController.position.maxScrollExtent / widget.height;
      move = (currentPixels / mainContainer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Container(
        height: widget.height+ widget.indicatorHeight,
        width: widget.width ,
        decoration: widget.decoration,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
               top: move,
                child: Container(
                  height: widget.indicatorHeight,
                  width: widget.width,
                  decoration: widget.indicatorDecoration,
                )),
          ],
        ),
      ),
    );
  }
}