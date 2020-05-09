import 'package:animation/Animations/AnimatedContainerDemo.dart';
import 'package:animation/Animations/AnimationCard.dart';
import 'package:animation/Animations/AnimationDef.dart';
import 'package:animation/Animations/AnimationFadeDemo.dart';
import 'package:animation/Animations/AnimationList.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animations'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).push();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimatedContainerDemo()));
              },
              child: Text('AnimateContainer'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).push();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimationFadeDemo()));
              },
              child: Text('AnimateFade'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).push();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimationCard()));
              },
              child: Text('AnimationCard'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).push();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimationList()));
              },
              child: Text('AnimationList'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).push();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimationDefExample()));
              },
              child: Text('Animation Def'),
            ),
          ],
        ),
      ),
    );
  }
}
