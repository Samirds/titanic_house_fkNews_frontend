class PredictionHouse {
  double? result;

  PredictionHouse({this.result});

  PredictionHouse.fromJson(Map<dynamic, dynamic> json) {
    result = json['result'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['result'] = this.result;
  //   return data;
  // }
}

class HouseData {
  int? area;
  int? bedrooms;
  int? bathrooms;
  int? stories;
  int? mainroad;
  int? guestroom;
  int? basement;
  int? parking;
  int? prefarea;
  int? furnishingstatus;
  int? luxuryItem;

  HouseData(
      {this.area,
        this.bedrooms,
        this.bathrooms,
        this.stories,
        this.mainroad,
        this.guestroom,
        this.basement,
        this.parking,
        this.prefarea,
        this.furnishingstatus,
        this.luxuryItem});

  // HouseData.fromJson(Map<String, dynamic> json) {
  //   area = json['area'];
  //   bedrooms = json['bedrooms'];
  //   bathrooms = json['bathrooms'];
  //   stories = json['stories'];
  //   mainroad = json['mainroad'];
  //   guestroom = json['guestroom'];
  //   basement = json['basement'];
  //   parking = json['parking'];
  //   prefarea = json['prefarea'];
  //   furnishingstatus = json['furnishingstatus'];
  //   luxuryItem = json['luxury_item'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['stories'] = this.stories;
    data['mainroad'] = this.mainroad;
    data['guestroom'] = this.guestroom;
    data['basement'] = this.basement;
    data['parking'] = this.parking;
    data['prefarea'] = this.prefarea;
    data['furnishingstatus'] = this.furnishingstatus;
    data['luxury_item'] = this.luxuryItem;
    return data;
  }
}