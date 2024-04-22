import 'package:hive/hive.dart';


@HiveType(typeId: 0) // Définir le typeId pour le modèle Biens_immobiliers
class Biens_immobilieHive extends HiveObject{
  @HiveField(0)
  int? bienID;

  @HiveField(1)
  String? type_de_bien;

  @HiveField(2)
  String? prix;

  @HiveField(3)
  String? surface;

  @HiveField(4)
  int? nombre_de_salles_de_bains;

  @HiveField(5)
  int? nombre_de_salles_de_sals;

  @HiveField(6)
  List<dynamic>? images;

  @HiveField(7)
  String? description;

  @HiveField(8)
  String? emplacement;

  @HiveField(9)
  String? region;

  @HiveField(10)
  String? adresse;

  @HiveField(11)
  String? categorie;

  @HiveField(12)
  int? id_user;

  @HiveField(13)
  int? coordonnees_geographique;

  @HiveField(14)
  String? date_publication;

  Biens_immobilieHive({
    this.bienID,
    this.type_de_bien,
    this.prix,
    this.surface,
    this.nombre_de_salles_de_bains,
    this.nombre_de_salles_de_sals,
    this.images,
    this.description,
    this.emplacement,
    this.region,
    this.adresse,
    this.categorie,
    this.id_user,
    this.coordonnees_geographique,
    this.date_publication,
  });
}

