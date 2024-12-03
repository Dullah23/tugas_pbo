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
    print('5. Tambah Produk Baru');
    print('6. Hapus Produk');
    print('7. Tampilkan Laporan Kasir');
    print('8. Keluar');
    stdout.write('Pilih menu: ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1': // Tampilkan Produk
        print('\n=== Daftar Produk ===');
        for (var i = 0; i < daftarProduk.length; i++) {
          print(
              '${i + 1}. ${daftarProduk[i].nama} - Rp ${daftarProduk[i].harga} (Stok: ${daftarProduk[i].stok})');
        }
        break;
      case '2': // Tambah ke Keranjang
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
      case '3': // Lihat Keranjang
        keranjang.tampilkanKeranjang();
        break;
      case '4': // Proses Transaksi
        if (keranjang.daftarBelanja.isEmpty) {
          print('Keranjang masih kosong!');
        } else {
          var transaksi = Transaksi(keranjang.daftarBelanja);
          transaksi.cetakStruk();
          kasir.prosesTransaksi(transaksi);
          keranjang.daftarBelanja.clear();
        }
        break;
      case '5': // Tambah Produk Baru
        print('\n=== Tambah Produk Baru ===');
        stdout.write('Masukkan nama produk: ');
        var nama = stdin.readLineSync()!;
        stdout.write('Masukkan harga produk: ');
        var harga = double.parse(stdin.readLineSync()!);
        stdout.write('Masukkan stok produk: ');
        var stok = int.parse(stdin.readLineSync()!);

        var produkBaru = Produk(nama, harga, stok);
        daftarProduk.add(produkBaru);

        print('Produk "$nama" berhasil ditambahkan.');
        break;
      case '6': // Hapus Produk
        print('\n=== Hapus Produk ===');
        for (var i = 0; i < daftarProduk.length; i++) {
          print('${i + 1}. ${daftarProduk[i].nama}');
        }
        stdout.write('Pilih produk yang ingin dihapus (nomor): ');
        var index = int.parse(stdin.readLineSync()!) - 1;

        if (index >= 0 && index < daftarProduk.length) {
          var produkDihapus = daftarProduk[index];
          daftarProduk.removeAt(index);
          print('Produk "${produkDihapus.nama}" berhasil dihapus.');
        } else {
          print('Produk tidak valid.');
        }
        break;
      case '7': // Tampilkan Laporan Kasir
        kasir.tampilkanLaporan();
        break;
      case '8': // Keluar
        print('Terima kasih telah menggunakan aplikasi kasir.');
        return;
      default:
        print('Pilihan tidak valid.');
        break;
    }
  }
}
