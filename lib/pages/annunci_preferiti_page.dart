import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/widgets/app_bar_custom.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_app_bar.dart';

@RoutePage()
class AnnunciPreferitiPage extends StatelessWidget {
  const AnnunciPreferitiPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const JobAppBar(
        child: AppBarCustom('Offerte lavoro salvate'),
      ),
      body: _body(
        context,
      ));

  Widget _body(BuildContext context) => Padding(
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
              height: 640,
              child: ListView.separated(
                itemBuilder: (content, index) => ListTile(
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
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_circle_outline,
                      //color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                itemCount: 3,
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
