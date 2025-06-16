import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static const String baseUrl = 'http://localhost:5000';
  static String? token;

  static Future<void> register({
    required String userName,
    required String email,
    required String password,
    String role = 'User',
  }) async {
    final url = Uri.parse('$baseUrl/api/Identity/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userName': userName,
        'email': email,
        'password': password,
        'role': role,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to register');
    }
  }

  static Future<void> login({
    required String userName,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/Identity/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userName': userName, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      token = data['token'] ?? data['accessToken'];
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<List<Service>> searchServices(String query) async {
    final url = Uri.parse('$baseUrl/api/Search/getservices?search=$query');
    final response = await http.get(
      url,
      headers: {if (token != null) 'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch services');
    }
  }
}

class Service {
  final String id;
  final String? name;
  final String? description;
  final double? price;
  final String? category;
  final String? filename;

  Service({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.category,
    this.filename,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id']?.toString() ?? '',
      name: json['name'],
      description: json['description'],
      price: json['price'] == null ? null : (json['price'] as num).toDouble(),
      category: json['category'],
      filename: json['filename'],
    );
  }
}
