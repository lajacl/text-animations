import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

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
  Color _textColor = Colors.black;

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

  Future<void> _showColorPicker() async {
    final newColor = await showColorPickerDialog(
      context,
      _textColor,
      title: Text('Pick a color'),
    );

    if (newColor != _textColor) {
      setState(() {
        _textColor = newColor;
      });
    }
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
            IconButton(onPressed: _showColorPicker, icon: Icon(Icons.palette)),
          ],
        ),
        body: PageView(
          children: [
            Center(
              child: GestureDetector(
                onTap: toggleVisibility,
                child: AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    'Hello, Flutter!',
                    style: TextStyle(fontSize: 24, color: _textColor),
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: toggleVisibility,
                child: AnimatedOpacity(
                  curve: Curves.bounceOut,
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: Text(
                    'Bye, Flutter!',
                    style: TextStyle(fontSize: 24, color: _textColor),
                  ),
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
