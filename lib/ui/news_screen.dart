import 'package:api_covid/api/api_service.dart';
import 'package:api_covid/model/news.dart';
import 'package:api_covid/ui/news_detail.dart';
import 'package:flutter/material.dart';
import 'package:timestamp_to_string/timestamp_to_string.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final Future<List<News>?> news = ApiService().getNews();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
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
      ),
    );
  }
}
