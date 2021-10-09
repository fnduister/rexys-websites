import 'package:seereye_app/macro.dart';
import 'package:seereye_app/src/scenario_builder/scenario_builder_macro.dart';

class Param<E> {
  final String jsonName;
  final Map<String, String> displayName;
  bool hide;
  E value;

  Param(this.jsonName, this.displayName, this.value, {this.hide = false});
  Param.clone(Param newParam)
      : this(newParam.jsonName, newParam.displayName, newParam.value,
            hide: newParam.hide);
  Param.base(E value) : this('', {}, value, hide: true);

  factory Param.fromJson(dynamic json) {
    dynamic js = json[PARAM_VALUE_JSON_NAME];
    dynamic e = js;
    if (js is List && js.length > 0) {
      Type type = js[0].runtimeType;
      switch (type) {
        case bool:
          e = [true];
          break;
        default:
          throw ImplementationOf___NotDoneError(
              'Param Value Adder in .fromJson()');
      }
      e[0] = js[0];
      for (int i = 1; i < json[PARAM_VALUE_JSON_NAME].length; i++) {
        e.add(js[i]);
      }
    }

    Param<E> param = Param(json[PARAM_NAME_JSON_NAME], {}, e,
        hide: json[PARAM_HIDE_JSON_NAME]);

    for (var key in json[PARAM_DISPLAY_NAME_JSON_NAME]?.keys ?? []) {
      param.displayName[key] = json[PARAM_DISPLAY_NAME_JSON_NAME][key];
    }

    return param;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Param && other.jsonName == jsonName;
  }

  @override
  String toString() {
    String displayNameToString = '';
    for (var key in displayName.keys) {
      displayNameToString += '"$key" : "${displayName[key]}",';
    }

    displayNameToString = displayNameToString.isEmpty
        ? '{}'
        : '{${displayNameToString.substring(0, displayNameToString.length - 1)}}';

    String valueToString = '';
    if (value is Map) {
      Map vals = value as Map;
      valueToString += '{';
      for (var key in vals.keys) {
        valueToString += '"$key" : ${vals[key]},';
      }
      valueToString = valueToString.substring(0, valueToString.length - 1);

      valueToString += '}';
    } else
      valueToString = value is String ? '"$value"' : '$value';

    return '{"$PARAM_NAME_JSON_NAME" : "$jsonName", "$PARAM_DISPLAY_NAME_JSON_NAME" : $displayNameToString, "$PARAM_VALUE_JSON_NAME" : $valueToString, "$PARAM_HIDE_JSON_NAME" : $hide}';
  }

  String toUEString() {
    String valueToString = '';
    if (value is Map) {
      Map vals = value as Map;

      valueToString += ', "$PARAM_VALUE_JSON_NAME" :"{';
      for (var key in vals.keys) {
        valueToString += "\\\"$key\\\" : ${vals[key]},";
      }
      valueToString = valueToString.substring(0, valueToString.length - 1);

      valueToString += '}"';
    } else if (value is String)
      valueToString = ', "$PARAM_VALUE_JSON_NAME" :"$value"';

    return '{"$PARAM_NAME_JSON_NAME" : "$jsonName" $valueToString}';
  }
}
