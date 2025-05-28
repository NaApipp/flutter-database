import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_database/halaman_produk.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            children: [
              Image.asset('asset/images/logo.png',
              height: 40,),
              SizedBox(width: 20), //Jarak tengah antara logo dan text
              Text('Home Page',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: Colors.black,
        ),),
            ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/images/market.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alignment Vertikal
            crossAxisAlignment: CrossAxisAlignment.center,  // Alignment Horizontal
            mainAxisSize: MainAxisSize.min,
          children: [
            Text("Storage.com",
            style: GoogleFonts.bagelFatOne(
              fontSize: 100,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),), //Style Text(Storage.Com)
            SizedBox(height: 20), //beri jarak antar paragraf agar rapi
            Text("'Providing Logistics Storage For All Over The World'", 
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white, 
            ),), //Style Text(Tagline)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HalamanProduk(),
            ),
          );
        },
        icon: const Icon(Icons.warehouse_rounded,
        color: Colors.black,
        size: 20.0,
        ),
        tooltip: 'Lihat Gudang Produk Disini',
        label: const Text('Lihat Gudang',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}