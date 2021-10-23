const String FR = 'fr';
const String EN = 'en';

const String LANGUAGE = EN;

class WordBank {
  static const String title = LANGUAGE == FR ? 'Seereye' : 'Seereye';

  static const String no = LANGUAGE == FR ? 'Non' : 'No';
  static const String yes = LANGUAGE == FR ? 'Oui' : 'Yes';
  static const String cancel = LANGUAGE == FR ? 'Arrêter' : 'Cancel';
  static const String close = LANGUAGE == FR ? 'Fermer' : 'Close';

  static const String start = LANGUAGE == FR ? 'Commencer' : 'Start';
  static const String stop = LANGUAGE == FR ? 'Arrêter' : 'Stop';

  static const String actorMenuItem = LANGUAGE == FR ? 'Acteurs' : 'Actors';
  static const String presetBuilderMenuItem =
      LANGUAGE == FR ? "Construction de revêtements" : 'Skins Builder';
  static const String displayMenuItem =
      LANGUAGE == FR ? "Visionnement" : 'Display';

  static const String scenario = LANGUAGE == FR ? 'Scénario' : 'Scenario';
  static const String actors = LANGUAGE == FR ? 'Acteurs' : 'Actors';
  static const String sensedVehicles =
      LANGUAGE == FR ? 'Sensed Vehicles' : 'Sensed Vehicles';
  static const String vehicles = LANGUAGE == FR ? 'Voitures' : 'Vehicles';
  static const String pedestrians = LANGUAGE == FR ? 'Piétons' : 'Pedestrians';

  static const String preset = LANGUAGE == FR ? 'Preset' : 'Preset';
  static const String sensedVehiclePresets =
      LANGUAGE == FR ? 'Sensed Vehicle Presets' : 'Sensed Vehicle Presets';
  static const String vehiclePresets =
      LANGUAGE == FR ? 'Presets de Voitures' : 'Vehicle Presets';
  static const String pedestrianPresets =
      LANGUAGE == FR ? 'Presets de Piétons' : 'Pedestrian Presets';

  static const String meshes = LANGUAGE == FR ? 'Meshes' : 'Meshes';
  static const String materials = LANGUAGE == FR ? 'Matériaux' : 'Materials';
  static const String sensors = LANGUAGE == FR ? 'Senseurs' : 'Sensors';
  static const String params = LANGUAGE == FR ? 'Paramètres' : 'Parameters';

  static const String transform =
      LANGUAGE == FR ? 'Transformation' : 'Transform';
  static const String location = LANGUAGE == FR ? 'Location' : 'Location';
  static const String rotation = LANGUAGE == FR ? 'Rotation' : 'Rotation';
  static const String scale = LANGUAGE == FR ? 'Grandeur' : 'Scale';

  static const String addSensor =
      LANGUAGE == FR ? 'Ajouter un senseur' : 'Add a sensor';
  static const String inputEmpty =
      LANGUAGE == FR ? 'Veuillez insérer une valeur' : 'Please enter a value';

  static const String enterAName =
      LANGUAGE == FR ? 'Veuillez entrer un nom' : 'Please enter a name';

  static const String badName =
      LANGUAGE == FR ? 'Nom indisponible' : 'Name is already used';

  static const String toggleClickTile = LANGUAGE == FR
      ? 'Activer le mouvement de vignette'
      : 'Toggle tile moving';
  static const String toggleTileMover =
      LANGUAGE == FR ? "Activer l'échange de vignette" : 'Toggle swap tile';

  static const String loading = LANGUAGE == FR ? 'Chargement' : 'Loading';

  static const String startSimulation =
      LANGUAGE == FR ? 'Débuter la simulation' : 'Start Simulation';
  static const String connectingToServer =
      LANGUAGE == FR ? 'Connection au serveur...' : 'Connecting to server...';
  static const String connectionError =
      LANGUAGE == FR ? 'Erreur de connexion' : 'Connection error';

  static String startSimulationText(Map<String, List<String>> sensorsElements) {
    int nbOfSensors = 0;
    for (var lst in sensorsElements.values) {
      nbOfSensors += lst.length;
    }

    String text = LANGUAGE == FR
        ? 'Voulez-vous débuter la simulation\navec ${nbOfSensors} éléments?'
        : 'Would you like to start the simulation\nwith ${nbOfSensors} elements?';

    for (var sensedVehicle in sensorsElements.keys) {
      text += '\n\n$sensedVehicle :';
      for (var sensor in sensorsElements[sensedVehicle]!) {
        text += '\n\t\t$sensor';
      }
    }

    return text;
  }

  static const String connectionToServer =
      LANGUAGE == FR ? 'Connection au serveur...' : 'Connection to server...';

  static const String connectionErrorText = LANGUAGE == FR
      ? 'Erreur de connexion, réessayez plus tard'
      : 'Connection error, try again later';

  static const String noDisplayAvailable =
      LANGUAGE == FR ? 'Aucun affichage disponible' : 'No display available';
}
