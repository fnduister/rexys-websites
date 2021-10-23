import 'package:flutter/material.dart';
import 'package:seereye_app/services/aws_service.dart';
import 'package:seereye_app/word_bank.dart';

class PresetBuilderViewSection extends StatelessWidget {
  const PresetBuilderViewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Stack(
        children: [
          Center(
            child: Text(
              WordBank.loading,
              textAlign: TextAlign.center,
            ),
          ),
          awsService.actorShowroom,
        ],
      ),
    );
  }
}
