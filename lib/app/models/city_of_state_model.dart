class CityOfStateModel {
  List<CityOfStateData>? data;

  CityOfStateModel({this.data});

  CityOfStateModel.fromJson(List json) {
    data = <CityOfStateData>[];
    for (int index = 0; index < json.length; index++) {
      data!.add(CityOfStateData.fromJson(json[index]));
    }
  }
}

class CityOfStateData {
  String? cityName;

  CityOfStateData({this.cityName});

  CityOfStateData.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
  }
}
