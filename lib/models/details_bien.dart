// ignore_for_file: camel_case_types, non_constant_identifier_names

class Details_immobiliers {
  final int? bienID; // Modifier ici
  final String? type_de_bien;
  final String? prix;
  final String? surface;
  final int? nombre_de_salles_de_bains;
  final int? nombre_de_salles_de_sals;
  List<dynamic>? images;
  final String? description;
  final String? email;
  final int? id_user;
  final String? username;
  final String? first_name;
  final String? emplacement;
  final String? region;
  final String? adresse;
  final String? categorie;
  final String? numero;



  Details_immobiliers( {
    required this.id_user,
    required this.bienID, 
    required this.type_de_bien,
    required this.prix,
    required this.surface,
    required this.nombre_de_salles_de_bains,
    required this.nombre_de_salles_de_sals,
    required this.images,
    required this.description,
    required this.email,
    required this.username,
    required this.first_name,
    required this.numero,


 required this.emplacement, 
    required this.region, 
    required this.adresse, 
    required this.categorie, 

  });

 factory Details_immobiliers.fromJson(Map<String, dynamic> json) {
  return Details_immobiliers(
    bienID: json['bienID'], // Modifier ici
    type_de_bien: json['type_de_bien'],
    prix: json['prix'],
    surface: json['surface'],
    nombre_de_salles_de_bains: json['nombre_de_salles_de_bains'],
    nombre_de_salles_de_sals: json['nombre_de_salles_de_sals'],
    images: json['images'],
    description: json['description'], 
    id_user: json['id_user'], // Supprimez le double point ici
    email: json['email'],
    username:json['username'],
    first_name: json['first_name'],
    emplacement: json['emplacement'],
    region: json['region'],
    categorie: json['categorie'],
    adresse: json['adresse'],
    numero: json['numero'],
  );
}

  Map<String, dynamic> toJson() {
    return {
      'bienID': bienID, 
      'type_de_bien': type_de_bien,
      'prix': prix,
      'surface': surface,
      'nombre_de_salles_de_bains': nombre_de_salles_de_bains,
      'nombre_de_salles_de_sals':nombre_de_salles_de_sals,
      'images':images,
      'description':description,
      'id_user':id_user,
      'username':username,
      'first_name':first_name,
      'email':email,
        'categorie':categorie,
      'emplacement':emplacement,
      'region':region,
      'adresse':adresse,
      'numero':numero,

    };
  }
}
