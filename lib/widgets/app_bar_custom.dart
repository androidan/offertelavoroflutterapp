import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final String content;
  const AppBarCustom(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            //color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: const FlutterLogo(
            size: 30,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.business_center_rounded,
              color: Theme.of(context).primaryColorDark,
              size: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                content,
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark, fontSize: 16),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            Icons.sunny,
            color: Theme.of(context).primaryColorDark,
          ),
        )
      ],
    );
  }
}
