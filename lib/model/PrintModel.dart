class PrintModel {
  String? job;
  String? lot;
  String? product;
  String? type;
  String? packet;
  String? line;
  String? warehouse;
  String? error;
  int? number;
  bool? empty;
  int? page;
  String? index;
  PrintModel(
      {this.job = '',
      this.lot = '',
      this.product = '',
      this.type = '',
      this.packet = '',
      this.line = '',
      this.warehouse = 'TT',
      this.error = '',
      this.number = 0,
      this.empty = false,
        this.index = '1',
      this.page = 0});

  PrintModel.fromJson(Map<String, dynamic> json) {
    job = json['job']??'';
    lot = json['lot']??'';
    product = json['product']??'';
    type = json['type']??'';
    packet = json['packet']??'';
    line = json['line']??'';
    warehouse = json['warehouse']??'';
    error = json['error']??'';
    number = json['number']??0;
    empty = json['empty']??false;
    page = json['page']??0;
    index = json['index']??'1';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job'] = job;
    data['lot'] = lot;
    data['product'] = product;
    data['type'] = type;
    data['packet'] = packet;
    data['line'] = line;
    data['warehouse'] = warehouse;
    data['error'] = error;
    data['number'] = number;
    data['empty'] = empty;
    data['page'] = page;
    data['index'] = index??'1';
    return data;
  }
}

PrintModel printModel = PrintModel();
