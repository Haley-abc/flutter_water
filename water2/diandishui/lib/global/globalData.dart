import 'package:diandishui/utils/storage_util.dart';

class GlobalData{

  static int id = -1;
  static String name = 'haha';
  static String phone = '';
  static String sex = '';
  static String head = '';

  static initData(int id,String name,String phone,String sex,String head){
    GlobalData.id = id;
    GlobalData.name = name;
    GlobalData.phone = phone;
    GlobalData.sex = sex;
    GlobalData.head = head;
  }
}