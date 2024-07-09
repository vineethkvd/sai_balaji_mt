// import 'dart:async';

// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:geolocator/geolocator.dart';

// class Location extends StatefulWidget {
//   const Location({super.key});

//   @override
//   State<Location> createState() => _LocationState();
// }

// class _LocationState extends State<Location> {
//   bool servicestatus = false;
//   bool haspermission = false;
//   late LocationPermission permission;
//   late Position position;
//   String long = "", lat = "";
//   late StreamSubscription<Position> positionStream;

//   @override
//   void initState() {
//     checkGps();
//     super.initState();
//   }

//   checkGps() async {
//     servicestatus = await Geolocator.isLocationServiceEnabled();
//     if (servicestatus) {
//       permission = await Geolocator.checkPermission();

//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           print('Location permissions are denied');
//         } else if (permission == LocationPermission.deniedForever) {
//           print("'Location permissions are permanently denied");
//         } else {
//           haspermission = true;
//         }
//       } else {
//         haspermission = true;
//       }

//       if (haspermission) {
//         setState(() {
//           //refresh the UI
//         });

//         getLocation();
//       }
//     } else {
//       print("GPS Service is not enabled, turn on GPS location");
//     }

//     setState(() {
//       //refresh the UI
//     });
//   }

//   getLocation() async {
//     position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(position.longitude); //Output: 80.24599079
//     print(position.latitude); //Output: 29.6593457

//     long = position.longitude.toString();
//     lat = position.latitude.toString();

//     setState(() {
//       //refresh UI
//     });

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

//       setState(() {
//         //refresh UI on update
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
