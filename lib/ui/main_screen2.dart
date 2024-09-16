import 'package:flutter/material.dart';
import 'package:timestamp_to_string/timestamp_to_string.dart';

import '../api/api_service.dart';
import '../model/hospital.dart';
import '../model/news.dart';
import 'news_detail.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {

  final Future<List<Hospitals>?> hospital = ApiService().getHospitals();
  final Future<List<News>?> news = ApiService().getNews();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dekontaminasi', style: TextStyle(color: Colors.white),),
            Icon(Icons.vertical_distribute, color: Colors.white,)
          ],
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 5.0),
            child: Text('Data Covid-19', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 250,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jakarta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          SizedBox(
                            height: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jakarta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          SizedBox(
                            height: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jakarta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          SizedBox(
                            height: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('100.000'),
                                    Text('Infected'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Rumah Sakit Rujukan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 125,
            child: FutureBuilder(
                future: hospital,
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
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
                            child: SizedBox(
                              width: 250,
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.medical_services_outlined, color: Colors.redAccent, size: 30,),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${snapshot.data?[index].name}',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,),
                                              Text('${snapshot.data?[index].region}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward_ios, size: 30,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data?.length,
                    );
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Berita', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          FutureBuilder(
            future: news,
            builder: (context,snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<News> news = snapshot.data as List<News>;
                return Expanded(
                  child: ListView.builder(itemBuilder: (BuildContext context, int index){
                    final newsItem = news[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => NewsDetail(newsItem : newsItem)
                          ));
                        },
                        child: ListTile(
                          title: Text(
                            '${snapshot.data?[index].title}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: TimestampToString.dddmmmddyyyy('${snapshot.data?[index].timestamp}'),
                          trailing: Icon(Icons.newspaper, color: Colors.redAccent,),
                        ),
                      ),
                    );
                  },
                    itemCount: snapshot.data?.length,),
                );
              }
            },

          ),
        ],
      ),
    );
  }
}
