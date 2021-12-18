import 'package:dio/dio.dart';
import './Models/appliances.dart';
import './Models/electronics.dart';
import './Models/hardware.dart';
import './Models/homegoods.dart';
import './Models/perishables.dart';

const String localhost = 'http://10.0.2.2:1200';

class InventoryApi {
  final _dio = Dio(BaseOptions(baseUrl: localhost));

  Future<List> getAppliances() async {
    final response = await _dio.get('/getAllAppliances');

    return response.data["appliances"];
  }

  Future<List> getElectronics() async {
    final response = await _dio.get('/getAllElectronics');

    return response.data["electronics"];
  }

  Future<List> getHardware() async {
    final response = await _dio.get('/getAllHardware');

    return response.data["hardwares"];
  }

  Future<List> getHomegoods() async {
    final response = await _dio.get('/getAllHomegoods');

    return response.data["homegoods"];
  }

  Future<List> getPerishables() async {
    final response = await _dio.get('/getAllPerishables');

    return response.data["perishables"];
  }

  deleteAppliance(String id) async {
    await _dio.post('/deleteApplianceByID', data: {'id': id});
  }

  deleteElectronics(String id) async {
    await _dio.post('/deleteElectronicByID', data: {'id': id});
  }

  deleteHardware(String id) async {
    await _dio.post('/deleteHardwareByID', data: {'id': id});
  }

  deleteHomegoods(String id) async {
    await _dio.post('/deleteHomegoodByID', data: {'id': id});
  }

  deletePerishables(String id) async {
    await _dio.post('/deletePerishableByID', data: {'id': id});
  }

  editAppliance(String id, String applianceBrand, String applianceModel,
      String appliancePrice, String applianceQuantity) async {
    await _dio.post('/editApplianceById', data: {
      'id': id,
      'applianceBrand': applianceBrand,
      'applianceModel': applianceModel,
      'appliancePrice': appliancePrice,
      'applianceQuantity': applianceQuantity
    });
  }

  editElectronics(String id, String electronicsBrand, String electronicsModel,
      String electronicsPrice, String electronicsQuantity) async {
    await _dio.post('/editElectronicById', data: {
      'id': id,
      'electronicsBrand': electronicsBrand,
      'electronicsModel': electronicsModel,
      'electronicsPrice': electronicsPrice,
      'electronicsQuantity': electronicsQuantity
    });
  }

  editHardware(String id, String hardwareBrand, String hardwareModel,
      String hardwarePrice, String hardwareQuantity) async {
    await _dio.post('/editHardwareById', data: {
      'id': id,
      'hardwareBrand': hardwareBrand,
      'hardwareModel': hardwareModel,
      'hardwarePrice': hardwarePrice,
      'hardwareQuantity': hardwareQuantity
    });
  }

  editHomegoods(String id, String homegoodsBrand, String homegoodsModel,
      String homegoodsPrice, String homegoodsQuantity) async {
    await _dio.post('/editHomegoodsById', data: {
      'id': id,
      'homegoodsBrand': homegoodsBrand,
      'homegoodsModel': homegoodsModel,
      'homegoodsPrice': homegoodsPrice,
      'homegoodsQuantity': homegoodsQuantity
    });
  }

  editPerishable(String id, String perishableBrand, String perishableModel,
      String perishablePrice, String perishableQuantity) async {
    await _dio.post('/editPerishableById', data: {
      'id': id,
      'perishableBrand': perishableBrand,
      'perishableModel': perishableModel,
      'perishablePrice': perishablePrice,
      'perishableQuantity': perishableQuantity
    });
  }
}
