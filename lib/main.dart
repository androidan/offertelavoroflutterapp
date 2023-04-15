import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:offerte_lavoro_flutter_app/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:offerte_lavoro_flutter_app/blocs/bloc/annuncio_bloc.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_repositories.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  Intl.defaultLocale = "it_IT";
  await initializeDateFormatting("it_IT", null);
  runApp(
    // MultiBlocProvider(
    // providers: [
    // BlocProvider(
    // create: (_) =>
    // AnnuncioBloc(annuncioRepository: AnnuncioRepository()))
    //],
    //child:
    App(),
    // ),
  );
}
