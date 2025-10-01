import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FadingTextAnimation());
  }
}

class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true;
  bool _isDayMode = true;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _toggleMode() {
    setState(() {
      _isDayMode = !_isDayMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDayMode ? ThemeData.light() : ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fading Text Animation'),
          actions: [
            IconButton(
              onPressed: _toggleMode,
              icon: Icon(_isDayMode ? Icons.mode_night : Icons.sunny),
            ),
          ],
        ),
        body: PageView(
          children: [
            Center(
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: const Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 2),
                child: const Text(
                  'Bye, Flutter!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: toggleVisibility,
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
