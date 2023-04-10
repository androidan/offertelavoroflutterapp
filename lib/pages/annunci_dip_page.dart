import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:offerte_lavoro_flutter_app/blocs/bloc/annuncio_bloc.dart';
import 'package:offerte_lavoro_flutter_app/mocks.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_repositories.dart';
import 'package:offerte_lavoro_flutter_app/widgets/app_bar_custom.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_app_bar.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_sliding_panel_overview.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class AnnunciDipPage extends StatefulWidget {
  @override
  State<AnnunciDipPage> createState() => _AnnunciDipPageState();
}

class _AnnunciDipPageState extends State<AnnunciDipPage> {
  final slidingUpPanelController = PanelController();
  AnnuncioModel? currentAnnuncio;

  void onJobWidgetPressed(AnnuncioModel annuncioModel) {
    setState(() {
      currentAnnuncio = annuncioModel;
    });
    if (slidingUpPanelController.isAttached) {
      slidingUpPanelController.open();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: JobAppBar(
          child: AppBarCustom(
            'Offerte lavoro per assunzioni',
          ),
        ),
        body: SlidingUpPanel(
          color: Theme.of(context).colorScheme.surface,
          controller: slidingUpPanelController,
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
          backdropEnabled: true,
          backdropOpacity: 0.75,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          panel: currentAnnuncio == null ? SizedBox() : JobSlidingPanelOverview( annuncioModel: currentAnnuncio!),
          body: OfflineBuilder(
            connectivityBuilder: (context, connectivity, child) =>
                connectivity == ConnectivityResult.none
                    ? _notConnectedBody(context)
                    : child,
            child: _body(context),
          ),
        ),
      );

  Widget _notConnectedBody(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            color: Colors.grey,
            size: 128,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              'Nessuna connessione a internet',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      );

  Widget _body(BuildContext context) => ListView(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        children: [
          _categories(context),
          _annunciLavoro(context),
        ],
      );

  Widget _categories(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Filtri',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 50,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemBuilder: (_, index) => Mocks.categories[index],
                separatorBuilder: (_, __) => Container(width: 16),
                itemCount: Mocks.categories.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      );

  Widget _annunciLavoro(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Annunci',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 640,
              child: BlocProvider(
                create: (context) => AnnuncioBloc(
                  annuncioRepository: context.read<AnnuncioRepository>(),
                )..fetchAnnunci(),
                child: BlocBuilder<AnnuncioBloc, AnnuncioState>(
                  builder: (context, state) {
                    if (state is FetchedAnnuncioState) {
                      return _annunciWidget(annunci: state.annunci);
                    } else if (state is NoAnnuncioState) {
                      return _noAnnunciWidget();
                    } else if (state is ErrorAnnuncioState) {
                      return _errorAnnunciWidget();
                    } else if (state is FetchingAnnuncioState) {
                      return _fetchingAnnunciWidget();
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Widget _annunciWidget({required List<AnnuncioModel> annunci}) =>
      ListView.separated(
        itemBuilder: (content, index) => JobWidget(
          annunci[index],
          onPressed: () => onJobWidgetPressed(annunci[index]),
        ),
        itemCount: annunci.length,
        separatorBuilder: (context, index) => const Divider(
          height: 8,
          indent: 20,
          endIndent: 20,
          thickness: 1,
        ),
      );

  Widget _noAnnunciWidget() =>
      const Center(child: Text('Nessuna annuncio disponibile'));

  Widget _errorAnnunciWidget() => const Center(
      child: Text('Errore nell\'ottenere l\'elenco degli annunci'));

  Widget _fetchingAnnunciWidget() => Center(
        child: CircularProgressIndicator(),
      );
}
