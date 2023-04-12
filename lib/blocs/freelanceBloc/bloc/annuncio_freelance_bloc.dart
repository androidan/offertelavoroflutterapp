import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_freelance_repository.dart';

part 'annuncio_freelance_event.dart';
part 'annuncio_freelance_state.dart';

class AnnuncioFreelanceBloc
    extends Bloc<AnnuncioFreelanceEvent, AnnuncioFreelanceState> {
  final AnnuncioFreelanceRepository annuncioFreelanceRepository;

  AnnuncioFreelanceBloc({required this.annuncioFreelanceRepository})
      : super(FetchingAnnuncioFreelanceState()) {
    on<FetchAnnuncioFreelanceEvent>((event, emit) async {
      emit(FetchingAnnuncioFreelanceState());

      try {
        final annunciFreelance =
            await AnnuncioFreelanceRepository.annunciFreelance();
        emit(annunciFreelance.isEmpty
            ? NoAnnuncioFreelanceState()
            : FetchedAnnuncioFreelanceState(annunciFreelance));
      } catch (e) {
        emit(ErrorAnnuncioFreelanceState());
      }
    });
  }
  void fetchAnnunciFreelance() => add(FetchAnnuncioFreelanceEvent());
}

