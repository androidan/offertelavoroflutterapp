import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/mocks.dart';
import 'package:offerte_lavoro_flutter_app/widgets/app_bar_custom.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_app_bar.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_widget.dart';

@RoutePage()
class AnnunciDipPage extends StatelessWidget {
  const AnnunciDipPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const JobAppBar(
          child: AppBarCustom('Offerte lavoro per assunzioni'),
        ),
        body: _body(context),
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
              child: ListView.separated(
                itemBuilder: (content, index) => const JobWidget(),
                itemCount: 10,
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
}
