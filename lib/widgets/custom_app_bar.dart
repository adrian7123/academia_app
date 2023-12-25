import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key})
      : super(
          actions: [
            TextButton(
              onPressed: () {
                Modular.to.pushNamed('/about');
              },
              child: const Icon(
                FeatherIcons.helpCircle,
              ),
            ),
            const SizedBox(width: 10),
          ],
        );
}
