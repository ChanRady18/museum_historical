class DataModel {
  int? id;
  String? title;
  String? type;
  String? place;
  String? period;
  String? content;
  String? image;
  String? createdAt;
  String? updatedAt;

  DataModel(
      {this.id,
      this.title,
      this.type,
      this.place,
      this.period,
      this.content,
      this.image,
      this.createdAt,
      this.updatedAt});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    place = json['place'];
    period = json['period'];
    content = json['content'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['place'] = this.place;
    data['period'] = this.period;
    data['content'] = this.content;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class BannerModel {
  String? image;
  String? title;
  String? subtitle;
  String? description;

  BannerModel({this.image, this.title, this.subtitle, this.description});

  BannerModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    return data;
  }
}