import 'dart:ui';

import 'package:flutter/material.dart';

class JobAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget child;

  @override
  final Size preferredSize;
  final bool blur;

  const JobAppBar({
    Key? key,
    required this.child,
    this.blur = true,
  })  : preferredSize = const Size.fromHeight(100.0),
        super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur ? 15 : 0,
            sigmaY: blur ? 15 : 0,
          ),
          child: Container(
            //color: Colors.grey.shade200,
            child: child,
            padding: const EdgeInsets.only(
              top: 58.0,
              right: 24.0,
              left: 24.0,
              bottom: 16.0,
            ),
          ),
        ),
      );
}
