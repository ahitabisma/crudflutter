import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_1/list_data.dart';

class EditData extends StatefulWidget {
  final String id;
  final String nama;
  final String jurusan;

  const EditData(
      {Key? key, required this.id, required this.nama, required this.jurusan})
      : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final namaController = TextEditingController();
  final jurusanController = TextEditingController();

  Future<void> editData(String id) async {
    String url = Platform.isAndroid
        ? 'http://10.100.0.144/api/index.php'
        : 'http://localhost/api/index.php';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonBody =
        '{"id": ${widget.id},"nama": "${namaController.value}", "jurusan": "${jurusanController.value}", "}';
    var response =
        await http.put(Uri.parse(url), body: jsonBody, headers: headers);
    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ListData()));
    } else {
      print('Error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namaController.value = TextEditingValue(text: widget.nama);
    jurusanController.value = TextEditingValue(text: widget.jurusan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: namaController,
            decoration: const InputDecoration(
              hintText: 'Nama Mahasiswa',
            ),
          ),
          TextField(
            controller: jurusanController,
            decoration: const InputDecoration(
              hintText: 'Jurusan',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                editData(widget.id);
              },
              child: Text("Edit")),
        ],
      ),
    );
  }
}
