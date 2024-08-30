import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocationService {
  String? currentAddress;
  Position? currentPosition;

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
      currentPosition = position;
      getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<String?> getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude);
      Placemark place = placeMarks[0];

      currentAddress = '${place.country} ${place.subLocality}';

      return currentAddress;
    } catch (e) {
      return null;
    }
  }

  Future<String?> currentLocation() async {
    await getCurrentPosition();
    if (currentPosition == null) return null;
    final currentLocation = await getAddressFromLatLng(currentPosition!);
    return currentLocation;
  }
}
