class SubDistrictMerkurisk{
  int sub_district_id;
  String sub_district_name;
  double soil;
  double air;
  double waiter;
  double human;
  double biota;
  double sediment;
  double latitude;
  double longitude;

  SubDistrictMerkurisk({
    this.sub_district_id,
    this.sub_district_name,
    this.soil,
    this.waiter,
    this.air,
    this.human,
    this.biota,
    this.sediment,
    this.latitude,
    this.longitude,
  });

  SubDistrictMerkurisk.fromJson(Map<String, dynamic> json) :
        sub_district_id = json["sub_district_id"],
        sub_district_name = json["sub_district_name"],
        soil = json["soil"],
        air = json["air"],
        waiter = json["waiter"],
        human = json["human"],
        biota = json["biota"],
        sediment = json["sediment"],
        latitude = json["latitude"],
        longitude = json["longitude"];

  Map<String, dynamic> toJson() => {
    "sub_district_id": sub_district_id,
    "sub_district_name": sub_district_name,
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