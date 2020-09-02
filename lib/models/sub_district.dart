class SubDistrict{
  int id;
  String name;

  SubDistrict(
      this.id,
      this.name,
      );

  SubDistrict.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}