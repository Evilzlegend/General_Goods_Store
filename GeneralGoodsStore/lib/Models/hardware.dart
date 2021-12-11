class Hardware {
  final String id;
  final String hardwareBrand;
  final String hardwareModel;
  final String hardwarePrice;
  final String hardwareQuantity;
  final String hardwareYear;
  final DateTime hardwareExpiration;

  Hardware._(
      this.id,
      this.hardwareBrand,
      this.hardwareModel,
      this.hardwarePrice,
      this.hardwareQuantity,
      this.hardwareYear,
      this.hardwareExpiration);

  factory Hardware.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId("', '').replaceAll('"', '');
    final hardwareBrand = json['hardwareBrand'];
    final hardwareModel = json['hardwareModel'];
    final hardwarePrice = json['hardwarePrice'];
    final hardwareQuantity = json['hardwareQuantity'];
    final hardwareYear = json['hardwareYear'];
    final hardwareExpiration = json['hardwareExpiration'];

    return Hardware._(id, hardwareBrand, hardwareModel, hardwarePrice,
        hardwareQuantity, hardwareYear, hardwareExpiration);
  }
}
