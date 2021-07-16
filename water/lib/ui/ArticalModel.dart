import 'package:water/ui/UserModel.dart';

class ArticleModel{
  late String content;
  late String atricleDate;
  late UserModel userModel;

  static ArticleModel formMap(Map<String,dynamic> map){
    ArticleModel article = ArticleModel();
    article.content = map['content'];
    article.atricleDate = map['atricleDate'];
    article.userModel = UserModel.formMap(map['userEntity']);
    return article;
  }
}