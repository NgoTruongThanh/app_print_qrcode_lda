class DataModel {
  var code;
  String name;

  DataModel({required this.code, required this.name});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    final code = json['code'];
    final name = json['name'];
    return DataModel(code: code, name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class MyListDataModel {
  List<DataModel> data;

  MyListDataModel({required this.data});

  factory MyListDataModel.fromJson(Map<String, dynamic> json) {
    final datas = json['data'] as List<dynamic>;
    final return_data = datas != null
        ? datas.map((datas) => DataModel.fromJson(datas)).toList()
        : <DataModel>[];
    return MyListDataModel(data: return_data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<String> getArray() {
    List<String> temp = [];
    for (DataModel bagType in data) {
      temp.add(bagType.name);
    }
    return temp;
  }

  String findCode(String code) {
    String temp = "";
    for (DataModel bagtype in data) {
      if (code == bagtype.name) {
        temp = bagtype.code.toString();
      }
    }
    print(temp);
    return temp;
  }

  int findCodeInt(String code) {
    int temp = 0;
    for (DataModel bagtype in data) {
      if (code == bagtype.name) {
        temp = bagtype.code;
      }
    }
    print(temp);
    return temp;
  }
}
