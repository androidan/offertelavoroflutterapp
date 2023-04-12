import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';
import 'package:offerte_lavoro_flutter_app/util/trasform_to_url.dart';
import 'package:offerte_lavoro_flutter_app/widgets/sliding_button.dart';
import 'package:url_launcher/url_launcher.dart';

class JobFreelanceSlidingPanelOverview extends StatelessWidget {
  final ScrollController _firstController = ScrollController();
  final AnnuncioFreelanceModel annuncioFreelanceModel;

  var logger = Logger();

  Future<void> _launchUrl() async {
    if (!await launchUrl(
        TrasformToUrl.transformToUrl(annuncioFreelanceModel.comeCandidarsi))) {
      throw Exception('Could not launch ');
    }
  }

  JobFreelanceSlidingPanelOverview({required this.annuncioFreelanceModel});

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
            SizedBox(
              width: SizeConfig.blockSizeVertical * 1,
            ),
            _jobAction(),
            Text(
              annuncioFreelanceModel.codice,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              width: SizeConfig.blockSizeVertical * 5,
            ),
          ],
        ),
      );

  Widget _jobAction() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
            child: AutoSizeText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "Data pubblicazione: " +
                  DateFormat("dd MMMM HH:MM")
                      .format(annuncioFreelanceModel.jobPosted),
            ),
          ),
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
          height: SizeConfig.blockSizeVertical * 44,
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
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    annuncioFreelanceModel.descrizioneDelProgetto,
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
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    annuncioFreelanceModel.richiestaDiLavoro,
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
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    annuncioFreelanceModel.tipoDiRelazione ?? " - ",
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
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    annuncioFreelanceModel.tempistiche ?? " - ",
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
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    annuncioFreelanceModel.budget ?? " - ",
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
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    annuncioFreelanceModel.tempisticheDiPagamento ?? " - ",
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
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    annuncioFreelanceModel.nda ?? " - ",
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
      child: SlidingButton(text: 'CANDIDATI', onPressed: () => _launchUrl()));
}
