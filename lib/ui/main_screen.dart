import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dekontaminasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/hoax');
                        },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.cancel_outlined, color: Colors.redAccent, size: 40,),
                                Text('Hoaxes', style: TextStyle(fontSize: 30),)
                              ],
                            ),
                          ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/hospital');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.local_hospital_outlined, color: Colors.redAccent, size: 40,),
                              Text('Hospitals', style: TextStyle(fontSize: 30),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/news');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.newspaper, color: Colors.redAccent, size: 40,),
                              Text('News', style: TextStyle(fontSize: 30),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 200,
                      child: ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context, '/stat');
                      },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.query_stats_outlined, color: Colors.redAccent, size: 40,),
                              Text('Stats', style: TextStyle(fontSize: 30),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
