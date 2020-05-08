
import 'package:flutter/material.dart';


class AnimationFadeDemo extends StatefulWidget {
  @override
  _AnimationFadeDemoState createState() => _AnimationFadeDemoState();
}

class _AnimationFadeDemoState extends State<AnimationFadeDemo> {
  var shouldWelcomeUser = true;
  double _newValue=50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Fade'),
      ),
      body: Column(
        children: <Widget>[
          Text('Animation Fade'),
          AnimatedCrossFade(
            firstChild: Container(
                color: Colors.green[300],
                width: _newValue,
                height: _newValue,
                child: Text('Hello ', style: TextStyle(fontSize: _newValue-40),),),
            secondChild: Container(
                color: Colors.red[300],
                width: _newValue,
                height: _newValue,
                child: Text('Bye ')),
            crossFadeState: shouldWelcomeUser
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 3000),
            firstCurve: Curves.easeInCubic,
            secondCurve: Curves.easeInCubic,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {

                shouldWelcomeUser = !shouldWelcomeUser;
                _newValue=shouldWelcomeUser?50:100;
              });
            },
            child: Text('Animate'),
          )
        ],
      ),
    );
  }
}
