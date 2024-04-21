import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {

  Future<dynamic> fetchData(String endpoint,String baseUrl) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<dynamic> postData(String endpoint, dynamic data, String baseUrl) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print('Error posting data: $e');
      return null;
    }
  }

  Future<dynamic> deleteData(String endpoint,String baseUrl) async {
    try {
      final response = await http.delete(Uri.parse(baseUrl + endpoint));
      if (response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      print('Error deleting data: $e');
      return null;
    }
  }

  Future<dynamic> putData(String endpoint, dynamic data,String baseUrl) async {
    try {
      final response = await http.put(
        Uri.parse(baseUrl + endpoint),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to put data');
      }
    } catch (e) {
      print('Error putting data: $e');
      return null;
    }
  }
}
