import 'package:flutter/material.dart';

void main() {
  runApp(ExampleState());
}

class ExampleState extends StatelessWidget {
  const ExampleState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Latihan Flutter",
        home: BiggerText(
          text: "Hello",
        ));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Layar Pertama",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
      ),
      body: Text(
        "Hello World",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BiggerText extends StatefulWidget {
  final String text;

  const BiggerText({super.key, required this.text});

  @override
  State<BiggerText> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textsize = 16.0;
  bool _box = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _box
            ? Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      offset: Offset(3, 6),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: _textsize,
                  ),
                ),
              )
            : Text(
                widget.text,
                style: TextStyle(fontSize: _textsize),
              ),
        ElevatedButton(
          child: Text("Perbesar"),
          onPressed: () {
            setState(() {
              _textsize = 35.0;
              _box = true;
            });
          },
        )
      ],
    );
  }
}
