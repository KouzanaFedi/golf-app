import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:golf_app/components/menuOptions/map/holeMarker.dart';
import 'package:golf_app/models/interfaces/hole.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  MapController _ctrlr = MapController();
  List<Hole> holes = [];
  List<Marker> holeMarkers = [];
  int currentHole = 0;
  final LatLng boundTR = LatLng(37.011874, 10.206642),
      boundBL = LatLng(36.972455, 10.160294);

  bool gameStarted = false;

  @override
  void initState() {
    super.initState();
    loadHoles().then((value) {
      setState(() {
        holes = value;
        initHoleMarkers();
      });
    });
  }

  Future<List<Hole>> loadHoles() async {
    List<Hole> list = [];
    String _fileContent = await rootBundle.loadString("assets/holes.json");
    List json = jsonDecode(_fileContent);
    json.forEach((element) {
      list.add(Hole.fromJSON(element));
    });
    return list;
  }

  void initHoleMarkers() {
    List<Marker> list = [];
    holes.forEach((element) {
      Marker marker = Marker(
          width: 25,
          height: 50,
          point: LatLng(element.latitude, element.longitude),
          builder: (ctx) =>
              HoleMarker(order: element.order, currentHole: currentHole));
      list.add(marker);
    });
    setState(() {
      holeMarkers = list;
    });
  }

  void centerCurrentHole(int i, MapController ctrlr) {
    if (i - 1 >= 0) {
      Hole current = holes[i - 1];
      ctrlr.move(LatLng(current.latitude, current.longitude), 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final String accesToken =
        'pk.eyJ1IjoiZmVkaWtvdXphbmEiLCJhIjoiY2tlZTF2cHY2MGNiYzJ0bnRmdGg0cXJtNyJ9.WF5qL_GtMGzaV2smEVyOeA';
    return FlutterMap(
      mapController: _ctrlr,
      options: MapOptions(
        plugins: [
          MarkerClusterPlugin(),
        ],
        center: LatLng(36.990253, 10.173191),
        zoom: 15,
        minZoom: 14,
        maxZoom: 16,
        screenSize: screenSize,
        nePanBoundary: boundTR,
        swPanBoundary: boundBL,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/fedikouzana/ckee217td0hr219p8dnpsx8nx/tiles/256/{z}/{x}/{y}@2x?access_token=$accesToken",
          additionalOptions: {
            'accesToken': accesToken,
            'id': 'mapbox.mapbox-streets-v8'
          },
        ),
        OverlayImageLayerOptions(
          overlayImages: [
            OverlayImage(
              imageProvider: AssetImage("assets/TunisBayGolf.png"),
              bounds: LatLngBounds(
                LatLng(37.006079, 10.162561),
                LatLng(36.979981, 10.211115), //36.982658, 10.214165
              ),
              opacity: 1,
            ),
          ],
        ),
        MarkerClusterLayerOptions(
          disableClusteringAtZoom: 14,
          markers: holeMarkers,
          centerMarkerOnClick: true,
          showPolygon: false,
          builder: (context, markers) {
            return Container();
          },
        )
      ],
    );
  }
}
