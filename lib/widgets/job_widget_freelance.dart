import 'package:flutter/material.dart';

class JobWidgetFreelance extends StatelessWidget {
  //final Coin coin;

  const JobWidgetFreelance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: const Text(
          'Esempio | Sviluppo App Mobile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          'Sviluppo App Mobile',
        ),
        leading: Container(
          width: 45,
          height: 45,
          child: Center(
              child: Text(
            '📱',
            style: TextStyle(fontSize: 30),
          )),
        ),
      );
}
