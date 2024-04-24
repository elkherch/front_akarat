import 'package:hive/hive.dart';
import 'bien.dart';

// Générez l'adaptateur pour votre modèle Biens_immobiliers
class Biens_immobiliersAdapter extends TypeAdapter<Biens_immobilieHive> {
  @override
  final typeId = 0; // Identifiant unique pour ce modèle

  @override
  Biens_immobilieHive read(BinaryReader reader) {
    // Lisez les données du fichier Hive et renvoyez une instance de Biens_immobilieHive
    var bienID = reader.read();
    var type_de_bien = reader.read();
    var prix = reader.read();
    var surface = reader.read();
    var nombre_de_salles_de_bains = reader.read();
    var nombre_de_salles_de_sals = reader.read();
    var images = reader.read();
    var description = reader.read();
    var emplacement = reader.read();
    var region = reader.read();
    var adresse = reader.read();
    var categorie = reader.read();
    var id_user = reader.read();
    var coordonnees_geographique = reader.read();
    var date_publication = reader.read();
    var numero = reader.read();

    return Biens_immobilieHive(
      bienID: bienID,
      type_de_bien: type_de_bien,
      prix: prix,
      surface: surface,
      nombre_de_salles_de_bains: nombre_de_salles_de_bains,
      nombre_de_salles_de_sals: nombre_de_salles_de_sals,
      images: images,
      description: description,
      emplacement: emplacement,
      region: region,
      adresse: adresse,
      categorie: categorie,
      id_user: id_user,
      coordonnees_geographique: coordonnees_geographique,
      date_publication: date_publication,
      numero: numero,

      
    );
  }

  @override
  void write(BinaryWriter writer, Biens_immobilieHive obj) {
    writer.write(obj.bienID);
    writer.write(obj.type_de_bien);
    writer.write(obj.prix);
    writer.write(obj.surface);
    writer.write(obj.nombre_de_salles_de_bains);
    writer.write(obj.nombre_de_salles_de_sals);
    writer.write(obj.images);
    writer.write(obj.description);
    writer.write(obj.emplacement);
    writer.write(obj.region);
    writer.write(obj.adresse);
    writer.write(obj.categorie);
    writer.write(obj.id_user);
    writer.write(obj.coordonnees_geographique);
    writer.write(obj.date_publication);
    writer.write(obj.numero);
 }
}
