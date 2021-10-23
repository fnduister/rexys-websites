import 'package:seereye_app/src/scenario/actors/transform.dart';

class Transformable {
  late Transform transform;

  Location get location => transform.location;
  Rotation get rotation => transform.rotation;
  Scale get scale => transform.scale;

  void setLocation({double? x, double? y, double? z}) {
    transform.setLocation(x: x, y: y, z: z);
  }

  void setRotation({double? x, double? y, double? z}) {
    transform.setRotation(x: x, y: y, z: z);
  }

  void setScale({double? x, double? y, double? z}) {
    transform.setScale(x: x, y: y, z: z);
  }
}
