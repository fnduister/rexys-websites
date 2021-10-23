import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/param.dart';
import 'package:seereye_app/src/scenario_builder/scenario_builder_macro.dart';

// #region Vehicle_Material_Macro
// const String paint = 'Paint';
// const String frontColor = 'FrontColor';
// const String trim = 'Trim';
// const String interior = 'Interior';
// const String headlight = 'Headlight';
// const String leather = 'Leather';
// const String stichedLeather = 'StichedLeather';
// const String seams = 'Seams';
// const String mainGlass = 'MainGlass';
// const String glassEdge = 'GlassEdge';
// const String glossyLens = 'GlossyLens';
// const String mirror = 'Mirror';
// const String lightCasing = 'LightCasing';
// const String ledLight = 'LedLight';
// const String rearLightCasing = 'RearLightCasing';
// const String rearLight = 'RearLight';
// const String plastic = 'Plastic';
// const String tires = 'Tires';
// const String wheel = 'Wheel';
// const String breakDisk = 'BreakDisk';
// const String engineBlock = 'EngineBlock';

const String paint = 'Paint';
const String topPaint = 'TopPaint';
const String tires = 'Tires';
const String rims = 'Rims';
const String brakes = 'Brakes';
const String interior = 'Interior';
const String rimsPlating = 'RimsPlating';
const String wheel = 'Wheel';
const String glass = "Glass";
const String brakeDisk = 'Brakedisk';

// #endregion Vehicle_Material_Macro

// #region Pedestrian_Material_Macro
const String hair1 = 'Hair1';
const String hair2 = 'Hair2';
const String eyes = 'Eyes';
const String eyesTrans = 'EyesTrans';
const String skin1 = 'Skin1';
const String skin2 = 'Skin2';
const String cloth = 'Cloth';
// #endregion Pedestrian_Material_Macro

class Material<T> {
  Param<T> param;
  Material(this.param);
  Material.fromJson(dynamic json) : this(Param.fromJson(json));

  String get name => param.displayName[LANGUAGE]!;
  T get value => param.value;
  void set value(T value) => param.value = value;

  @override
  String toString() {
    return '$param';
  }

  String toUEString() {
    return '${param.toUEString()}';
  }
}

class MaterialList {
  final List<Material<String>> materialList = [];
  MaterialList(List<Material<List<String>>> materialListJson) {
    for (var m in materialListJson) {
      materialList.add(Material<String>(Param(
          m.param.jsonName, m.param.displayName, m.param.value.first,
          hide: m.param.hide)));
    }
  }

  @override
  String toString() {
    return '{"$MATERIALS_JSON_NAME": $materialList}';
  }

  String toUEString() {
    String jsonString = '';

    for (var material in materialList) {
      jsonString += '${material.toUEString()},';
    }

    jsonString = jsonString.isEmpty
        ? '[]'
        : '[${jsonString.substring(0, jsonString.length - 1)}]';

    return '{"$MATERIALS_JSON_NAME": $jsonString}';
  }
}

// List<Material<List<String>>> vehicleMaterials = [
//   Material(Param(paint, {EN: 'Paint', FR: 'Paint'},
//       ['Paint_default', 'Red_paint', 'Blue_paint'])),
//   Material(Param(frontColor, {EN: 'Front Color', FR: 'Front Color'},
//       ['Front_color_default'])),
//   Material(Param(trim, {EN: 'Trim', FR: 'Trim'}, ['Trim_default'])),
//   Material(
//       Param(interior, {EN: 'Interior', FR: 'Interior'}, ['Interior_default'])),
//   Material(Param(
//       headlight, {EN: 'Headlight', FR: 'Headlight'}, ['Headlight_default'])),
//   Material(Param(leather, {EN: 'Leather', FR: 'Leather'}, ['Leather_default'])),
//   Material(Param(stichedLeather, {EN: 'Stiched Leather', FR: 'Stiched Leather'},
//       ['Stitched_leather_default'])),
//   Material(Param(seams, {EN: 'Seams', FR: 'Seams'}, ['Seams_default'])),
//   Material(Param(
//       mainGlass, {EN: 'Main Glass', FR: 'Main Glass'}, ['Main_glass_default'])),
//   Material(Param(
//       glassEdge, {EN: 'Glass Edge', FR: 'Glass Edge'}, ['Glass_edge_default'])),
//   Material(Param(glossyLens, {EN: 'Glossy Lens', FR: 'Glossy Lens'},
//       ['Glossy_lens_default'])),
//   Material(Param(mirror, {EN: 'Mirror', FR: 'Mirror'}, ['Mirror_default'])),
//   Material(Param(lightCasing, {EN: 'Light Casing', FR: 'Light Casing'},
//       ['Light_casing_default'])),
//   Material(Param(
//       ledLight, {EN: 'Led Light', FR: 'Led Light'}, ['Led_light_default'])),
//   Material(Param(
//       rearLightCasing,
//       {EN: 'Rear Light Casing', FR: 'Rear Light Casing'},
//       ['Rear_light_casing_default'])),
//   Material(Param(
//       rearLight, {EN: 'Rear Light', FR: 'Rear Light'}, ['Rear_light_default'])),
//   Material(Param(plastic, {EN: 'Plastic', FR: 'Plastic'}, ['Plastic_default'])),
//   Material(Param(tires, {EN: 'Tires', FR: 'Tires'}, ['Tire_default'])),
//   Material(Param(wheel, {EN: 'Wheel', FR: 'Wheel'}, ['Wheel_default'])),
//   Material(Param(
//       breakDisk, {EN: 'Break Disk', FR: 'Break Disk'}, ['Breakdisk_default'])),
//   Material(Param(engineBlock, {EN: 'Engine Block', FR: 'Engine Block'},
//       ['Engine_block_default'])),
// ];

List<Material<List<String>>> vehicleMaterials = [
  Material(
      Param(topPaint, {EN: 'TopPaint', FR: 'TopPaint'}, ['TopPaint_default'])),
  Material(Param(tires, {EN: 'Tire', FR: 'Tire'}, ['Tire_default'])),
  Material(Param(rims, {EN: 'Rims', FR: 'Rims'}, ['Rims_default'])),
  Material(Param(brakes, {EN: 'Brakes', FR: 'Brakes'}, ['Brakes_default'])),
  Material(
      Param(interior, {EN: 'Interior', FR: 'Interior'}, ['Interior_default'])),
  Material(Param(rimsPlating, {EN: 'RimsPlating', FR: 'RimsPlating'},
      ['RimsPlating_default'])),
  Material(Param(wheel, {EN: 'Wheel', FR: 'Wheel'}, ['Wheel_default'])),
  Material(Param(glass, {EN: 'Glass', FR: 'Glass'}, ['Main_glass_default'])),
  Material(Param(
      brakeDisk, {EN: 'Brakedisk', FR: 'Brakedisk'}, ['Breakdisk_default'])),
  Material(Param(paint, {EN: 'Paint', FR: 'Paint'},
      ['Paint_default', 'Red_paint', 'Blue_paint'])),
];

List<Material<List<String>>> pedestrianMaterials = [
  Material(Param(hair1, {EN: 'Hair', FR: 'Hair'}, ['Hair1_default'])),
  Material(
      Param(hair2, {EN: 'Facial Hair', FR: 'Facial Hair'}, ['Hair2_default'])),
  Material(Param(eyes, {EN: 'Eyes', FR: 'Eyes'}, ['Eyes_default'])),
  Material(Param(eyesTrans, {EN: 'Eyes Transparence', FR: 'Eyes Transparence'},
      ['EyesTrans_default'])),
  Material(Param(skin1, {EN: 'Skin', FR: 'Skin'}, ['Skin1_default'])),
  Material(Param(skin2, {EN: 'Skin', FR: 'Skin'}, ['Skin1_default'])),
  Material(Param(cloth, {EN: 'Clothing', FR: 'Clothing'}, ['Cloth_default'])),
];
