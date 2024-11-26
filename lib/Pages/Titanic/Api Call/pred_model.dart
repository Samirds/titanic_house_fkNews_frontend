
class Predict {
  int? result;
  TitanicData? titanicData;

  Predict({this.result, this.titanicData});

  Predict.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    titanicData = json['titanic_data'] != null
        ? new TitanicData.fromJson(json['titanic_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.titanicData != null) {
      data['titanic_data'] = this.titanicData!.toJson();
    }
    return data;
  }
}

class TitanicData {
  int? age;
  String? gender;
  int? fare;
  int? pclass;
  String? embarked;
  String? cabin;
  int? sbsp;
  int? parch;

  TitanicData(
      {this.age,
        this.gender,
        this.fare,
        this.pclass,
        this.embarked,
        this.cabin,
        this.sbsp,
        this.parch});

  TitanicData.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    gender = json['gender'];
    fare = json['fare'];
    pclass = json['pclass'];
    embarked = json['embarked'];
    cabin = json['cabin'];
    sbsp = json['sbsp'];
    parch = json['parch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['fare'] = this.fare;
    data['pclass'] = this.pclass;
    data['embarked'] = this.embarked;
    data['cabin'] = this.cabin;
    data['sbsp'] = this.sbsp;
    data['parch'] = this.parch;
    return data;
  }
}

