class Produk {
  String nama;
  double harga;
  int stok;

  Produk(this.nama, this.harga, this.stok);

  void tampilkanInfo() {
    print('\nProduk: $nama');
    print('Harga: Rp ${harga.toStringAsFixed(2)}');
    print('Stok: $stok');
  }
}
