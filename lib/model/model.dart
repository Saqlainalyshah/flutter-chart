
class ApiResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
 List<Data>? data;
Support? support;

  ApiResponse({
     this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support

  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      page: json['page'],
        perPage: json['per_page'],
        total: json['total'],
        totalPages: json['total_pages'],
        data:  List.from(json['data'].map((item)=>Data.fromJson(item))),
       support: Support.fromJson(json['support'])
    );
  }


}

// Reviews class
class Data {
  int? id;
  String? name;
  int? year;
  String?color;
  String? pantoneValue;

  Data({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  factory Data.fromJson(Map<String, dynamic> data) {
    return Data(
      id: data["id"],
      name: data['name'],
      year: data['year'],
      color: data['color'],
      pantoneValue: data['pantone_value'],
    );
  }

}
class Support{
  String? url;
  String? text;
  Support({
    this.url,
    this.text
});

  factory Support.fromJson( Map<String,dynamic> json){

    return Support(
      text: json['text'],
      url: json['url']
    );
  }

}
