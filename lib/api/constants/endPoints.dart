// import 'package:flutter_dotenv/flutter_dotenv.dart';

// String ip = DotEnv().env['MACHINE_IP_ADDRESS'] + ":8000";
const String BASE_URL = "https://club-house-api.herokuapp.com/api";

//USER
const String REGISTER_URL = BASE_URL + "/register";
const String LOGIN_URL = BASE_URL + "/login";
const String GETUSER_URL = BASE_URL + "/user";
const String LOGOUT_URL = BASE_URL + "/logout";

//BATTON
const String AVAILABLE_CLUBS_URL = BASE_URL + "/baton/index";

//sac
const String CONTENU_SAC = BASE_URL + "/sac/voir_sac";

//contact us
const String CONTACT_US_URL = BASE_URL + "/message/store";

//reservation
const String AVAILABLE_MATCHES = BASE_URL + "/matches/index";
const String CREATE_RESERVATION =
    BASE_URL + "/reservation/creer_une_reservation";
const String AVAILABLE_LOCATIONS = BASE_URL + "/location/index";
const String ADD_LOCATION_TO_RESERVATION =
    BASE_URL + "/location/ajouter_location_au_panier";
const String DELETE_LOCATION_FROM_RESERVATION =
    BASE_URL + "/location/supprimer_location_du_panier";
