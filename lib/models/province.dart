class Province{
  int id;
  String name;

  Province(
      this.id,
      this.name,
      );

  Province.fromJson(Map<String, dynamic> json) :
        id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}