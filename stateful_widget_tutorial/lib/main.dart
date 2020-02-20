import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  AppWidget() {
    debugPrint("AppWidget - constructor - " + hashCode.toString());
  }

  @override
  _AppWidgetState createState() {
    // TODO: implement createState
    return _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {
  bool _bright = false;

  _brightnessCallback() {
    setState(() => _bright = !_bright);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    debugPrint("_AppWidgetState - build - " + hashCode.toString());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: _bright ? Brightness.light : Brightness.dark),
      home: FlowerWidget(),
    );
  }
}

class FlowerWidget extends StatefulWidget {
  final String imageSrc;
  final VoidCallback brightnessCallback;

  FlowerWidget({Key key, this.imageSrc, this.brightnessCallback})
      : super(key: key) {
    debugPrint("FlowerWidget - constructor - " + hashCode.toString());
  }
  @override
  State<StatefulWidget> createState() {
    debugPrint("FlowerWidget - createState - " + hashCode.toString());
    // TODO: implement createState
    return _FlowerWidget();
  }
}

class _FlowerWidget extends State<FlowerWidget> {
  double _blur = 0;
  _FlowerWidgetState() {
    debugPrint("_FlowerWidgetState - constructor - " + hashCode.toString());
  }

  @override
  void initState() {
    debugPrint("_FlowerWidgetState - initState - " + hashCode.toString());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint(
        "_FlowerWidgetState - didChangeDependencies - " + hashCode.toString());
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    debugPrint("_FlowerWidgetState - didUpdateWidget - " + hashCode.toString());
    // The flower image has changed, so reset the blur.
    _blur = 0;
  }

  void _blurMore() {
    setState(() {
      _blur += 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("_FlowerWidgetState - build - " + hashCode.toString());
    return Scaffold(
      appBar: AppBar(title: Text("Flower"), actions: [
        new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {
              debugPrint("test " + hashCode.toString());
              widget.brightnessCallback();
            })
      ]),
      body: new Container(
        decoration: new BoxDecoration(
            color: Theme.of(context).backgroundColor,
            image: new DecorationImage(
                image: NetworkImage(widget.imageSrc), fit: BoxFit.cover)),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
          child: Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _blurMore,
        tooltip: 'Blur More',
        child: Icon(Icons.add),
      ),
    );
  }
}
