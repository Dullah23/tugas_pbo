import 'dart:io';
import '../lib/produk.dart';
import '../lib/keranjang.dart';
import '../lib/transaksi.dart';
import '../lib/kasir.dart';

void main() {
  var produk1 = Produk('Kaos Polos', 75000, 20);
  var produk2 = Produk('Kemeja Flanel', 120000, 15);
  var produk3 = Produk('Jaket Jeans', 250000, 10);

  var daftarProduk = [produk1, produk2, produk3];
  var keranjang = Keranjang();
  var kasir = Kasir('Andi');

  print('=== Aplikasi Kasir ===');
  while (true) {
    print('\n1. Tampilkan Produk');
    print('2. Tambah ke Keranjang');
    print('3. Lihat Keranjang');
    print('4. Proses Transaksi');
    print('5. Tampilkan Laporan Kasir');
    print('6. Keluar');
    stdout.write('Pilih menu: ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        print('\n=== Daftar Produk ===');
        for (var i = 0; i < daftarProduk.length; i++) {
          print(
              '${i + 1}. ${daftarProduk[i].nama} - Rp ${daftarProduk[i].harga} (Stok: ${daftarProduk[i].stok})');
        }
        break;
      case '2':
        print('\n=== Tambah ke Keranjang ===');
        for (var i = 0; i < daftarProduk.length; i++) {
          print('${i + 1}. ${daftarProduk[i].nama}');
        }
        stdout.write('Pilih produk (nomor): ');
        var index = int.parse(stdin.readLineSync()!) - 1;

        if (index >= 0 && index < daftarProduk.length) {
          stdout.write('Masukkan jumlah: ');
          var jumlah = int.parse(stdin.readLineSync()!);
          keranjang.tambahProduk(daftarProduk[index], jumlah);
        } else {
          print('Produk tidak valid.');
        }
        break;
      case '3':
        keranjang.tampilkanKeranjang();
        break;
      case '4':
        if (keranjang.daftarBelanja.isEmpty) {
          print('Keranjang masih kosong!');
        } else {
          var transaksi = Transaksi(keranjang.daftarBelanja);
          transaksi.cetakStruk();
          kasir.prosesTransaksi(transaksi);
          keranjang.daftarBelanja.clear();
        }
        break;
      case '5':
        kasir.tampilkanLaporan();
        break;
      case '6':
        print('Terima kasih telah menggunakan aplikasi kasir.');
        return;
      default:
        print('Pilihan tidak valid.');
        break;
    }
  }
}
