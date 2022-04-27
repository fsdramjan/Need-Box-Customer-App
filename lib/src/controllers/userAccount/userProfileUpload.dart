import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
 

class UserProfileUpload {
  
 
  Future<Response> sendForm(
      String url, Map<String, dynamic> data, Map<String, File> files) async {
    Map<String, MultipartFile> fileMap = {};
    for (MapEntry fileEntry in files.entries) {
      File file = fileEntry.value;
      String fileName = basename(file.path);
      fileMap[fileEntry.key] = MultipartFile(
          file.openRead(), await file.length(),
          filename: fileName);
    }
    data.addAll(fileMap);
    var formData = FormData.fromMap(data);
    Dio dio = new Dio();
    final sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('accessToken');
    return await dio.post(url,
        data: formData,
        options: Options(
            headers: {'Authorization': 'Bearer $token'},
            contentType: 'multipart/form-data'));
  }

}