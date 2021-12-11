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
    await _dio.post('/deleteApplianceByID', data: {'_id': id});
  }

  deleteElectronics(String id) async {
    await _dio.post('/deleteElectronicByID', data: {'_id': id});
  }

  deleteHardware(String id) async {
    await _dio.post('/deleteHardwareByID', data: {'_id': id});
  }

  deleteHomegoods(String id) async {
    await _dio.post('/deleteHomegoodByID', data: {'_id': id});
  }

  deletePerishables(String id) async {
    await _dio.post('/deletePerishableByID', data: {'_id': id});
  }
}
