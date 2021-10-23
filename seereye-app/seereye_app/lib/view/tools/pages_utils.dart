import 'package:flutter/widgets.dart';

const kBrowserListWidth = 300.0;
const kBrowserPropertiesWidth = 400.0;
const kBrowserPresetPropertiesWidth = 550.0;

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width <= 768.0;
}

bool isSmallScreen(BuildContext context) {
  return MediaQuery.of(context).size.width <= 1400;
}
