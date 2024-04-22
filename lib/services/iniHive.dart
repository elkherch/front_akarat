import 'package:akarat/bien.dart';
import 'package:akarat/bien.g.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> initHive() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(Biens_immobiliersAdapter());
  await Hive.openBox<Biens_immobilieHive>('biens_immobiliers_box');
}
