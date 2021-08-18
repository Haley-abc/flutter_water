class RankingListModel{
  int userId;
  String name;
  String head;
  int waterConsumption;

  static RankingListModel formMap(Map<String, dynamic> map) {
    RankingListModel rankingListModel = RankingListModel();
    rankingListModel.userId = map['userId'];
    rankingListModel.name = map['name'];
    rankingListModel.head = map['head'];
    rankingListModel.waterConsumption = map['waterConsumption'];
    return rankingListModel;
  }

}
