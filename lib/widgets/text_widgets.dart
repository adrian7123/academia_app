import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const H1(
    this.text, {
    super.key,
    this.style,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class H2 extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const H2(
    this.text, {
    super.key,
    this.style,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class Paragraph extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const Paragraph(
    this.text, {
    super.key,
    this.style,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            color: Colors.grey[700],
            fontSize: 20,
            letterSpacing: 1.1,
          ),
    );
  }
}
