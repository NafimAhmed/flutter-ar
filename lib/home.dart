



import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class Home extends StatefulWidget{






  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  ArCoreController? augmentedRealityCoreController;

  augmentedRealityCreated(ArCoreController coreController){

    augmentedRealityCoreController=coreController;

    displayEarthMapSphere();
  }


  displayEarthMapSphere() async {


    final ByteData earthTextureBytes = await rootBundle.load('images/earth_map.jpg');

    final materials=ArCoreMaterial(
      color: Colors.blue,
      textureBytes: earthTextureBytes.buffer.asUint8List(),
    );

    final sphere=ArCoreSphere(materials: [materials]);


    final node=ArCoreNode(
      shape: sphere,
      position: vector64.Vector3(0,0,-1.5)
    );
    
    
    augmentedRealityCoreController!.addArCoreNode(node);


  }






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: augmentedRealityCreated,

      )
    );
  }
}