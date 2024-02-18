import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  final Widget child;
  final void Function()? onTap;
  final Color color;

  const ChipWidget({
    super.key,
    required this.child,
    this.onTap,
    this.color = Colors.grey,
  });

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    const double radius = 50;

    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: widget.onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: widget.child,
      ),
    );
  }
}
