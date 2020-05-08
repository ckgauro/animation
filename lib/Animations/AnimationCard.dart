import 'package:flutter/material.dart';
//https://stackoverflow.com/questions/44990714/flutter-effect-of-flip-card
class AnimationCard extends StatefulWidget {
  @override
  _AnimationCardState createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  ThemeData theme = Theme.of(context);
    return new Scaffold(
      appBar: new AppBar(),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.flip_to_back),
        onPressed: () {
          setState(() {
            if (_controller.isCompleted || _controller.velocity > 0)
              _controller.reverse();
            else
              _controller.forward();
          });
        },
      ),
      body: new Center(
        child: new Stack(
          children: <Widget>[
            new AnimatedBuilder(
              child: new MyCustomCard(colors: Colors.orange),
              animation: _backScale,
              builder: (BuildContext context, Widget child) {
                final Matrix4 transform = new Matrix4.identity()
                  ..scale(1.0, _backScale.value, 1.0);
                return new Transform(
                  transform: transform,
                  alignment: FractionalOffset.center,
                  child: child,
                );
              },
            ),
            new AnimatedBuilder(
              child:  MyCustomCardDef(colors: Colors.blue),
              animation: _frontScale,
              builder: (BuildContext context, Widget child) {
                final Matrix4 transform = new Matrix4.identity()
                  ..scale(1.0, _frontScale.value, 1.0);
                return new Transform(
                  transform: transform,
                  alignment: FractionalOffset.center,
                  child: child,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomCard extends StatelessWidget {
  MyCustomCard({this.colors});

  final MaterialColor colors;

  Widget build(BuildContext context) {
    return new Container(
      alignment: FractionalOffset.center,
      height: 144.0,
      width: 360.0,
      decoration: new BoxDecoration(
        color: colors.shade50,
        border: new Border.all(color: new Color(0xFF9E9E9E)),
      ),
      child: new FlutterLogo(size: 100.0, colors: colors),
    );
  }
}


class MyCustomCardDef extends StatelessWidget {
  MyCustomCardDef({this.colors});

  final MaterialColor colors;

  Widget build(BuildContext context) {
    return new Container(
      alignment: FractionalOffset.center,
      height: 400.0,
      width: 360.0,
      decoration: new BoxDecoration(
        color: colors.shade50,
        border: new Border.all(color: new Color(0xFF9E9E9E)),
      ),
      child: new FlutterLogo(size: 100.0, colors: colors),
    );
  }
}
