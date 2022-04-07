import 'dart:convert';

AskedModel askedModelFromJson(String str) =>
    AskedModel.fromJson(json.decode(str));

String askedModelToJson(AskedModel data) => json.encode(data.toJson());

class AskedModel {
  String? title;
  String? summary;
  String? description;

  String? date;
  DateTime? created_at;
  String? names;

  AskedModel({
    this.title,
    this.summary,
    this.description,
    this.date,
    this.created_at,
    this.names,
  });
  factory AskedModel.fromJson(Map<String, dynamic> json) => AskedModel(
        title: json["title"],
        summary: json["summary"],
        description: json["description"],
        date: json["date"],
        created_at: json["created_at"],
        names: json["names"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "summary": summary,
        "description": description,
        "date": date,
        "created_at": created_at,
        "names": names,
      };
}
