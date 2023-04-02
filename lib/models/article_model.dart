import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt,
  });

  //TODO: grab real data from an API
  static List<Article> articles = [
    Article(
        id: "0",
        title: "Flutter",
        subtitle: "Wieso es super cool ist",
        body:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        author: "Flutter Nerd",
        authorImageUrl:
            "https://hamsteropedia.com/wp-content/uploads/2022/04/smart-hamster-wearing-glasses.jpg",
        category: "Politics",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5n9rFhWpL1Q7ApNEZiuSk3b6VCfYdPAI9PIOMfXgIkk8OAyhT7G2iXTCCf9WbAY4f8KM&usqp=CAU",
        views: 4,
        createdAt: DateTime.now().subtract(const Duration(hours: 5))),
    Article(
        id: "1",
        title: "Flutter",
        subtitle: "Wieso es super cool ist 2",
        body:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
        author: "Flutter Nerd",
        authorImageUrl:
            "https://hamsteropedia.com/wp-content/uploads/2022/04/smart-hamster-wearing-glasses.jpg",
        category: "Politics",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5n9rFhWpL1Q7ApNEZiuSk3b6VCfYdPAI9PIOMfXgIkk8OAyhT7G2iXTCCf9WbAY4f8KM&usqp=CAU",
        views: 4,
        createdAt: DateTime.now().subtract(const Duration(hours: 4))),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        authorImageUrl,
        category,
        imageUrl,
        views,
        createdAt,
      ];

  static fromJson(item) {}
}
