enum LightState {
  red,
  yellow,
  green,
}

class TrafficLight {
  String id;
  LightState state;
  bool isOn;

  TrafficLight({required this.id, required this.state, required this.isOn});

  static fromJson(key, value) {}
}

List<TrafficLight> trafficLights = [
  TrafficLight(id: '1', state: LightState.red, isOn: true),
  TrafficLight(id: '2', state: LightState.green, isOn: false),
  TrafficLight(id: '3', state: LightState.yellow, isOn: false),
  TrafficLight(id: '4', state: LightState.green, isOn: false),
];
