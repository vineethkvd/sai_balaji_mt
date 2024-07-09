// import 'dart:async';

// import 'package:android_intent/android_intent.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geolocator/geolocator.dart';

// class locationdata {
//   bool servicestatus = false;
//   bool haspermission = false;
//   late LocationPermission permission;
//   late Position position;
//   String long = "", lat = "";
//   late StreamSubscription<Position> positionStream;

//   checkGps() async {
//     servicestatus = await Geolocator.isLocationServiceEnabled();
//     if (servicestatus) {
//       permission = await Geolocator.checkPermission();
//       // while (permission == LocationPermission.denied) {
//       //   permission = await Geolocator.requestPermission();
//       // }
//       // haspermission = true;

//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           print('Location permissions are denied');
//           checkGps();
//         } else if (permission == LocationPermission.deniedForever) {
//           print("'Location permissions are permanently denied");
//         } else {
//           haspermission = true;
//         }
//       } else {
//         haspermission = true;
//       }

//       if (haspermission) {
//         getLocation();
//       }
//     } else {
//       // Fluttertoast.showToast(msg: 'Please enable location');
//       // final AndroidIntent intent = new AndroidIntent(
//       //   action: 'android.settings.LOCATION_SOURCE_SETTINGS',
//       // );
//       // await intent.launch();
//       // permission = await Geolocator.requestPermission();
//     }
//   }

//   getLocation() async {
//     position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(position.longitude); //Output: 80.24599079
//     print(position.latitude); //Output: 29.6593457

//     long = position.longitude.toString();
//     lat = position.latitude.toString();

//     LocationSettings locationSettings = LocationSettings(
//       accuracy: LocationAccuracy.high, //accuracy of the location data
//       distanceFilter: 100, //minimum distance (measured in meters) a
//       //device must move horizontally before an update event is generated;
//     );

//     StreamSubscription<Position> positionStream =
//         Geolocator.getPositionStream(
//                 locationSettings: locationSettings)
//             .listen((Position position) {
//       print(position.longitude); //Output: 80.24599079
//       print(position.latitude); //Output: 29.6593457

//       long = position.longitude.toString();
//       lat = position.latitude.toString();
//     });
//   }
// }
