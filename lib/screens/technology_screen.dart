import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/screen_arguments_model.dart';
import '../repository/news_api.dart';
import '../view_model/article_view_model.dart';
import '../view_model/articles_view_model.dart';
import 'article_details_screen.dart';

import '../models/fav_list.dart';
import 'fakenews_screen.dart';

List<Color> col = [
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
  Colors.grey,
];

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({super.key});

  @override
  State<TechnologyScreen> createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
  var articlesListViewModel = ArticlesListViewModel(classRepository: NewsApi());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleViewModel>>(
      future: articlesListViewModel.fetchNewsTechnology(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          var news = snapshot.data;
          return Scaffold(
            body: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailsScreen(
                          title: news[index]!.title,
                          author: news[index]!.author,
                          publishedAt: news[index]!.publishedAt,
                          description: news[index]!.description,
                          content: news[index]!.content,
                          urlToImage: news[index]!.urlToImage,
                          url: news[index]!.url,
                        ),
                      ),
                    );
                  }),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(35.0),
                            topRight: Radius.circular(35.0),
                            bottomLeft: Radius.circular(35.0),
                            bottomRight: Radius.circular(35.0),
                          ),
                          child: Image.network(
                            news[index]!.urlToImage,
                            fit: BoxFit.cover,
                            height: 400.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 350.0, 0.0, 0),
                        child: SizedBox(
                          height: 200.0,
                          width: 300.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(35.0),
                            elevation: 10.0,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Text(
                                    news[index].title,
                                    maxLines: 3,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(35, 20, 10, 20),
                                      child: IconButton(
                                          iconSize: 25,
                                          icon: Icon(Icons.favorite),
                                          color: col[index],
                                          onPressed: () {
                                            setState(() {
                                              if(col[index] == Colors.grey){
                                                col[index] = Colors.red;if (FavList.title.contains(
                                                    news[index].title) ==
                                                    false) {
                                                  FavList.title
                                                      .add(news[index].title);
                                                  FavList.description
                                                      .add(news[index].description);
                                                  FavList.author
                                                      .add(news[index].author);
                                                  FavList.publishedAt
                                                      .add(news[index].publishedAt);
                                                  FavList.content
                                                      .add(news[index].content);
                                                  FavList.urlToImage
                                                      .add(news[index].urlToImage);
                                                  FavList.url.add(news[index].url);
                                                }
                                              }else{
                                                col[index] = Colors.grey;FavList.title
                                                    .remove(news[index].title);
                                                FavList.description
                                                    .remove(news[index].description);
                                                FavList.author
                                                    .remove(news[index].author);
                                                FavList.publishedAt
                                                    .remove(news[index].publishedAt);
                                                FavList.content
                                                    .remove(news[index].content);
                                                FavList.urlToImage
                                                    .remove(news[index].urlToImage);
                                                FavList.url.remove(news[index].url);
                                              }
                                            });
                                          }),
                                    ),
                                    Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(135, 20, 10, 20),
                                        child: IconButton(
                                          iconSize: 25,
                                          icon: Icon(Icons.cancel),
                                          color: Colors.grey,
                                          onPressed: () {
                                            ScreenArguments arg = ScreenArguments(news[index].title);
                                            Navigator.pushNamed(context, FakenewsScreen.routeName, arguments: arg);
                                          },
                                        )
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: news == null ? 0 : news!.length,
              viewportFraction: 0.7,
              scale: 0.9,
              autoplay: true,
            ),
          );
        }
      },
    );
  }
}
