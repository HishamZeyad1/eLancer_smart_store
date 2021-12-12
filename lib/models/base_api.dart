class BaseApi {
  bool? status;
  late String message;


  BaseApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }


}