import 'package:flutter/material.dart';

class AlertWidget extends StatefulWidget {
  final Color color;
  final Widget icon;
  final Widget child;
  const AlertWidget({
    super.key,
    this.color = Colors.redAccent,
    required this.icon,
    required this.child,
  });

  @override
  State<AlertWidget> createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              children: [
                widget.icon,
                const SizedBox(width: 10),
                widget.child,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
