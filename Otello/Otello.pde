import java.util.LinkedList;
ArrayList<Bord> bord;
ArrayList<Stone> st;
ArrayList<Player> p;
int M=40;
int st_size=20;
int turn=0;
void setup() {
  size(400, 400);
  int x, y;

  x=y=40;
  bord=new ArrayList<Bord>();
  st=new ArrayList<Stone>();
  p=new ArrayList<Player>();
  p.add(new Player("null", 0));
  p.add(new Player("Player1", 1));
  p.add(new Player("Player2", 2));
  for (int t=0; t<8; t++) {//ここで8*8を作るt=縦 t*i行列
    for (int i=0; i<8; i++) {//i=横
      st.add(new Stone(x+M*i+st_size, x+M*t+st_size, p.get(0)));
      bord.add(new Bord(x+M*i, y+M*t));
      if ((i==3&&t==4)||(t==3&&i==4))
        st.set(i+t*8, new Stone(x+M*i+st_size, x+M*t+st_size, p.get(1)));
      if ((t==3&&i==3)||(i==4&&t==4))
        st.set(i+t*8, new Stone(x+M*i+st_size, x+M*t+st_size, p.get(2)));
    }
  }
  p.remove(0);


  //  println(bord);
}
void draw() {

  for (Bord B : bord) {//表示する
    B.show();
    //  println(B);
  }
  for (Stone s : st) {
    s.show();
  }
}
void mouseClicked() {
  int bx, by;
  int st_xy=0;
  System sy;

  for (Bord B : bord) {
    bx=B.getX();
    by=B.getY();
    if (bx<mouseX&&mouseX<bx+M) {
      if (by<mouseY&&mouseY<by+M) {
        println(st.get(st_xy), st_xy);

        if (st.get(st_xy).getColor()==100) {

          if (serch(st_xy, turn%2)) {
            st.set( st_xy, new Stone(bx+st_size, by+st_size, p.get(turn%2)));
            println(st_xy);
            //  println(p.get(turn%2));

            turn++;
          }
        }
      }
    }
    st_xy++;
  }
}

boolean serch(int x, int t) {
  int dx, dy;
  int x0, y0;
  int x1, y1;
  int xy0, xy1;
  int c0;//渡されたプレイヤー番号を格納
  int c1;//探索するところのプレイヤー番号を格納
  boolean sw=false;
  int MAX=64;
  int MIN=-1;

  x0=y0=x1=y1=xy0=xy1=0;
  dx=x%8;//横の成分(行)
  dy=x/8;//縦の成分(列)
  // c0=st.get(x).getColor();
  //if (c0!=100)return false;
  c0=p.get(t).getNum();
  println("c0=", c0);

  /*以下、左右の判定をする*/
  for (int i=1; i+dx<8; i++) {//右の場外手前まで探索
    c1=st.get(x+i).p.getNum();
    //  println("c1=", c1);確認用
    if (c0==c1)sw=true;
    if ((c0==c1||c1==0))break;//同色または石がないとき終了
    else x0++;
  }//右横の石が反転可能かを調べる
  if (!sw) {
    //  print("wwwwww");
    x0=0;
    sw=false;
  }
  for (int i=1; i-dx<0; i++) {//left    
    c1=st.get(x-i).p.getNum();
    //println("c1=", c1);
    if (c0==c1)sw=true;
    if ((c0==c1||c1==0))break;//同色または石がないとき終了
    else x1++;
  }//左横の石が反転可能かを調べる
  if (!sw) {
    x1=0;
    sw=false;
  }

  /*以下、上下の判定をする*/
  for (int i=1; i+dy<8; i++) {//up
    c1=st.get(x+i*8).p.getNum();
    //  println("c1=", c1);確認用
    if (c0==c1)sw=true;
    if ((c0==c1||c1==0))break;//同色または石がないとき終了
    else y0++;
  }//上の石が反転可能かを調べる
  if (!sw) {
    y0=0;
    sw=false;
  }
  for (int i=1; i-dy<0; i++) {//down
    c1=st.get(x-i*8).p.getNum();
    //println("c1=", c1);
    if (c0==c1)sw=true;
    if ((c0==c1||c1==0))break;//同色または石がないとき終了
    else y1++;
  }//下の石が反転可能かを調べる
  if (!sw) {
    y1=0;
    sw=false;
  }

  /*↗を調べる*/
  for (int i=1; (i+dx<8)&&(i+dy<8); i++) {
    c1=st.get(x+i*9).p.getNum();
    //  println("c1=", c1);確認用
    if (c0==c1)sw=true;
    if ((c0==c1||c1==0))break;//同色あるまたは石がないとき終了
    else xy0++;
  }//右横の石が反転可能かを調べる
  if (!sw) {
    xy0=0;
    sw=false;
  }
  for (int i=1; (i-dx<0)&&(i-dy<0); i++) {
    c1=st.get(x-i*9).p.getNum();
    //println("c1=", c1);
    if (c0==c1)sw=true;
    if ((c0==c1||c1==0))break;//同色または石がないとき終了
    else xy1++;
  }
  if (!sw) {
    xy1=0;
    sw=false;
  }
  /*石変換*/

  for (int i=1; i<x0; i++) {
   //  st.set( x, new Stone(bx+st_size, by+st_size, p.get(t)));
  }

  /*今日の終わり
   x0~で異色石カウントしてるからserchで
   石反転できるのでは
   クラス化可能そう？
   とりあえず書く
   
   予定：順番表示*/
  println(x0, x1, y0, y1, xy0, xy1);
  if (x0==0&&x1==0&&y0==0&&y1==0&&xy0==0&&xy1==0)
    return false;
  else return true;
}
