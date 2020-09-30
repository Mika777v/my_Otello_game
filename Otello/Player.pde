class Player {
  private String name;
  private int num;
  Player(String name, int n) {
    this.name=name;
    num=n;
  }
  int getNum() {
    return num;
  }
  String getName() {
    return name;
  }
  String toString() {
    return name+","+num;
  }
}
