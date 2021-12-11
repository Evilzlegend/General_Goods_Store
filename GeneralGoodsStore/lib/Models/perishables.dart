class Perishables {
  final String id;
  final String perishableBrand;
  final String perishableName;
  final DateTime perishableStockDate;
  final String perishablePrice;
  final String perishableQuantity;
  final DateTime perishablesExpiration;

  Perishables._(
      this.id,
      this.perishableBrand,
      this.perishableName,
      this.perishableStockDate,
      this.perishablePrice,
      this.perishableQuantity,
      this.perishablesExpiration);

  factory Perishables.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId("', '').replaceAll('"', '');
    final perishableBrand = json['perishableBrand'];
    final perishableName = json['perishableName'];
    final perishableStockDate = json['perishableStockDate'];
    final perishablePrice = json['perishablePrice'];
    final perishableQuantity = json['perishableQuantity'];
    final perishablesExpiration = json['perishablesExpiration'];

    return Perishables._(
        id,
        perishableBrand,
        perishableName,
        perishableStockDate,
        perishablePrice,
        perishableQuantity,
        perishablesExpiration);
  }
}
