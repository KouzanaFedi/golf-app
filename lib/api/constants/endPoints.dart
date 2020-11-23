const String BASE_URL = "https://club-house-api.herokuapp.com/api";
const String IMAGE_BASE_URL =
    "https://club-house-api.herokuapp.com/uploads/users/";
//USER
const String REGISTER_URL = BASE_URL + "/register";
const String LOGIN_URL = BASE_URL + "/login";
const String GETUSER_URL = BASE_URL + "/user";
const String GET_USER_DEPART = BASE_URL + "/show";
const String LOGOUT_URL = BASE_URL + "/logout";
const String UPDATE_IMAGE = BASE_URL + "/updateImage";
const String UPDATE_INFO = BASE_URL + "/update";

//clubs
const String AVAILABLE_CLUBS_URL = BASE_URL + "/baton/index";
const String CONTENU_SAC = BASE_URL + "/sac/voir_sac";
const String UPDATE_SAC = BASE_URL + "/sac/modifier_sac";

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
const String CHECK_RESERVATION = BASE_URL + "/location/check_reservation";
const String DELETE_RESERVATION =
    BASE_URL + "/reservation/supprimer_la_reservation";

// partie
const String START_PARTIE = BASE_URL + "/parties/lancer_partie";
const String VOIR_PARTIE = BASE_URL + "/parties/voir_parties";
const String VOIR_JOUEURS = BASE_URL + "/parties/voir_joueurs";
const String GENERAL_SCORE = BASE_URL + "/scores/voir_score_apres_match";
const String PLAY_HOLE = BASE_URL + "/scores/jouer_trou";
const String PLAY_SHOT = BASE_URL + "/scores/jouer_coup";
const String UPDATE_SHOT = BASE_URL + "/scores/update_coup";
const String HOLE_SCORE = BASE_URL + "/scores/voir_score_apres_trou";
const String COMPUTE_PARTIE_STATS =
    BASE_URL + "/statistiques/calculer_statistiques";
const String GENERAL_STATS =
    BASE_URL + "/statistiques/afficher_statistiques_generales";
const String GAMES_STATS =
    BASE_URL + "/statistiques/afficher_statistiques_par_match";
const String CLUBS_STAT = BASE_URL + "/statistiques/voir_most_played_club";
// maps
const String MAPS_URL = BASE_URL + "/parties/index_trous";

//news
const String NEWS_URL = BASE_URL + "/actualite/index";

//methods
const String METHODS_LIST = BASE_URL + "/methodes/index";

//news image
const String NEWS_IMAGE =
    "http://club-house-api.herokuapp.com/uploads/actualite/";

const String WEATHER =
    "http://api.weatherapi.com/v1/current.json?key=f30a3398d6934305b4394836201610&q=Tunis";
