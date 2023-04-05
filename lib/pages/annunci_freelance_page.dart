import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AnnunciFreelancePage extends StatelessWidget {
  final String content;

  const AnnunciFreelancePage(this.content, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(content),
        ),
      );
}
