import 'package:flutter/material.dart';
import '/main.dart';

void main() {
  runApp(const MyFormPage());
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() =>
    _MyFormPageState();
    }
      class _MyFormPageState extends State<MyFormPage>  
    {
      @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Flutter Demo Home Page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String _namaLengkap = "";

  bool jenjangSarjana = false;
  bool jenjangDiploma = false;
  bool jenjangMagister = false;
  bool jenjangDoktor = false;

  double umur = 0;

  String kelasPBP = 'A';
  List<String> listKelasPBP = ['A', 'B', 'C', 'D',
    'E', 'F', 'KI'];

  bool _nilaiSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(        
        child: Column(          
          children: [
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(  
              title: const Text('Counter'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              }, 
            ),
            ),
            ListTile(
              
              title: const Text('Form'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Pak Dengklek",
                      labelText: "Nama Lengkap",
                      icon: const Icon(Icons.people),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _namaLengkap = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _namaLengkap = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Lengkap Tidak Boleh Kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.school),
                  title: Text("Jenjang"),
                ),
                CheckboxListTile(
                  title: const Text('Sarjana'),
                  value: jenjangSarjana,
                  onChanged: (bool? value) {
                    setState(() {
                      jenjangSarjana = value!;
                      if (value) {
                        jenjangMagister = jenjangDiploma = jenjangDoktor = false;
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Diploma'),
                  value: jenjangDiploma,
                  onChanged: (bool? value) {
                    setState(() {
                      jenjangDiploma = value!;
                      if (value) {
                        jenjangMagister = jenjangSarjana = jenjangDoktor = false;
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Magister'),
                  value: jenjangMagister,
                  onChanged: (bool? value) {
                    setState(() {
                      jenjangMagister = value!;
                      if (value) {
                        jenjangDiploma = jenjangSarjana = jenjangDoktor = false;
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Doktor'),
                  value: jenjangDoktor,
                  onChanged: (bool? value) {
                    setState(() {
                      jenjangDoktor = value!;
                      if (value) {
                        jenjangMagister = jenjangSarjana = jenjangDiploma = false;
                        }
                      });
                    },
                  ),
                  ListTile(
 leading: const
Icon(Icons.co_present),
 title: Row(
 children: [
 Text('Umur: ${umur.round()}'),
 ],
 ),
 subtitle: Slider(
 value: umur,
 max: 100,
 divisions: 100,
 label: umur.round().toString(),
 onChanged: (double value) {
 setState(() {
 umur = value;
 });
 },
 ),
                  ),
ListTile(
 leading: const Icon(Icons.class_),
 title: const Text(
 'Kelas PBP',
 ),
 trailing: DropdownButton(
 value: kelasPBP,
 icon: const
Icon(Icons.keyboard_arrow_down),
 items: listKelasPBP.map((String
items) {
 return DropdownMenuItem(
 value: items,
child: Text(items),
 );
 }).toList(),
 onChanged: (String? newValue) {
 setState(() {
 kelasPBP = newValue!;
 });
 },
 ),
 ),
 Padding(
  padding: const EdgeInsets.all(0.80),
  child: SwitchListTile(
 title: const Text('Practice Mode'),
 value: _nilaiSwitch,
 onChanged: (bool value) {
 setState(() {
_nilaiSwitch = value;
 });
 },
 secondary: const
Icon(Icons.run_circle_outlined),
 ),
),
TextButton(
 style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.blue),
  alignment: Alignment.centerRight,
 ),
 onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          child: Container(
            child: ListView(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              shrinkWrap: true,
              children: <Widget>[
                const Center(child: Text('Informasi Data')),
                const SizedBox(height: 20),
                // TODO: Implement logic to display information from the form
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
},

 child: const Align(
  alignment: Alignment.center,
  child: Text("Simpan",
 style: TextStyle(color: Colors.white),
 ),
 ),
),
                ], 
                              
              ),
                           
            ),
          ) ,
        ),
      );
    }
}