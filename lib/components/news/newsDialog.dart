import 'package:flutter/material.dart';
import 'package:golf_app/api/requests/ressource.dart';
import 'package:golf_app/components/news/newsCard.dart';
import 'package:golf_app/models/interfaces/news.dart';

class NewsDialog extends StatefulWidget {
  @override
  _NewsDialogState createState() => _NewsDialogState();
}

class _NewsDialogState extends State<NewsDialog> {
  List<News> listOfNews = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Ressource.getInstance().fetchNews().then((value) {
      setState(() {
        listOfNews = value;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Actualités",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            child: SizedBox(
                              width: 32,
                              height: 32,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
              Expanded(
                child: (loading)
                    ? Center(
                        child: SizedBox(
                          child: CircularProgressIndicator(),
                          width: 32,
                          height: 32,
                        ),
                      )
                    : ListView.builder(
                        itemCount: listOfNews.length,
                        itemBuilder: (context, index) => NewsCard(
                          news: listOfNews[index],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
