import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/widgets/sliding_button.dart';

class JobSlidingPanelOverview extends StatelessWidget {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          jobHeader(context),
          jobDescription(),
          buttomSaveJob(),
        ],
      ),
    );
  }

  Widget jobHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            _jobAction(),
            Text(
              "Sviluppatore Junior Mobile e Webapp",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            _jobLabel(context),
            const SizedBox(
              height: 16,
            ),
            _jobFactoryAndRal(),
          ],
        ),
      );

  Widget _jobAction() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
          ),
        ],
      );

  Widget _jobLabel(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                'Junior',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 70,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                'Full time',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 70,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.yellow.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                'Ibrido',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _jobFactoryAndRal() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.factory_rounded),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: AutoSizeText(
                  "Azienda: Neting",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                width: 100,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Icon(Icons.euro),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: 150,
                child: AutoSizeText(
                  "20-25k da valutare a seconda dell'esperienza",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );

  Widget jobDescription() => Padding(
        padding: const EdgeInsets.all(32.0),
        child: SizedBox(
          height: 400,
          child: Scrollbar(
            thumbVisibility: true,
            controller: _firstController,
            child: ListView(
              controller: _firstController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Descrizione offerta",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    "S.E.C. - System Engineering Consulting, azienda di consulenza con ventennale esperienza nello sviluppo di APP, ricerca Mobile Developer da inserire nel proprio organico.\n\nRequisiti essenziali:\n•\tConoscenza di Swift \n•\tConoscenza di Flutter\n\nRequisiti preferenziali:\n•\tEsperienza con Swift e Flutter \n•\tEsperienza nella costruzione e distribuzione di app mobile per iOS e Android \n•\tComprensione della programmazione orientata a oggetti e pattern di progettazione\n•\tEsperienza con Git e controllo versione \n•\tAbilità di debug e risoluzione dei problemi \n•\tAbilità comunicative e capacità di lavorare in un ambiente di squadra\n\nIl candidato ideale è motivato e determinato e ha dimestichezza con lo sviluppo mobile ed i relativi strumenti, è curioso verso le nuove tecnologie ed ama mettersi in gioco con linguaggi e piattaforme diversificate. \n\nTi offriamo: \n•\tContratto indeterminato, previo periodo di prova\n•\tSmarworking due giorni alla settimana\n•\tSede di lavoro a Milano, a 20 metri dalla fermata Gambara\n•\tFormazione e affiancamento costante con i nostri consulenti senior\n•\tRetribuzione da definire in base all'esperienza\n•\tConcrete possibilità di crescita professionale\n",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buttomSaveJob() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SlidingButton(text: 'CANDIDATI', onPressed: () {}));
}
