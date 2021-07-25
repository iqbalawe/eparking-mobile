import 'package:flutter/material.dart';
import 'package:qr_code_scan/service/kendaraan_terparkir.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart' as dio;

import '../service/histori_response.dart';
import '../widgets/history_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getHistori();
    getParkingCapacity();
  }

  List<HistoriKendaraan> historiKendaraan = [];
  int count = 0;

  void getParkingCapacity() async {
    late dio.Dio _http;
    Map<String, dynamic> headers = {
      dio.Headers.acceptHeader: dio.Headers.jsonContentType,
    };

    dio.BaseOptions opt = dio.BaseOptions(
      baseUrl: 'http://smirnof-whiskey.my.id/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );
    _http = dio.Dio(opt);

    dio.Response response;

    response = await _http.get('/count');

    if (response.data != null) {
      print(response.data!);
      KendaraanTerparkirResponse kendaraanTerparkirResponse =
          KendaraanTerparkirResponse.fromJson(response.data!);
      setState(() {
        count = kendaraanTerparkirResponse.data;
      });
    } else {
      print('something wrong');
    }
  }

  void getHistori() async {
    late dio.Dio _http;
    Map<String, dynamic> headers = {
      dio.Headers.acceptHeader: dio.Headers.jsonContentType,
    };

    dio.BaseOptions opt = dio.BaseOptions(
      baseUrl: 'http://smirnof-whiskey.my.id/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );
    _http = dio.Dio(opt);

    dio.Response response;

    response = await _http.get('/histori');

    if (response.data != null) {
      print(response.data!);
      HistoriResponse historiResponse =
          HistoriResponse.fromJson(response.data!);
      setState(() {
        historiKendaraan = historiResponse.data;
      });
    } else {
      print('something wrong');
    }
  }

  void getHistoryMasuk(String id) async {
    late dio.Dio _http;
    Map<String, dynamic> headers = {
      dio.Headers.acceptHeader: dio.Headers.jsonContentType,
    };

    dio.BaseOptions opt = dio.BaseOptions(
      baseUrl: 'http://smirnof-whiskey.my.id/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );
    _http = dio.Dio(opt);

    dio.Response response;

    response = await _http.get('histori/store?id=' + id);
    print(response.data);

    // if (response.data != null) {
    //   HistoriMasukResponse historiMasukResponse =
    //       HistoriMasukResponse.fromJson(response.data!);
    // } else {
    //   print('something wrong');
    // }
    getHistori();
    getParkingCapacity();
    // dah coba
  }

  void catcher() async {
    try {
      await Permission.camera.request();
      String? cameraScanResult = await scanner.scan();
      if (cameraScanResult != null) {
        getHistoryMasuk(cameraScanResult);
      }
    } catch (e, st) {
      print(e);
      print(st);
    }
    // await Permission.camera.request();
    // String? cameraScanResult = await scanner.scan();
    // if (cameraScanResult != null) {
    //   print(cameraScanResult);
    //   try {
    //     Response response = await Dio().get(
    //         'http://smirnof-whiskey.my.id/api/kendaraan?id=' +
    //             cameraScanResult);
    //     print(response.data);
    //     KendaraanResponse kendaraanResponse =
    //         kendaraanResponseFromJson(response.data.toString());
    //     print(kendaraanResponse.data.namaCivitas);
    //   } catch (e) {
    //     print(e);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.catcher();
        },
        child: Icon(Icons.qr_code),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          'Parkir STT-NF',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  margin: EdgeInsets.only(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 50,
                  ),
                  color: Colors.green,
                  child: Column(
                    children: [
                      Text(
                        count.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Kendaraan Terparkir',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 50,
                  ),
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Text(
                        '150',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Kapasitas',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: historiKendaraan.map((e) => HistoryCard(e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
