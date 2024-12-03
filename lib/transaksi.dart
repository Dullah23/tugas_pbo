import 'produk.dart';

class Transaksi {
  DateTime tanggal;
  List<Map<String, dynamic>> items;
  double total;

  Transaksi(this.items)
      : tanggal = DateTime.now(),
        total = items.fold(0, (sum, item) {
          var produk = item['produk'] as Produk;
          return sum + (produk.harga * item['jumlah']);
        });

  void cetakStruk() {
    print('\n=== Struk Belanja ===');
    print('Tanggal: $tanggal');
    for (var item in items) {
      var produk = item['produk'] as Produk;
      print('${item['jumlah']}x ${produk.nama} (Rp ${produk.harga})');
    }
    print('Total: Rp ${total.toStringAsFixed(2)}');
  }
}
