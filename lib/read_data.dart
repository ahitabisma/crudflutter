import 'package:flutter/material.dart';

class ReadData extends StatelessWidget {
  final String id;
  final String nama;
  final String jurusan;

  const ReadData(
      {Key? key, required this.id, required this.nama, required this.jurusan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lihat Data"),
      ),
      body: ListView(
        children: [
          Text(id),
          Text(nama),
          Text(jurusan),
        ],
      ),
    );
  }
}
