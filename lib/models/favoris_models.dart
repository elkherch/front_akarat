// ignore_for_file: camel_case_types, non_constant_identifier_names

class Favorie {
  final int? FavoriID; // Modifier ici
  final String? ProfileID;
  final String? BienID;
  Favorie( {
    required this.FavoriID,
    required this.ProfileID,
    required this.BienID,
  });

 factory Favorie.fromJson(Map<String, dynamic> json) {
  return Favorie(
    FavoriID: json['FavoriID'], // Modifier ici
    ProfileID: json['ProfileID'],
    BienID: json['BienID'],
  );
  }
  Map<String, dynamic> toJson() {
    return {
      'FavoriID': FavoriID, 
      'ProfileID': ProfileID,
      'BienID': BienID,
    };
  }
}
