class Preferiti {
  final String emoji;
  final String titolo;
  final DateTime jobPosted;
  bool inFavoritePage;

  Preferiti({
    required this.emoji,
    required this.titolo,
    required this.jobPosted,
    this.inFavoritePage = false,
  });

}
