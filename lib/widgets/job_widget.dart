import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';

class JobWidget extends StatelessWidget {
  final AnnuncioModel? annuncio;
  final void Function()? onPressed;

  const JobWidget({
    this.annuncio,
    this.onPressed,
  });

  factory JobWidget.shimmed({Key? key}) => JobWidget(annuncio: null);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: ListTile(
          title: annuncio != null
              ? Text(
                  annuncio!.titolo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(
                  height: 10,
                  color: Colors.grey,
                ),
          subtitle: annuncio != null
              ? Text(
                  DateFormat("dd MMMM HH:MM").format(annuncio!.jobPosted),
                )
              : Container(
                  height: 10,
                  color: Colors.grey,
                ),
          leading: Container(
            width: 45,
            height: 45,
            child: Center(
              child: annuncio != null
                  ? Text(
                      annuncio!.emoji,
                      style: TextStyle(fontSize: 30),
                    )
                  : Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey,
                    ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 70,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: annuncio != null
                      ? AutoSizeText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          annuncio!.seniority!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        )
                      : Container(
                          height: 10,
                          width: 50,
                          color: Colors.grey,
                        ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: annuncio != null
                      ? AutoSizeText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          annuncio!.contratto!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        )
                      : Container(
                          height: 10,
                          width: 50,
                          color: Colors.grey,
                        ),
                ),
              ),
            ],
          ),
        ),
      );
}
