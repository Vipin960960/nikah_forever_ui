class CountryAndStateModel {
  bool? error;
  String? msg;
  List<CountryStateData>? data;

  CountryAndStateModel({this.error, this.msg, this.data});

  CountryAndStateModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CountryStateData>[];
      json['data'].forEach((v) {
        data!.add(CountryStateData.fromJson(v));
      });
    }
  }
}

class CountryStateData {
  String? name;
  String? iso3;
  String? iso2;
  List<StatesData>? states;

  CountryStateData({this.name, this.iso3, this.iso2, this.states});

  CountryStateData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso3 = json['iso3'];
    iso2 = json['iso2'];
    if (json['states'] != null) {
      states = <StatesData>[];
      json['states'].forEach((v) {
        states!.add(StatesData.fromJson(v));
      });
    }
  }
}

class StatesData {
  String? name;
  String? stateCode;

  StatesData({this.name, this.stateCode});

  StatesData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    stateCode = json['state_code'];
  }
}
