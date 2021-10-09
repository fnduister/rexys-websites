Exception ImpossibleToAdd___Error(String element) => Exception(
      'Impossible to add this $element. The event might not be implemented.',
    );

Exception ImpossibleToLoad___Error(String element) => Exception(
      'Impossible to load this $element from json. Some macro might not be implemented.',
    );

Exception ImplementationOf___NotDoneError(String element) => Exception(
      'The implementation of $element is missing',
    );

const String TYPE_JSON_NAME = 'Type';

final String TRANSFORM = 'transform';
final String LOCATION = 'location';
final String ROTATION = 'rotation';
final String SCALE = 'scale';
const String X_VAL = 'x';
const String Y_VAL = 'y';
const String Z_VAL = 'z';
