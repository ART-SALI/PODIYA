class ServerError {
  String? detail;

  ServerError({this.detail});

  ServerError.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['detail'] = detail;
    return data;
  }
}