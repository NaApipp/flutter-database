import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProduk extends StatefulWidget {
  final Map ListData;
  DetailProduk({Key? key, required this.ListData}) : super(key: key);
  // const DetailProduk({super.key});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id_produk =  TextEditingController();
  TextEditingController nama_produk =  TextEditingController();
  TextEditingController harga_produk =  TextEditingController();
  TextEditingController stok_produk =  TextEditingController();
  TextEditingController warna_produk =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    id_produk.text = widget.ListData['id_produk'];
    nama_produk.text = widget.ListData['nama_produk'];
    harga_produk.text = widget.ListData['harga_produk'];
    stok_produk.text = widget.ListData['stok_produk'];
    warna_produk.text = widget.ListData['warna_produk'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),),
         backgroundColor: Colors.deepOrange,
      ),
      body: Padding(padding: const EdgeInsets.all(30),
      child: Card(
        elevation: 12,
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                  'Detail Produk ${widget.ListData['nama_produk']}',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            SizedBox(height: 20),
            ListTile(
              title: Text('ID Produk'),
              subtitle: Text(widget.ListData['id_produk']),
            ),
            ListTile(
              title: Text('Nama Produk'),
              subtitle: Text(widget.ListData['nama_produk']),
            ),
            ListTile(
              title: Text('Harga Produk'),
              subtitle: Text(widget.ListData['harga_produk']),
            ),
            ListTile(
              title: Text('Stok  Produk'),
              subtitle: Text(widget.ListData['stok_produk']),
            ),
            ListTile(
              title: Text('Warna Produk'),
              subtitle: Text(widget.ListData['warna_produk']),
            ),
          ]),
        ),
      ),
      ),
    );
  }
}