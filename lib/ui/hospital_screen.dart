import 'package:api_covid/api/api_service.dart';
import 'package:api_covid/model/hospital.dart';
import 'package:flutter/material.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    final Future<List<Hospitals>?> hospital = ApiService().getHospitals();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hospitals',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: FutureBuilder(
          future: hospital,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: Text('${snapshot.data?[index].name}'),
                                content: SizedBox(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Alamat : ${snapshot.data?[index].address}'),
                                      Text('Daerah: ${snapshot.data?[index].region}'),
                                      Text('Telp: ${snapshot.data?[index].phone}'),
                                      Text('Provinsi: ${snapshot.data?[index].province}'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('CLOSE'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Your action here
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: ListTile(
                        title: Text(
                          '${snapshot.data?[index].name}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '${snapshot.data?[index].address}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        trailing: Icon(
                          Icons.medical_services_outlined,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data?.length,
              );
            }
          },
        ),
      ),
    );
  }
}
