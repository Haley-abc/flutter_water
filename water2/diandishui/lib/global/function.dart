class GlobalFunction{
  /**
   * 获取当前时间
   */
  static String currentTimeMillis() {
    DateTime dateTime = DateTime.now();
    String time = dateTime.toString().substring(0, 19);
    return time;
  }
}