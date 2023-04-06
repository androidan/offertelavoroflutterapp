import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/widgets/app_bar_custom.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_app_bar.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_freelance_slinding_panel_overview.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_widget_freelance.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class AnnunciFreelancePage extends StatelessWidget {
  final slidingUpPanelController = PanelController();

  void onJobWidgetFreelancePressed() {
    if (slidingUpPanelController.isAttached) {
      slidingUpPanelController.open();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const JobAppBar(
        child: AppBarCustom('Offerte lavoro per Freelance'),
      ),
      body: SlidingUpPanel(
        color: Theme.of(context).colorScheme.onSecondary,
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
        panel: JobFreelanceSlidingPanelOverview(),
        body: _body(
          context,
        ),
      ));

  Widget _body(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Offerte attive',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 640,
              child: ListView.separated(
                itemBuilder: (content, index) => JobWidgetFreelance(
                  onPressed: onJobWidgetFreelancePressed,
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
