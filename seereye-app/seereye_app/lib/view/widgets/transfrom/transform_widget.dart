import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seereye_app/macro.dart';
import 'package:seereye_app/services/socket_service.dart';
import 'package:seereye_app/src/scenario/actors/actors.dart';
import 'package:seereye_app/src/scenario/actors/transform.dart' as t;
import 'package:seereye_app/src/scenario_builder/actor_presets/actor_preset_element/sensor/sensor.dart';
import 'package:seereye_app/src/transformable.dart';
import 'package:seereye_app/word_bank.dart';

class TransformWidget extends StatefulWidget {
  final Transformable transformableElement;

  const TransformWidget(this.transformableElement, {Key? key})
      : super(key: key);

  @override
  TransformWidgetState createState() => TransformWidgetState();
}

class TransformWidgetState extends State<TransformWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.only(left: 16),
      title: Text(WordBank.transform),
      initiallyExpanded: true,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              _transformElementBuilder(
                  WordBank.location, widget.transformableElement.location),
              _transformElementBuilder(
                  WordBank.rotation, widget.transformableElement.rotation),
              _transformElementBuilder(
                  WordBank.scale, widget.transformableElement.scale),
            ],
          ),
        )
      ],
    );
  }

  Widget _transformElementBuilder(
      String title, t.TransformParameters transParam) {
    List<Widget> elmList = [];

    for (var key in [X_VAL, Y_VAL, Z_VAL]) {
      double xyzValue = 0;
      switch (key) {
        case X_VAL:
          xyzValue = transParam.x;
          break;
        case Y_VAL:
          xyzValue = transParam.y;
          break;
        case Z_VAL:
          xyzValue = transParam.z;
          break;
      }

      elmList.add(
        Flexible(
          child: Container(
            width: 110,
            padding: EdgeInsets.only(right: 15),
            child: TextFormField(
              key: UniqueKey(),
              decoration: InputDecoration(
                isDense: true,
                prefixText: '$key : ',
                border: UnderlineInputBorder(),
              ),
              initialValue: xyzValue.toString(),
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
                  xyzValue = double.parse(value);
                  switch (key) {
                    case X_VAL:
                      transParam.x = double.parse(value);
                      break;
                    case Y_VAL:
                      transParam.y = double.parse(value);
                      break;
                    case Z_VAL:
                      transParam.z = double.parse(value);
                      break;
                  }

                  updateUE();
                }
              },
            ),
          ),
        ),
      );
    }

    List<Widget> colList = [
      ListTile(
        title: Text(
          '$title : ',
          textAlign: TextAlign.center,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: elmList)
    ];
    return Column(children: colList);
  }

  void updateUE() {
    if (widget.transformableElement is Actor) {
      socketService.emitUpdateActor(widget.transformableElement as Actor);
    } else if (widget.transformableElement is Sensor) {
      socketService.emitUpdateSensor(widget.transformableElement as Sensor);
    }
  }
}
