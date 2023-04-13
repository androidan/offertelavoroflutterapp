import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';
import 'package:offerte_lavoro_flutter_app/util/share/share.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';
import 'package:offerte_lavoro_flutter_app/util/trasform_to_url.dart';
import 'package:offerte_lavoro_flutter_app/widgets/sliding_button.dart';
import 'package:url_launcher/url_launcher.dart';

class JobSlidingPanelOverview extends StatelessWidget {
  final ScrollController _firstController = ScrollController();
  final AnnuncioModel annuncioModel;

  var logger = Logger();

  Future<void> _launchUrl() async {
    if (!await launchUrl(
        TrasformToUrl.transformToUrl(annuncioModel.comeCandidarsi))) {
      throw Exception('Could not launch ');
    }
  }

  JobSlidingPanelOverview({required this.annuncioModel});

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
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            _jobAction(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                annuncioModel.titolo,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            _jobLabel(context),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            _jobFactoryAndRal(),
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
                  DateFormat("dd MMMM HH:MM").format(annuncioModel.jobPosted),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () => ShareClass.share(annuncioModel.url!),
              icon: Icon(Icons.share),
            ),
          ),
        ],
      );

  Widget _jobLabel(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                annuncioModel.seniority ?? " - ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeVertical * 1,
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                annuncioModel.contratto ?? " - ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeVertical * 1,
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.yellow.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                annuncioModel.team ?? " - ",
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
                  annuncioModel.nomeAzienda,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 28,
            ),
            Icon(Icons.euro),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: AutoSizeText(
                  annuncioModel.retribuzione ?? ' - ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );

  Widget jobDescription() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 36,
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
                    annuncioModel.descrizioneOfferta,
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
