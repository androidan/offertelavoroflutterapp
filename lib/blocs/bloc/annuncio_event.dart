part of 'annuncio_bloc.dart';

abstract class AnnuncioEvent extends Equatable {
  const AnnuncioEvent();

  @override
  List<Object> get props => [];
}

class FetchAnnuncioEvent extends AnnuncioEvent {}

class AnnuncioFavoriteEventToggle extends AnnuncioEvent {
  final AnnuncioModel annuncioModel;
  AnnuncioFavoriteEventToggle(this.annuncioModel);
}
