class DistrictMerkurisk{
  int district_id;
  String district_name;
  double soil;
  double air;
  double waiter;
  double human;
  double biota;
  double sediment;
  double latitude;
  double longitude;

  DistrictMerkurisk({
    this.district_id,
    this.district_name,
    this.soil,
    this.waiter,
    this.air,
    this.human,
    this.biota,
    this.sediment,
    this.latitude,
    this.longitude,
  });

  DistrictMerkurisk.fromJson(Map<String, dynamic> json) :
        district_id = json["district_id"],
        district_name = json["district_name"],
        soil = json["soil"],
        air = json["air"],
        waiter = json["waiter"],
        human = json["human"],
        biota = json["biota"],
        sediment = json["sediment"],
        latitude = json["latitude"],
        longitude = json["longitude"];

  Map<String, dynamic> toJson() => {
    "district_id": district_id,
    "district_name": district_name,
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