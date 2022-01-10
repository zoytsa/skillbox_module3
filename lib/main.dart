// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EnlargeCaruselWidget(images: [
            SvgAssetsWidget(),
            SvgNetworkWidget(),
          ]),
          // SvgAssetsWidget(),
          // SvgWidget(),
          const Text(
            'This is a carusel slider...',
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SvgNetworkWidget extends StatelessWidget {
  const SvgNetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String uriName =
        "http://upload.wikimedia.org/wikipedia/commons/0/02/SVG_logo.svg";
    return Container(
      child: SvgPicture.network(
        uriName,
        placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator()),
      ),
    );
  }
}

class SvgAssetsWidget extends StatelessWidget {
  const SvgAssetsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fileName = "assets/jump_button.svg";
    return Container(
      child: SvgPicture.asset(
        fileName,
        color: Colors.blueGrey[200],
        matchTextDirection: true,
      ),
    );
  }
}

class EnlargeCaruselWidget extends StatelessWidget {
  final List<Widget> images;

  const EnlargeCaruselWidget({Key? key, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          scrollDirection: Axis.horizontal,
        ),
        items: images,
      ),
    );
  }
}
