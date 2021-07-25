import 'package:flutter/material.dart';
import 'package:qr_code_scan/service/histori_response.dart';

class HistoryCard extends StatelessWidget {
  final HistoriKendaraan historiKendaraan;

  HistoryCard(this.historiKendaraan);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Civitas',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      historiKendaraan.kendaraan.namaCivitas,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Chip(
                  label: Text(
                    historiKendaraan.status,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: historiKendaraan.status == 'keluar'
                      ? Colors.red
                      : Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Merk',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      historiKendaraan.kendaraan.merk,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plat Nomor',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      historiKendaraan.kendaraan.platNomor,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jam Masuk',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      (historiKendaraan.jamMasuk == null)
                          ? ""
                          : historiKendaraan.jamMasuk.toString(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jam Keluar',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      (historiKendaraan.jamKeluar == null)
                          ? ""
                          : historiKendaraan.jamKeluar.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
