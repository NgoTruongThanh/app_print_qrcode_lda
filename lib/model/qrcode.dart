class QRCode {
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
  int? unit;
  int? state;
  String? qrCode;

  QRCode({
    this.job,
    this.lot,
    this.product,
    this.type,
    this.packet,
    this.line,
    this.warehouse,
    this.error,
    this.number,
    this.empty,
    this.page,
    this.unit,
    this.state,
    this.qrCode
  });

  QRCode copyWith({
    String? job,
    String? lot,
    String? product,
    String? type,
    String? packet,
    String? line,
    String? warehouse,
    String? error,
    int? number,
    bool? empty,
    int? page,
  }) {
    return QRCode(
      job: job ?? this.job,
      lot: lot ?? this.lot,
      product: product ?? this.product,
      type: type ?? this.type,
      packet: packet ?? this.packet,
      line: line ?? this.line,
      warehouse: warehouse ?? this.warehouse,
      error: error ?? this.error,
      number: number ?? this.number,
      empty: empty ?? this.empty,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job': job,
      'lot': lot,
      'product': product,
      'type': type,
      'packet': packet,
      'line': line,
      'warehouse': warehouse,
      'error': error,
      'number': number,
      'empty': empty,
      'page': page,
      'qrcode':qrCode
    };
  }

  Map<String, dynamic> toJsonSearch() {
    return {
      'lot': lot,
      'product': product,
      'type': type,
      'packet': packet,
    };
  }

  factory QRCode.fromJson(Map<String, dynamic> json) {
    return QRCode(
      job: json['job'] as String?,
      lot: json['lot'] as String?,
      product: json['product'] as String?,
      type: json['type'] as String?,
      packet: json['packet'] as String?,
      line: json['line'] as String?,
      warehouse: json['warehouse'] as String?,
      error: json['error'] as String?,
      number: json['number'] as int?,
      empty: json['empty'] as bool?,
      page: json['page'] as int?,
      unit: json['unit'] as int?,
      state: json['state'] as int?,
      qrCode: json['qrcode']  as String?
    );
  }

  factory QRCode.fromJsonSearch(Map<String, dynamic> json) {
    return QRCode(
      lot: json['lot'] as String?,
      product: json['product'] as String?,
      type: json['type'] as String?,
      packet: json['packet'] as String?,
    );
  }


  @override
  String toString() =>
      "CreateCode(job: $job,lot: $lot,product: $product,type: $type,packet: $packet,line: $line,warehouse: $warehouse,error: $error,number: $number,empty: $empty,page: $page)";

  @override
  int get hashCode => Object.hash(job, lot, product, type, packet, line,
      warehouse, error, number, empty, page);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is QRCode &&
              runtimeType == other.runtimeType &&
              job == other.job &&
              lot == other.lot &&
              product == other.product &&
              type == other.type &&
              packet == other.packet &&
              line == other.line &&
              warehouse == other.warehouse &&
              error == other.error &&
              number == other.number &&
              empty == other.empty &&
              page == other.page;
}
