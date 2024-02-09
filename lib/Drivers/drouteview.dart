import 'dart:async';

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as IMG;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Drivers/login.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Driverrouteview extends StatefulWidget {
  const Driverrouteview({super.key});

  @override
  State<Driverrouteview> createState() => _DriverrouteviewState();
}

class _DriverrouteviewState extends State<Driverrouteview> {
  Completer<GoogleMapController> _controller = Completer();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final CameraPosition _kGooglePlex =
      const CameraPosition(target: LatLng(24.8607, 67.0011), zoom: 15);

  List<Marker> _markers = [];
  List<Marker> _List = const [
    Marker(
      markerId: MarkerId('north_karachi'),
      position: LatLng(24.9729, 67.0643),
      infoWindow: InfoWindow(title: 'North Karachi'),
    ),
    Marker(
      markerId: MarkerId('north_nazimabad'),
      position: LatLng(24.9372, 67.0423),
      infoWindow: InfoWindow(title: 'North Nazimabad'),
    ),
    Marker(
      markerId: MarkerId('gulshan'),
      position: LatLng(24.9189, 67.0971),
      infoWindow: InfoWindow(title: 'Gulshan'),
    ),
    Marker(
      markerId: MarkerId('johar'),
      position: LatLng(24.9204, 67.1344),
      infoWindow: InfoWindow(title: 'Johar'),
    ),
    Marker(
      markerId: MarkerId('bahadurabad'),
      position: LatLng(24.8825, 67.0694),
      infoWindow: InfoWindow(title: 'Bahadurabad'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _markers.addAll(_List);
    _getCurrentLocation();
    _getLocationPeriodically();
    _fetchUsersLocations();
  }

  void _getLocationPeriodically() {
    Timer.periodic(Duration(minutes: 10), (Timer timer) {
      _getCurrentLocation();
    });
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // To save current location
      saveLocationToFirestore(position);
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveLocationToFirestore(Position position) async {
    // Get current user
    User? user = _auth.currentUser;
    print(user!.uid);

    // Check if user is authenticated
    if (user != null) {
      String uid = user.uid;

      // Reference to the user's document in Firestore
      DocumentReference userRef = _firestore.collection('driver').doc(uid);

      // Save location data
      await userRef.set({
        'currentLocation': GeoPoint(position.latitude, position.longitude),
        'lastUpdated': DateTime.now(), // optional timestamp
      }, SetOptions(merge: true)); // merge true to not overwrite other fields
    }
  }

  void _fetchUsersLocations() async {
    // Fetch users' locations from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    // Iterate through each document and add markers on the map
    querySnapshot.docs.forEach((doc) {
      GeoPoint location = doc['currentLocation'];
      String email = doc['email'];
      _addMarker(location.latitude, location.longitude, email);
    });
    print(_markers.toString() + "hello");
  }

  Future<void> _addMarker(double lat, double lng, String userName) async {
    // Load the custom marker image from assets
    ByteData imageData = await rootBundle.load('assets/images/person.png');
    Uint8List bytes = imageData.buffer.asUint8List();

    // Resize the marker image
    Uint8List resizedBytes =
        resizeImage(bytes, 60, 60); // Adjust the width and height as needed

    // Convert the resized image to a BitmapDescriptor
    BitmapDescriptor customIcon = BitmapDescriptor.fromBytes(resizedBytes);

    // Add the marker to the markers list
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(userName),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: userName),
        icon: customIcon,
      ));
    });

    print("Marker added: $lat, $lng, $userName");
  }

// Function to resize an image
  Uint8List resizeImage(Uint8List data, int width, int height) {
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: height);
    return Uint8List.fromList(IMG.encodePng(resized));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(188, 10, 15, 1),
        title: const Text(
          'Route View',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                )),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.yellow,
                size: 25,
              ),
              title: const Text('HOME',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.map,
                color: Colors.yellow,
                size: 25,
              ),
              title: const Text('ROUTE VIEW',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Driverrouteview()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.key,
                color: Colors.yellow,
                size: 25,
              ),
              title: const Text('CHANGE PASSWORD',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.yellow,
                size: 25,
              ),
              title: const Text('LOGOUT',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const driverlogin()),
                );
              },
            ),
          ],
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationButtonEnabled: true,
      ),
    );
  }
}
