import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/sensor.dart';
import 'package:seereye_app/view/tools/pages_utils.dart';
import 'package:seereye_app/view/widgets/transfrom/transform_widget.dart';

class SensorWidget extends StatefulWidget {
  final Sensor sensor;

  const SensorWidget({
    Key? key,
    required this.sensor,
  }) : super(key: key);

  @override
  SensorWidgetState createState() => SensorWidgetState();
}

class SensorWidgetState extends State<SensorWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransformWidget(widget.sensor),
        ExpansionTile(
          title: Text(WordBank.params),
          childrenPadding: EdgeInsets.only(left: 16),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: _sensorParamBuilder(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _sensorParamBuilder() {
    List<Widget> paramList = [];
    widget.sensor.params.sort(
        (a, b) => a.displayName[LANGUAGE]!.compareTo(b.displayName[LANGUAGE]!));
    for (var elm in widget.sensor.params) {
      if (!elm.hide) {
        paramList.add(
          Row(
            children: [
              Flexible(
                child: Container(
                  width: 200,
                  child: ListTile(
                    title: Text('${elm.displayName[LANGUAGE]} : '),
                  ),
                ),
              ),
              Flexible(
                child: elm.value is String
                    ? Container(
                        width: 100,
                        child: TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            border: UnderlineInputBorder(),
                          ),
                          initialValue: elm.value,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return WordBank.inputEmpty;
                            }
                            return null;
                          },
                          onChanged: (String value) {
                            if (_formKey.currentState!.validate() ||
                                value.isNotEmpty) {
                              elm.value = value;
                              socketService.emitUpdateSensor(widget.sensor);
                            }
                          },
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: _mapParamBuilder(elm.value),
                        ),
                      ),
              ),
            ],
          ),
        );
      }
    }

    return paramList;
  }

  List<Widget> _mapParamBuilder(Map paramMap) {
    List<Widget> mapParamList = [];

    for (var key in paramMap.keys) {
      mapParamList.add(
        Container(
          padding: EdgeInsets.only(right: 15),
          width: 116,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              isDense: true,
              prefixText: '$key : ',
              border: UnderlineInputBorder(),
            ),
            initialValue: paramMap[key].toString(),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return WordBank.inputEmpty;
              }
              return null;
            },
            onChanged: (String value) {
              if (_formKey.currentState!.validate() || value.isNotEmpty) {
                paramMap[key] = double.parse(value);
              }
            },
          ),
        ),
      );
    }

    if (isSmallScreen(context) && isTablet(context)) return mapParamList;

    List<Widget> rowList = [];
    for (var i = 0; i < mapParamList.length; i += 2) {
      rowList.add(
        Row(
          children: [
            mapParamList[i],
            if (i + 1 < mapParamList.length) mapParamList[i + 1],
          ],
        ),
      );
    }

    return rowList;
  }
}
