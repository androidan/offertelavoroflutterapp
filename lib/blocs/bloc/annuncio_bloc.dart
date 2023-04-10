import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_repositories.dart';

part 'annuncio_event.dart';
part 'annuncio_state.dart';

class AnnuncioBloc extends Bloc<AnnuncioEvent, AnnuncioState> {
  final AnnuncioRepository annuncioRepository;

  AnnuncioBloc({required this.annuncioRepository})
      : super(FetchingAnnuncioState()) {
    on<FetchAnnuncioEvent>((event, emit) async {
      emit(FetchingAnnuncioState());

      try {
        final annunci = await AnnuncioRepository.annunci();

        emit(annunci.isEmpty
            ? NoAnnuncioState()
            : FetchedAnnuncioState(annunci));
      } catch (e) {
        emit(ErrorAnnuncioState());
      }
    });
  }

  void fetchAnnunci() => add(FetchAnnuncioEvent());
}

