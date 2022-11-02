import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _jk = "";

  TextEditingController controllerNPM = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();


  List<String> jurusan = ["Sistem Informasi", "Teknologi Informasi", "Informatika", "Teknik Industri",
    "Akuntansi", "Manajemen", "Hukum", "Psikologi"];
  String _jurusan = "Sistem Informasi";

  void kirimdata() {
    AlertDialog alertDialog = AlertDialog(
        content: Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              Text("NPM : ${controllerNPM.text}"),
              Text("Nama Lengkap : ${controllerNama.text}"),
              Text("Jenis Kelamin : ${_jk}"),
              Text("Jurusan : ${_jurusan}"),
              Text("Alamat : ${controllerAlamat.text}"),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
            ],
          ),
        )
    );

    showDialog(context: context, builder: (context) => AlertDialog(content: alertDialog));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0)),
            TextField(
                controller: controllerNPM,
                decoration: InputDecoration(
                    hintText: "NPM",
                    labelText: "NPM",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                )
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            TextField(
                controller: controllerNama,
                decoration: InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                )
            ),
            Padding(padding: EdgeInsets.only(top: 20.0),),
            RadioListTile(
              value: "Laki-laki",
              title: Text("Laki-laki"),
              groupValue: _jk,
              onChanged: (String? newValue) {
                setState(() {
                  _jk = newValue!;
                });
              },
              activeColor: Colors.teal,
            ),
            RadioListTile(
              value: "Perempuan",
              title: Text("Perempuan"),
              groupValue: _jk,
              onChanged: (String? newValue) {
                setState(() {
                  _jk = newValue!;
                });
              },
              activeColor: Colors.teal,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
                children: <Widget> [
                  Text("Pilih jurusan : ", style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  DropdownButton(
                      hint: Text("Pilih jurusan: "),
                      dropdownColor: Colors.teal,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                      ),
                      items: jurusan.map((valueItem) {
                        return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem));
                      }).toList(),
                      value: _jurusan,
                      onChanged: (newValue) {
                        setState(() {
                          _jurusan = newValue!;
                        });
                      }),
                ]
            ),

            Padding(padding: EdgeInsets.only(top: 20.0)),
            TextField(
                controller: controllerAlamat,
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: "Alamat",
                    labelText: "Alamat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                )
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            ElevatedButton(
                onPressed: () { kirimdata(); },
                child: const Text("Kirim"))
          ],
        ),
      ),
    );
  }
}