class Bord{//マスを構成する
int bx, by;
int num_x,num_y;

  Bord(int x,int y){
    bx=x;
    by=y;
    //num_x=nx;
    //num_y=ny;
  }
  void show(){
    fill(0,255,0);
   rect(bx,by,40,40); 
  }
  int getX(){
  return bx;
  }
  int getY(){
    return by;
  }
  String toString(){
 return "(x="+bx+",y="+by+")";
}
}
