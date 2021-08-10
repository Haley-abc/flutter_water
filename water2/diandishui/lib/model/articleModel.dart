class ArticleModel{
  int id;
  int userId;
  String name;
  String head;
  String content;
  String articleDate;
  String image;

  static ArticleModel formMap(Map<String, dynamic> map) {
    ArticleModel articleModel = ArticleModel();
    articleModel.id = map['id'];
    articleModel.userId = map['userId'];
    articleModel.name = map['name'];
    articleModel.head = map['head'];
    articleModel.content = map['content'];
    articleModel.articleDate = map['articleDate'].toString().substring(0,16);
    articleModel.image = map['image'];
    return articleModel;
  }
}