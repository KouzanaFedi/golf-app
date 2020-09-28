import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = "http://${DotEnv().env['MACHINE_IP_ADDRESS']}:8000/api";

String registerUrl = baseUrl + "/register";
String logInUrl = baseUrl + "/login";
String getUserFromUrl = baseUrl + "/user";
String logOutUrl = baseUrl + "/logout";
