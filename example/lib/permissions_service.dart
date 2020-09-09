import 'package:permission_handler/permission_handler.dart';
class PermissionsService {
  final PermissionHandler _permissionHandler = PermissionHandler();

  Future<bool> _requestPermission(PermissionGroup permission) async {
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  /// Requests the users permission to camera.
  Future<bool> requestCameraPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.camera);
    if (!granted) {
      onPermissionDenied();
    }
    return granted;
  }
  /// Requests the users permission to camera.
  Future<bool> requestMicPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.microphone);
    if (!granted) {
      onPermissionDenied();
    }
    return granted;
  }
  /// Requests the users permission to read their location when the app is in use
  Future<bool> requestLocationPermission() async {
    return _requestPermission(PermissionGroup.locationWhenInUse);
  }

  /// Requests the users permission to read wrote storage .
  Future<bool> requestStoragePermission() async {
    return _requestPermission(PermissionGroup.storage);
  }

  Future<bool> hasMicPermission() async {
    return hasPermission(PermissionGroup.microphone);
  }
  Future<bool> hasPermission(PermissionGroup permission) async {
    var permissionStatus =
    await _permissionHandler.checkPermissionStatus(permission);
    return permissionStatus == PermissionStatus.granted;
  }

}