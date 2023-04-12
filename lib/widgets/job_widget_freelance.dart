import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';

class JobWidgetFreelance extends StatelessWidget {
  final AnnuncioFreelanceModel? annuncioFreelance;
  final void Function()? onPressed;

  const JobWidgetFreelance({
    this.annuncioFreelance,
    this.onPressed,
  });

  factory JobWidgetFreelance.shimmed({Key? key}) =>
      JobWidgetFreelance(annuncioFreelance: null);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: ListTile(
          title: annuncioFreelance != null
              ? Text(
                  'Esempio | Sviluppo App Mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(
                  height: 10,
                  color: Colors.grey,
                ),
          subtitle: annuncioFreelance != null
              ? Text(
                  DateFormat("dd MMMM HH:MM")
                      .format(annuncioFreelance!.jobPosted),
                )
              : Container(
                  height: 10,
                  color: Colors.grey,
                ),
          leading: Container(
            width: 45,
            height: 45,
            child: Center(
              child: annuncioFreelance != null
                  ? Text(
                      annuncioFreelance!.emoji,
                      style: TextStyle(fontSize: 30),
                    )
                  : Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
            ),
          ),
        ),
      );
}
