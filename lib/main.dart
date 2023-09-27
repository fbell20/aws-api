import 'package:flutter/material.dart';

void main() => runApp(LoveApp());

class LoveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spread Love'),
        ),
        body: Center(
          child: LoveButton(),
        ),
      ),
    );
  }
}

class LoveButton extends StatefulWidget {
  @override
  _LoveButtonState createState() => _LoveButtonState();
}

class _LoveButtonState extends State<LoveButton> {
  bool _showFireworks = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showFireworks = true;
        });

        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _showFireworks = false;
          });
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/crown.jpeg', // Replace 'crown.png' with the actual name of your crown image
            width: 200,
            height: 200,
            color: Colors.pink,
          ),
          if (_showFireworks)
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fireworks.jpeg'),
                ),
              ),
            ),
          Positioned(
            top: 25,
            child: Text(
              'Press box if you love Farrin',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

