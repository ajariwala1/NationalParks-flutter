import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/park_model.dart';

class ParkService {
  static const String baseUrl = 'https://developer.nps.gov/api/v1/parks';
  static const String apiKey = ''; // ADD YOUR NPS API KEY HERE

  Future<List<ParkModel>> fetchParksByState(String stateCode) async {
    final url = Uri.parse('$baseUrl?stateCode=$stateCode&api_key=$apiKey');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      final parkResponse = ParkResponse.fromJson(jsonData);

      return parkResponse.data
              .where((park) => park.designation == 'National Park')
              .toList();
    } else {
      throw Exception('Failed to load parks');
    }
  }
}