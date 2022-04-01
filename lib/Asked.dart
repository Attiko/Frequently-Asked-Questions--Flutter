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


// Future<AskedModel> submitData(
//   String title,
//   String summary,
//   String description,
//   String user_id,
//   String date,
//   String created_at,
//   String names,
// ) async {
//   final response =
//       await http.post(Uri.parse("http://localhost:8080/questions"), 
//       headers: <String, String>{
//         'Content-type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         "title": title,
//     "summary": summary,
//     "description": description,
//     "user_id": user_id,
//     "date": date,
//     "created_at": created_at,
//     "names": names,
//       }),
    
//   );

  

//   var data = response.body;
//   print(data);

// class QuestionsModels {
//   QuestionsModels({
//     required this.title,
//     required this.summary,
//     required this.description,
//     required this.user_id,
//     required this.date,
//     required this.created_at,
//     required this.names,
//   });

//   String title;
//   String summary;
//   String description;
//   String user_id;
//   String date;
//   String created_at;
//   String names;

  

  
// }



 
// }
