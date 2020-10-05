import 'package:flutter_dotenv/flutter_dotenv.dart';

String ip = DotEnv().env['MACHINE_IP_ADDRESS'] + ":8000";
String baseUrl = "https://club-house-api.herokuapp.com/api";

String registerUrl = baseUrl + "/register";
String logInUrl = baseUrl + "/login";
String getUserFromUrl = baseUrl + "/user";
String logOutUrl = baseUrl + "/logout";
