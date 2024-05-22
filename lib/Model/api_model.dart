class TaskModel {
  String? sId;
  String? title;
  String? description;

  TaskModel({this.sId, this.title, this.description});

  TaskModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
