class UserModel{
  late String sex;
  late String name;
  late String head;

  static UserModel formMap(Map<String,dynamic> map){
    UserModel area = UserModel();
    area.sex = map['sex'];
    area.name = map['name'];
    if(map['sex']=='女'){
      area.head='assets/icon/girl.png';
    }else{
      area.head='assets/icon/boy.png';
    }
    return area;
  }
}