class Homegoods {
  final String id;
  final String homegoodsBrand;
  final String homegoodsModel;
  final String homegoodsPrice;
  final String homegoodsQuantity;
  final String homegoodsYear;
  final DateTime homegoodsExpiration;

  Homegoods._(
      this.id,
      this.homegoodsBrand,
      this.homegoodsModel,
      this.homegoodsPrice,
      this.homegoodsQuantity,
      this.homegoodsYear,
      this.homegoodsExpiration);

  factory Homegoods.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId("', '').replaceAll('"', '');
    final homegoodsBrand = json['homegoodsBrand'];
    final homegoodsModel = json['homegoodsModel'];
    final homegoodsPrice = json['homegoodsPrice'];
    final homegoodsQuantity = json['homegoodsQuantity'];
    final homegoodsYear = json['homegoodsYear'];
    final homegoodsExpiration = json['homegoodsExpiration'];

    return Homegoods._(id, homegoodsBrand, homegoodsModel, homegoodsPrice,
        homegoodsQuantity, homegoodsYear, homegoodsExpiration);
  }
}
