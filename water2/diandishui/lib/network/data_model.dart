class LoginInterface {
  String code;
  String msg;

  // String data;

  // Person(this.code, this.msg, this.data);

  LoginInterface.fromMap(Map<String, Object> json) {
    this.code = json['code'];
    this.msg = json['message'];
    // this.data = json['data'];
  }
}
