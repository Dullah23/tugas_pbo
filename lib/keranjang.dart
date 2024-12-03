import 'produk.dart';

class Keranjang {
  List<Map<String, dynamic>> daftarBelanja = [];

  void tambahProduk(Produk produk, int jumlah) {
    if (jumlah <= produk.stok) {
      daftarBelanja.add({'produk': produk, 'jumlah': jumlah});
      produk.stok -= jumlah;
      print('${jumlah}x ${produk.nama} ditambahkan ke keranjang.');
    } else {
      print('Stok tidak mencukupi untuk ${produk.nama}.');
    }
  }

  double hitungTotal() {
    double total = 0;
    for (var item in daftarBelanja) {
      total += item['produk'].harga * item['jumlah'];
    }
    return total;
  }

  void tampilkanKeranjang() {
    print('\n=== Keranjang Belanja ===');
    if (daftarBelanja.isEmpty) {
      print('Keranjang kosong.');
    } else {
      for (var item in daftarBelanja) {
        var produk = item['produk'] as Produk;
        print('${item['jumlah']}x ${produk.nama} (Rp ${produk.harga})');
      }
      print('Total: Rp ${hitungTotal().toStringAsFixed(2)}');
    }
  }
}
