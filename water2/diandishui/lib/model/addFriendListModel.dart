class AddFriendListModel{
  int id;
  String name;
  String head;
  int state;

  static AddFriendListModel formMap(Map<String, dynamic> map) {
    AddFriendListModel addFriendListModel = AddFriendListModel();
    addFriendListModel.id = map['id'];
    addFriendListModel.name = map['name'];
    addFriendListModel.head = map['head'];
    addFriendListModel.state = map['state'];
    return addFriendListModel;
  }

  setAll(int id,String name,String head){
    this.id = id;
    this.name = name;
    this.head = head;
    this.state = state;
  }

}
