import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seereye_app/general_variables.dart';
import 'package:seereye_app/services/services_macro.dart';
import 'package:seereye_app/src/scenario/scenario_macro.dart';

class HttpService {
  // #region Routes

  static final String _baseAdress =
      'https://4um79scp1e.execute-api.us-east-1.amazonaws.com';
  static late final String _devAdress = _baseAdress + '/dev';
  static late final String _seereyeDevAdress = _devAdress + '/seereye';

  static late final String _initSeereyeAdress = _seereyeDevAdress + '/init';
  static late final String _initBuildersSeereyeAdress =
      _initSeereyeAdress + '/builders';
  static late final String _initNodesSeereyeAdress =
      _initSeereyeAdress + '/nodes';

  static late final String _startSeereyeAdress = _seereyeDevAdress + '/start';
  static late final String _stopSeereyeAdress = _seereyeDevAdress + '/stop';
  static late final String _stopBuildersAdress =
      _stopSeereyeAdress + '/builders';

  // #endregion Routes

  static String nodeInitReturn = '';
  static List<String> nodeInitBody = [];

  static Future<bool> initSeereyeBuilders() async {
    final response = await http.post(Uri.parse(_initBuildersSeereyeAdress));

    if (response.statusCode == 200) {
      socketService =
          SocketService.fromJson(jsonDecode(response.body)[INSTANCES]);
      awsService = AwsService.fromJson(jsonDecode(response.body)[INSTANCES]);
      return true;
    } else {
      socketService = SocketService();
      awsService = AwsService();
      return false;
    }
  }

  static Future<bool> initSeereyeNodes() async {
    http.Response? response;

    await StopSeereye().then((value) async {
      if (value) {
        try {
          response = await http.post(Uri.parse(_initNodesSeereyeAdress),
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              body:
                  '{"${SCENARIO_NAMING.toLowerCase()}":${scenario.toUEString()}}');
        } catch (e) {
          return false;
        }
      }
    });

    if (response?.statusCode == 200) {
      nodeInitReturn = response!.body;
      nodeInitBody.clear();
      for (var camera in jsonDecode(nodeInitReturn)[INSTANCES][NODES]) {
        nodeInitBody.add(camera[NAME]);
      }
      return true;
    }
    return false;
  }

  static Future<bool> StartSeereye() async {
    if (nodeInitReturn.isNotEmpty) {
      final response = await http.post(Uri.parse(_startSeereyeAdress),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: nodeInitReturn);

      if (response.statusCode == 200) {
        awsService.addDisplayViewers(jsonDecode(nodeInitReturn)[INSTANCES]);
        print('Seereye started');
        return true;
      }
    }
    print('Unable to start Seereye');
    return false;
  }

  static Future<bool> StopSeereye() async {
    try {
      nodeInitReturn = '';
      final response = await http.post(Uri.parse(_stopSeereyeAdress));

      if (response.statusCode == 200) {
        awsService.removeDisplayViewers();
        print('Seereye stopped');
        return true;
      } else {
        print('Unable to stop Seereye');
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> StopBuilders() async {
    final response = await http.post(Uri.parse(_stopBuildersAdress));

    if (response.statusCode == 200) {
      print('Builders stopped, please refresh page');
      return true;
    } else {
      print('Unable to stop AWS');
      return false;
    }
  }
}
