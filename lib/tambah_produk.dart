import 'package:flutter/material.dart';
import 'package:flutter_database/halaman_produk.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class TambahProduk  extends StatefulWidget {
  const TambahProduk ({super.key});

  @override
  State<TambahProduk > createState() => _TambahProduk ();
}

class _TambahProduk  extends State<TambahProduk > {
  final formKey =GlobalKey<FormState>();
  TextEditingController nama_produk = TextEditingController();
  TextEditingController harga_produk = TextEditingController();
  TextEditingController stok_produk = TextEditingController();
  TextEditingController warna_produk = TextEditingController();

  Future _simpan ()async{
     final respon = 
      await http.post(Uri.parse('http://192.168.1.6/api_produk/create.php'),
      body: {
        'nama_produk':nama_produk.text,
        'harga_produk':harga_produk.text,
        'stok_produk':stok_produk.text,
        'warna_produk':warna_produk.text,
      });
      if (respon.statusCode == 200) {
        return true;
      }
      return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Produk',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),),
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // FIELD NAMA PRODUK
              TextFormField(
                controller: nama_produk,
                decoration: InputDecoration(hintText: 'Nama Produk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Produk Tidak Boleh Kosong!!";
                  }
                  return null;
                }, 
              ),
              // FIELD HARGA PRODUK
              SizedBox(height: 10),
              TextFormField(
                controller: harga_produk,
                decoration: InputDecoration(hintText: 'Harga Produk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Harga Produk Tidak Boleh Kosong!!";
                  }
                  return null;
                },
              ),
              // FIELD STOK PRODUK
              SizedBox(height: 10),
              TextFormField(
                controller: stok_produk,
                decoration: InputDecoration(hintText: 'Stok Produk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Stok Produk Tidak Boleh Kosong!!";
                  }
                  return null;
                },
              ),
              // WARNA PRODUK
              SizedBox(height: 10),
              TextFormField(
                controller: warna_produk,
                decoration: InputDecoration(hintText: 'Warna Produk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Warna Produk Tidak Boleh Kosong!!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                onPressed:  (){
                if (formKey.currentState!.validate()) {
                  _simpan().then((value) {
                    if (value) {
                      final snackBar = SnackBar(content: const Text('DATA BERHASIL DISIMPAN'),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                       final snackBar = SnackBar(content: const Text('DATA GAGAL DISIMPAN'),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context)=>HalamanProduk())), 
                  (router) => false);
                }
              }, 
              child: Text('Simpan',
              style: GoogleFonts.cherryBombOne(
                color: Colors.white,
                fontSize: 20,
              ),))
            ],
          ),
        )),
    );
  }
}