import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements FlareController {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.purple),
          child: Stack(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.

            children: <Widget>[
              Column(
                children: [
                  Container(
                    height: 300
                    ,
                    child: FlareActor("assets/progress.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: "Untitled",
                        controller: this),
                  ),
                  Slider(
                    value: _progress,
                    min: 0.0,
                    max: 1.0,
                    divisions: null,
                    onChanged: (double value) {
                      setState(() {
                        _progress = value;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }

  ActorAnimation _animation;

  double _progress = 0.0;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _animation.apply(_progress, artboard, 1);
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    _animation = artboard.getAnimation("Untitled");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
