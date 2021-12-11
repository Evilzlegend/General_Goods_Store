class Electronics {
  final String id;
  final String electronicsBrand;
  final String electronicsModel;
  final String electronicsYear;
  final DateTime electronicsExpiration;

  Electronics._(this.id, this.electronicsBrand, this.electronicsModel,
      this.electronicsYear, this.electronicsExpiration);

  factory Electronics.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId("', '').replaceAll('"', '');
    final electronicsBrand = json['electronicsBrand'];
    final electronicsModel = json['electronicsModel'];
    final electronicsYear = json['electronicsYear'];
    final electronicsExpiration = json['electronicsExpiration'];

    return Electronics._(id, electronicsBrand, electronicsModel,
        electronicsYear, electronicsExpiration);
  }
}
