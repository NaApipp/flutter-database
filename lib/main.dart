import 'package:flutter/material.dart';
// import 'package:flutter_database/halaman_produk.dart';
import 'package:flutter_database/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aplikasi Produk',
      home: Homepage(), 
    );
  }
}