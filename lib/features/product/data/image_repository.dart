import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ImageRepository {
  final String _apiKey = 'a57d7be0814a82db9ad88eb43c87191c';
  final String _apiUrl = 'https://api.imgbb.com/1/upload';

  Future<String?> uploadImage(File imageFile) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(_apiUrl))
        ..fields['key'] = _apiKey
        ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final decodedData = jsonDecode(responseData);
        return decodedData['data']['url'];
      } else {
        // Handle error
        print('Failed to upload image: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
