class District{
  int id;
  String name;

  District(
      this.id,
      this.name,
      );

  District.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}