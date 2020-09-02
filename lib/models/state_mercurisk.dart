class StateMerkurisk{
  int state_id;
  String state_name;
  double soil;
  double air;
  double waiter;
  double human;
  double biota;
  double sediment;
  double latitude;
  double longitude;

  StateMerkurisk({
    this.state_id,
    this.state_name,
    this.soil,
    this.waiter,
    this.air,
    this.human,
    this.biota,
    this.sediment,
    this.latitude,
    this.longitude,
  });

  StateMerkurisk.fromJson(Map<String, dynamic> json) :
        state_id = json["state_id"],
        state_name = json["state_name"],
        soil = json["soil"],
        air = json["air"],
        waiter = json["waiter"],
        human = json["human"],
        biota = json["biota"],
        sediment = json["sediment"],
        latitude = json["latitude"],
        longitude = json["longitude"];

  Map<String, dynamic> toJson() => {
    "state_id": state_id,
    "state_name": state_name,
    "air": air,
    "waiter": waiter,
    "soil": soil,
    "human": human,
    "biota": biota,
    "sediment": sediment,
    "latitude": latitude,
    "longitude": longitude,
  };
}