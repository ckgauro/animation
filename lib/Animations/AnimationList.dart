import 'dart:math';

import 'package:flutter/material.dart';

class AnimationList extends StatefulWidget {
  @override
  _AnimationListState createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Container'),
      ),
      body: Stack(
        children: <Widget>[
          Text('This is Demo'),
          Center(
            child:
                // Update this code                  <-- AnimatedContainer
                AnimatedContainer(
              // Use the properties stored in the State class.
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              // Define how long the animation should take.
              duration: Duration(seconds: 1),
              // Provide an optional curve to make the animation feel smoother.
              curve: Curves.fastOutSlowIn,
              child: Text('This is Demo Container'),
            ),
          ),
          updateStateButton()
        ],
      ),
    );
  }

  Align updateStateButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: RaisedButton(
          child: Text('Update State'),
          onPressed: () {
            setState(
              () {
                // Create a random number generator.
                final random = Random();

                // Generate a random width and height.
                _width = random.nextInt(300).toDouble();
                _height = random.nextInt(300).toDouble();
                // Generate a random color.
                _color = Color.fromRGBO(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  1,
                );
                // Generate a random border radius.
                _borderRadius =
                    BorderRadius.circular(random.nextInt(100).toDouble());
              },
            );
          },
        ),
      ),
    );
  }
}

// class SomeOtherWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 200,
//     );
//   }
// }
