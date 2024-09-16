import 'package:api_covid/api/api_service.dart';
import 'package:api_covid/model/hoaxes.dart';
import 'package:api_covid/ui/hoax_detail.dart';
import 'package:flutter/material.dart';

class HoaxScreen extends StatefulWidget {
  const HoaxScreen({super.key});

  @override
  State<HoaxScreen> createState() => _HoaxScreenState();
}

class _HoaxScreenState extends State<HoaxScreen> {

  final Future<List<Hoaxes>?> hoaxes =ApiService().getHoaxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoaxes', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: FutureBuilder(
          future: hoaxes,
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Hoaxes> hoax = snapshot.data as List<Hoaxes>;
              return ListView.builder(itemBuilder: (BuildContext context, index){
                final hoaxItem = hoax[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => HoaxDetail(hoaxItem : hoaxItem),
                      ));
                    },
                    child: ListTile(
                      title: Text(
                        '${snapshot.data?[index].title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.length,);
            }
          },
        ),
      ),
    );
  }
}
