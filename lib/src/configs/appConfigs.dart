import 'package:dio/dio.dart';

import 'package:intl/intl.dart';

final baseUrl = 'https://needboxbd.xyz/api/v1/';
final imageBaseUrl = 'https://needboxbd.xyz/';

//for multi use
final dio = Dio();

 //date time format global use

final dateFormat = DateFormat('MMMMd');
final timeFormat = DateFormat().add_jm();
