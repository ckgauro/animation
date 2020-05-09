import 'package:animation/Animations/data.dart';
import 'package:flutter/material.dart';

class AnimationDefExample extends StatefulWidget {
  @override
  _AnimationDefExampleState createState() => _AnimationDefExampleState();
}

class _AnimationDefExampleState extends State<AnimationDefExample> {
  final GlobalKey _cardKey = GlobalKey();
  Size cardSize;
  var _dropDown = true;
  var _isFirst = true;
  Offset cardPosition;
  double _height = 500;
  double _maxheight = 0;
  getSizeAndPosition() {
    RenderBox _cardBox = _cardKey.currentContext.findRenderObject();
    cardSize = _cardBox.size;
    cardPosition = _cardBox.localToGlobal(Offset.zero);
    print('Height:--->${cardSize.height}');
    print(cardPosition);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Examples',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                        icon: Icon(_dropDown
                            ? Icons.arrow_upward
                            : Icons.arrow_downward),
                        onPressed: () {
                          setState(() {
                            print('Example Clicked');

                            _dropDown = !_dropDown;
                            // _height = _dropDown ? cardSize.height : 0;
                            if (_isFirst) {
                              getSizeAndPosition();
                              print('_isFirst --->$_isFirst');
                              _maxheight = cardSize.height;
                            }
                            _height = _dropDown ? _maxheight : 0;
                            _isFirst = false;
                          });
                        })
                  ],
                ),
              ),
            ),
            if (_isFirst)
              Card(
                key: _cardKey,
                elevation: 10,
               // color: Colors.red,
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: lsData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(lsData[index]),
                        );
                      },
                    ),
                  ],
                ),
              ),
            if (!_isFirst)
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                height: _height,
                child: Container(
                  //keyContext = stickyKey.currentContext;
                  // height: _height,
                  //height: _height,
                  child: Card(
                    elevation: 10,
                    child: Container(
                     // color: Colors.red,
                      child: ListView.builder(
                        itemCount: lsData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(lsData[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            Text("Size - $cardSize"),
            Text("Position - $cardPosition "),
          ],
        ),
      ),
    );
  }
}
