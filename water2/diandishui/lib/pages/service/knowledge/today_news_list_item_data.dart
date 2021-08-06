class TodayNewsListItemData {
  String ctime;
  String title;
  String description;
  String source;
  String picUrl;
  String url;

  TodayNewsListItemData(
    this.ctime,
    this.title,
    this.description,
    this.source,
    this.picUrl,
    this.url,
  );

  static TodayNewsListItemData fromMap(Map<String, dynamic> map) {
    return TodayNewsListItemData(
      map['ctime'].toString().substring(0, 10),
      map['title'],
      map['description'],
      map['source'],
      map['picUrl'],
      map['url'],
    );
  }
}
