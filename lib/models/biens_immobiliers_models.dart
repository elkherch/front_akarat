// ignore_for_file: camel_case_types, non_constant_identifier_names
class Biens_immobiliers {
  final int? bienID; // Modifier ici
  final String? type_de_bien;
  final String? prix;
  final String? surface;
  final int? nombre_de_salles_de_bains;
  final int? nombre_de_salles_de_sals;
  List<dynamic>? images;
  final String? description;
  final String? emplacement;
  final String? region;
  final String? adresse;
  final String? categorie;

  final int? id_user;
  final int? coordonnees_geographique;
  final String? date_publication;
  Biens_immobiliers( {
    required this.id_user,
    required this.emplacement, 
    required this.region, 
    required this.adresse, 
    required this.categorie, 

    required this.coordonnees_geographique,
    required this.date_publication,
    required this.bienID, 
    required this.type_de_bien,
    required this.prix,
    required this.surface,
    required this.nombre_de_salles_de_bains,
    required this.nombre_de_salles_de_sals,
    required this.images,
    required this.description,
  });

 factory Biens_immobiliers.fromJson(Map<String, dynamic> json) {
  return Biens_immobiliers(
    bienID: json['bienID'], // Modifier ici
    type_de_bien: json['type_de_bien'],
    prix: json['prix'],
    surface: json['surface'],
    nombre_de_salles_de_bains: json['nombre_de_salles_de_bains'],
    nombre_de_salles_de_sals: json['nombre_de_salles_de_sals'],
    images: json['images'],
    description: json['description'], 
    id_user: json['id_user'], // Supprimez le double point ici
    emplacement: json['emplacement'],
    region: json['region'],
    categorie: json['categorie'],
    adresse: json['adresse'],
    coordonnees_geographique: json['coordonnees_geographique'], 
    date_publication: json['date_publication'],
  );
}
  Map<String, dynamic> toJson() {
    return {
      'bienID': bienID, 
      'type_de_bien': type_de_bien,
      'prix': prix,
      'nombre_de_salles_de_bains': nombre_de_salles_de_bains,
      'nombre_de_salles_de_sals':nombre_de_salles_de_sals,
      'images':images,
      'description':description,
      'id_user':id_user,
      'categorie':categorie,
      'emplacement':emplacement,
      'region':region,
      'adresse':adresse,

      'coordonnees_geographique':coordonnees_geographique,
      'date_publication':date_publication
    };
  }
}
