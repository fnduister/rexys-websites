import 'package:seereye_app/macro.dart';

class Transform {
  late final Location _location;
  late final Rotation _rotation;
  late final Scale _scale;

  Transform({Location? location, Rotation? rotation, Scale? scale}) {
    _location = location ?? Location();
    _rotation = rotation ?? Rotation();
    _scale = scale ?? Scale();
  }

  Transform.fromJson(dynamic json)
      : this(
            location: Location.fromJson(json[LOCATION]),
            rotation: Rotation.fromJson(json[ROTATION]),
            scale: Scale.fromJson(json[SCALE]));

  Location get location => _location;
  Rotation get rotation => _rotation;
  Scale get scale => _scale;

  void setLocation({double? x, double? y, double? z}) {
    _location.x = x ?? _location.x;
    _location.y = z ?? _location.y;
    _location.z = z ?? _location.z;
  }

  void setRotation({double? x, double? y, double? z}) {
    _rotation.x = x ?? _rotation.x;
    _rotation.y = z ?? _rotation.y;
    _rotation.z = z ?? _rotation.z;
  }

  void setScale({double? x, double? y, double? z}) {
    _scale.x = x ?? _scale.x;
    _scale.y = z ?? _scale.y;
    _scale.z = z ?? _scale.z;
  }

  @override
  String toString() {
    return '"$TRANSFORM" : {$_location, $_rotation, $_scale}';
  }
}

abstract class TransformParameters {
  double x;
  double y;
  double z;

  TransformParameters({required this.x, required this.y, required this.z});

  @override
  String toString() {
    return '"$X_VAL" : $x, "$Y_VAL" : $y, "$Z_VAL" : $z';
  }
}

class Location extends TransformParameters {
  Location({double x = 0, double y = 0, double z = 0})
      : super(x: x, y: y, z: z);

  Location.fromJson(dynamic json)
      : this(x: json[X_VAL], y: json[Y_VAL], z: json[Z_VAL]);

  @override
  String toString() {
    return '"$LOCATION" : {${super.toString()}}';
  }
}

class Rotation extends TransformParameters {
  Rotation({double x = 0, double y = 0, double z = 0})
      : super(x: x, y: y, z: z);

  Rotation.fromJson(dynamic json)
      : this(x: json[X_VAL], y: json[Y_VAL], z: json[Z_VAL]);

  @override
  String toString() {
    return '"$ROTATION" : {${super.toString()}}';
  }
}

class Scale extends TransformParameters {
  Scale({double x = 1, double y = 1, double z = 1}) : super(x: x, y: y, z: z);

  Scale.fromJson(dynamic json)
      : this(x: json[X_VAL], y: json[Y_VAL], z: json[Z_VAL]);

  @override
  String toString() {
    return '"$SCALE" : {${super.toString()}}';
  }
}
