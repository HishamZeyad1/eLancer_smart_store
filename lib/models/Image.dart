class Image {
  late int id;
  late int objectId;
  late String url;
  late String imageUrl;

  Image({required this.id,required  this.objectId,required  this.url,required  this.imageUrl});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object_id'] = this.objectId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
