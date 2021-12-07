class Sliders {
  late int id;
  late int objectId;
  late String url;
  late String imageUrl;
  Sliders();

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['object_id'] = this.objectId;
  //   data['url'] = this.url;
  //   data['image_url'] = this.imageUrl;
  //   return data;
  // }
}