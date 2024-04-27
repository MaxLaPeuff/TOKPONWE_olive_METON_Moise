class Candidate {
  final String name;
  final String description;
  final String party;
  final String imageUrl;
  String? dateOfBirth; // Nouveau champ pour la date de naissance

  Candidate({
    required this.name,
    required this.description,
    required this.party,
    required this.imageUrl,
    this.dateOfBirth,
  });
}
