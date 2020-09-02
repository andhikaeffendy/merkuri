class Merkurisk{
  int id;
  int state_id;
  String state_name;
  int district_id;
  String district_name;
  int sub_district_id;
  String sub_district_name;
  int soil;
  int air;
  int waiter;
  int human;
  int biota;
  int sediment;

  Merkurisk({
    this.id,
    this.state_id,
    this.state_name,
    this.district_id,
    this.district_name,
    this.sub_district_id,
    this.sub_district_name,
    this.soil,
    this.waiter,
    this.air,
    this.human,
    this.biota,
    this.sediment,
  });

  Merkurisk.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        state_id = json["state_id"],
        state_name = json["state_name"],
        district_id = json["district_id"],
        district_name = json["district_name"],
        sub_district_id = json["sub_district_id"],
        sub_district_name = json["sub_district_name"],
        soil = json["soil"],
        air = json["air"],
        waiter = json["waiter"],
        human = json["human"],
        biota = json["biota"],
        sediment = json["sediment"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_id": state_id,
    "state_name": state_name,
    "district_id": district_id,
    "district_name": district_name,
    "sub_district_id": sub_district_id,
    "sub_district_name": sub_district_name,
    "air": air,
    "waiter": waiter,
    "soil": soil,
    "human": human,
    "biota": biota,
    "sediment": sediment,
  };
}