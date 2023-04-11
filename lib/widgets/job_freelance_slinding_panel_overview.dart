import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';
import 'package:offerte_lavoro_flutter_app/widgets/sliding_button.dart';

class JobFreelanceSlidingPanelOverview extends StatelessWidget {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          jobHeader(),
          jobDescription(),
          buttomSaveJob(),
        ],
      ),
    );
  }

  Widget jobHeader() => Padding(
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
            const Text(
              "Esempio | Sviluppo app mobile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );

  Widget _jobAction() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ),
        ],
      );

  Widget jobDescription() => Padding(
        padding: EdgeInsets.all(32.0),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 42,
          child: Scrollbar(
            thumbVisibility: true,
            controller: _firstController,
            child: ListView(
              controller: _firstController,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Descrizione del progetto",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "Questa non è una vera proposta di lavoro. È un annuncio di esempio per mostrare i dati richiesti dal nostro sistema per pubblicare un’offerta di lavoro per freelance Flutter.\n\nIn questa sezione viene descritto il progetto proposto.",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Richiesta di lavoro",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "In questa sezione viene descritto il tipo di lavoro che si aspetta dal freelance chi commissiona il lavoro (chiediamo esplicitamente più dettagli possibili, ad esempio",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Tipo di relazione",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "In questa sezione viene descritto il tipo di lavoro che si aspetta dal freelance chi commissiona il lavoro (chiediamo esplicitamente più dettagli possibili, ad esempio",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Tempistiche",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "Indica quanto tempo ha a disposizione il freelance per il completamento della commessa e se c’è del carico di lavoro aspettato (es. sono richieste 20 ore a settimana perché lavora con altri).",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Budget",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "Indica il compenso offerto per questo lavoro, specificando l'unità di misura (es. €70/ora oppure €7.500,00 a progetto completato).",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Tempistiche di pagamento",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "Indica le modalità e le tempistiche del pagamento.",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "NDA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "No",
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
