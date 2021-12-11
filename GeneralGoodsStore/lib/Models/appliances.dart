class Appliance {
  final String id;
  final String applianceBrand;
  final String applianceModel;
  final String appliancePrice;
  final String applianceQuantity;
  final String applianceYear;
  final DateTime applianceExpiration;

  Appliance._(
      this.id,
      this.applianceBrand,
      this.applianceModel,
      this.appliancePrice,
      this.applianceQuantity,
      this.applianceYear,
      this.applianceExpiration);

  factory Appliance.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId("', '').replaceAll('"', '');
    final applianceBrand = json['applianceBrand'];
    final applianceModel = json['applianceModel'];
    final appliancePrice = json['appliancePrice'];
    final applianceQuantity = json['applianceQuantity'];
    final applianceYear = json['applianceYear'];
    final applianceExpiration = json['applianceExpiration'];

    return Appliance._(id, applianceBrand, applianceModel, appliancePrice,
        applianceQuantity, applianceYear, applianceExpiration);
  }
}
