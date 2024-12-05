import 'package:flutter/material.dart';
import 'package:wisata_mobile_7/models/makanan_model.dart';
import 'package:wisata_mobile_7/sevices/makanan_service.dart';
import 'package:wisata_mobile_7/widgets/makanan_card.dart';

class Pertemuan9APIScreen extends StatelessWidget {
  final MakananService _makananService = MakananService();
  Pertemuan9APIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Daftar Makanan Seafood',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<MakananModel>>(
          future: MakananService().fetchMakanan(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error}'),
              );
            } else {
              final daftarSeafood = snapshot.data!;
              return ListView.builder(
                itemCount: daftarSeafood.length,
                itemBuilder: (context, index) {
                  return MakananCard(makananModel: daftarSeafood[index]);
                },
              );
            }
          }),
    );
  }
}
