import 'package:api_covid/api/api_service.dart';
import 'package:api_covid/model/stats.dart';
import 'package:flutter/material.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  @override
  Widget build(BuildContext context) {

    final Future<List<Stats>?> stats = ApiService().getStats();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hoaxes',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Indonesia', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            FutureBuilder(
              future: stats,
              builder: (context,snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(itemBuilder: (BuildContext context, int index){
                    
                  },
                    itemCount: snapshot.data?.length,);
                }
              },

            ),
          ],
        ),
      ),
    );
  }
}
