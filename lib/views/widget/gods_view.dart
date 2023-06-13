import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

class GodsViewDart extends StatefulWidget {
  const GodsViewDart({super.key});

  @override
  _GodsViewDartState createState() => _GodsViewDartState();
}

class _GodsViewDartState extends State<GodsViewDart> {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );

  late MapmyIndiaMapController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MapmyIndiaMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: (map) => {
          controller = map,
        },
        onStyleLoadedCallback: () => {addMarker()},
      ),
    );
  }

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImage(name, list);
  }

  void addMarker() async {
    await addImageFromAsset("icon", "assets/symbols/custom-icon.png");
    controller.addSymbol(SymbolOptions(
        geometry: LatLng(25.321684, 82.987289), iconImage: "icon"));
  }
}
