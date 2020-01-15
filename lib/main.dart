import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      home: SingleMusicPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SingleMusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0.1,
              0.7,
              1
            ],
                colors: [
              Colors.grey[300],
              Colors.lightBlue[100],
              Colors.white
            ])),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RoundButton(Icons.arrow_back),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "PLAYING NOW",
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Colors.grey[600]),
                    ),
                  ),
                  RoundButton(Icons.menu)
                ],
              ),
              Container(
                width: 215,
                height: 215,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300], width: 6.0),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6.0,
                        offset: new Offset(7.0, 7.0)),
                    new BoxShadow(
                        color: Colors.white,
                        blurRadius: 6.0,
                        offset: new Offset(-7.0, -7.0))
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://cdn.pastemagazine.com/www/articles/taylorswift_lover_main.jpg"),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Lover",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.grey[700]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Taylor Swift",
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.grey[600]),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: MusicSlider()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundMusicButton(Icons.fast_rewind),
                  RoundMusicButton(Icons.pause),
                  RoundMusicButton(Icons.fast_forward)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData iconData;

  RoundButton(this.iconData);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Icon(
        iconData,
        size: 17.0,
        color: Colors.grey[600],
      ),
      color: Colors.grey[300],
      shape:
          CircleBorder(side: BorderSide(width: 2.0, color: Colors.grey[350])),
      onPressed: () {},
    );
  }
}

class RoundMusicButton extends StatelessWidget {
  final IconData iconData;

  RoundMusicButton(this.iconData);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Icon(
          iconData,
          size: 20.0,
          color: Colors.grey[600],
        ),
      ),
      color: Colors.grey[300],
      shape:
          CircleBorder(side: BorderSide(width: 2.0, color: Colors.grey[350])),
      onPressed: () {},
    );
  }
}

class MusicSlider extends StatefulWidget {
  @override
  _MusicSliderState createState() => _MusicSliderState();
}

class _MusicSliderState extends State<MusicSlider> {
  double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      onChanged: (double value) {
        setState(() => _sliderValue = value);
      },
      value: _sliderValue,
      min: 1,
      max: 100,
    );
  }
}
