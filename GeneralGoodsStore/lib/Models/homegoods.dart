class Homegoods {
  final String id;
  final String homegoodsBrand;
  final String homegoodsModel;
  final String homegoodsYear;
  final DateTime homegoodsExpiration;

  Homegoods._(this.id, this.homegoodsBrand, this.homegoodsModel,
      this.homegoodsYear, this.homegoodsExpiration);

  factory Homegoods.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId("', '').replaceAll('"', '');
    final homegoodsBrand = json['homegoodsBrand'];
    final homegoodsModel = json['homegoodsModel'];
    final homegoodsYear = json['homegoodsYear'];
    final homegoodsExpiration = json['homegoodsExpiration'];

    return Homegoods._(
        id, homegoodsBrand, homegoodsModel, homegoodsYear, homegoodsExpiration);
  }
}
