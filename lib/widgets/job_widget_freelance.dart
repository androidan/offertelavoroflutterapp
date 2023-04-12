import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';

class JobWidgetFreelance extends StatelessWidget {
  //final Coin coin;
  final void Function()? onPressed;

  const JobWidgetFreelance(AnnuncioFreelanceModel annunciFreelance, {
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: ListTile(
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
        ),
      );
}
