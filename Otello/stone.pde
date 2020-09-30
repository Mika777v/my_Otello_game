class Stone {
  int sx, sy;
  int Color;
  Player p;
  Stone(int x, int y, Player p) {
    sx=x;
    sy=y;
    this.p=p;
    if (p.getNum()==1)Color=0;
    else if (p.getNum()==2)Color=255;
    else Color=100;
  }

  void show() {
    if (Color!=100) {
      fill(Color);
      ellipse(sx, sy, 20, 20);
    }
  }
  
  int getColor() {
    return Color;
  }
  String toString(){
 return p.name+","+p.getNum();
}
}
