class Appliance {
  final String id;
  final String applianceBrand;
  final String applianceModel;
  final String applianceYear;
  final DateTime applianceExpiration;

  Appliance._(this.id, this.applianceBrand, this.applianceModel,
      this.applianceYear, this.applianceExpiration);

  factory Appliance.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId("', '').replaceAll('"', '');
    final applianceBrand = json['applianceBrand'];
    final applianceModel = json['applianceModel'];
    final applianceYear = json['applianceYear'];
    final applianceExpiration = json['applianceExpiration'];

    return Appliance._(
        id, applianceBrand, applianceModel, applianceYear, applianceExpiration);
  }
}
