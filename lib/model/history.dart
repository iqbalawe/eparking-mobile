class History {
  String name;
  String status;
  String brand;
  String licensePlate;
  String dateIn;
  String dateOut;

  History({
    required this.name,
    required this.status,
    required this.brand,
    required this.licensePlate,
    required this.dateIn,
    required this.dateOut,
  });
}

var historyList = [
  History(
    name: 'Fahmi Hafidzulhaq',
    status: 'Masuk',
    brand: 'Vespa PX 150',
    licensePlate: 'B 123 RWF',
    dateIn: '2021-06-21 07:49:22',
    dateOut: '2021-07-24 19:41:03',
  ),
  History(
    name: 'Muhammad Alwi',
    status: 'Keluar',
    brand: 'Yamaha Mio',
    licensePlate: 'F 321 STF',
    dateIn: '2021-07-24 21:54:02',
    dateOut: '',
  ),
];
