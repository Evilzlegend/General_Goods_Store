class Electronics {
  final String id;
  final String electronicsBrand;
  final String electronicsModel;
  final String electronicsPrice;
  final String electronicsQuantity;
  final String electronicsYear;
  final DateTime electronicsExpiration;

  Electronics._(
      this.id,
      this.electronicsBrand,
      this.electronicsModel,
      this.electronicsPrice,
      this.electronicsQuantity,
      this.electronicsYear,
      this.electronicsExpiration);

  factory Electronics.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId("', '').replaceAll('"', '');
    final electronicsBrand = json['electronicsBrand'];
    final electronicsModel = json['electronicsModel'];
    final electronicsPrice = json['electronicsPrice'];
    final electronicsQuantity = json['electronicsQuantity'];
    final electronicsYear = json['electronicsYear'];
    final electronicsExpiration = json['electronicsExpiration'];

    return Electronics._(
        id,
        electronicsBrand,
        electronicsModel,
        electronicsPrice,
        electronicsQuantity,
        electronicsYear,
        electronicsExpiration);
  }
}
