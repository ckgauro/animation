import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  // state variables                           <-- state
  final _myDuration = Duration(seconds: 30);
  var _myValue = Color(0xFF00BB00);
  final _myNewValue = Color(0xFF0000FF);

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
              color: _myValue,
              duration: _myDuration,
              child: SomeOtherWidget(),
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
            setState(() {
              //                    <-- update state
              _myValue = _myNewValue;
            });
          },
        ),
      ),
    );
  }
}

class SomeOtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
    );
  }
}
