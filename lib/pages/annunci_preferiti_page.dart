import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:offerte_lavoro_flutter_app/blocs/bloc/annuncio_bloc.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';
import 'package:offerte_lavoro_flutter_app/widgets/app_bar_custom.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_app_bar.dart';

@RoutePage()
class AnnunciPreferitiPage extends StatefulWidget {
  const AnnunciPreferitiPage({super.key});

  @override
  State<AnnunciPreferitiPage> createState() => _AnnunciPreferitiPageState();
}

class _AnnunciPreferitiPageState extends State<AnnunciPreferitiPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocListener<AnnuncioBloc, AnnuncioState>(
      listener: (context, state) {
        final annunci = (state as FetchedAnnuncioState).annunci;
        final annunciInWishList =
            annunci.where((it) => it.inFavoritePage).toList();
      },
      child: Scaffold(
        appBar: const JobAppBar(
          child: AppBarCustom('Offerte lavoro salvate'),
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) =>
      BlocBuilder<AnnuncioBloc, AnnuncioState>(
        builder: (context, state) {
          final annunci = (state as FetchedAnnuncioState).annunci;
          final annunciInWishList =
              annunci.where((it) => it.inFavoritePage).toList();

          if (annunciInWishList.isEmpty) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => setState(() {}));
            return Center(
              child: Text(
                "Nessun annuncio tra i preferiti",
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => setState(() {}));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Offerte salvate',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  height: SizeConfig.blockSizeVertical * 60,
                  child: ListView.separated(
                    itemBuilder: (content, index) => ListTile(
                      title: Text(
                        annunciInWishList[index].titolo,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: AutoSizeText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Data pubblicazione: " +
                            DateFormat("dd MMMM HH:MM")
                                .format(annunciInWishList[index].jobPosted),
                      ),
                      leading: Container(
                        width: 45,
                        height: 45,
                        child: Center(
                            child: Text(
                          annunciInWishList[index].emoji,
                          style: TextStyle(fontSize: 30),
                        )),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<AnnuncioBloc>(context).add(
                              AnnuncioFavoriteEventToggle(
                                  annunciInWishList[index]));
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.remove_circle_outline,
                        ),
                      ),
                    ),
                    itemCount: annunciInWishList.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 8,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
