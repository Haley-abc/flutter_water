class FriendListModel{
  int id;
  String name;
  String head;

  static FriendListModel formMap(Map<String, dynamic> map) {
    FriendListModel friendListModel = FriendListModel();
    friendListModel.id = map['id'];
    friendListModel.name = map['name'];
    friendListModel.head = map['head'];
    return friendListModel;
  }
}
