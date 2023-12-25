import 'package:academia_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ScaffoldBase extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  const ScaffoldBase({
    super.key,
    required this.body,
    this.appBar,
  });
  @override
  State<ScaffoldBase> createState() => _ScaffoldBaseState();
}

class _ScaffoldBaseState extends State<ScaffoldBase> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      appBar: widget.appBar ?? CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(),
              Container(
                margin: const EdgeInsets.only(left: 4),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
                width: screenWidth / 2,
                height: 3,
              ),
              widget.body,
            ],
          ),
        ),
      ),
    );
  }
}
