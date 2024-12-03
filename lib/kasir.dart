import 'transaksi.dart';

class Kasir {
  String nama;
  List<Transaksi> daftarTransaksi = [];

  Kasir(this.nama);

  void prosesTransaksi(Transaksi transaksi) {
    daftarTransaksi.add(transaksi);
    print('\nTransaksi berhasil diproses oleh kasir $nama.');
  }

  void tampilkanLaporan() {
    print('\n=== Laporan Transaksi ===');
    if (daftarTransaksi.isEmpty) {
      print('Belum ada transaksi.');
    } else {
      for (var transaksi in daftarTransaksi) {
        print('Tanggal: ${transaksi.tanggal}');
        print('Total: Rp ${transaksi.total.toStringAsFixed(2)}');
      }
      double totalPendapatan = daftarTransaksi.fold(0, (sum, transaksi) => sum + transaksi.total);
      print('\nTotal Pendapatan: Rp ${totalPendapatan.toStringAsFixed(2)}');
    }
  }
}
