import 'package:http/http.dart' as http;
import 'dart:convert';

class GeoCodingService {
  static Future<Map<String?, double>?> getCoordinatesFromCityName(String cityName) async {
    final response = await http.get(Uri.parse('https://nominatim.openstreetmap.org/search?q=$cityName&format=json&limit=1'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.isNotEmpty) {
        final latitude = double.parse(json[0]['lat']);
        final longitude = double.parse(json[0]['lon']);
        return {'latitude': latitude, 'longitude': longitude};
      }
    }
    return null;
  }
}
