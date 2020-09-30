
 

/*class System {
 int x;
 int c0;
 int c1;
 int MAX=64;
 int MIN=-1;
 ArrayList<Integer>serch_num=new ArrayList<Integer>();
 Stone[]s;
 System(Stone[] s, int x) {
 this.x=x;
 this.s=s;
 }
 public boolean serch() {
 int dx, dy;
 int x0, y0;
 int x1, y1;
 x0=y0=x1=y1=0;
 dx=x%8;
 dy=x/8;
 c0=s[x].p.getNum();
 for (int i=0; i+dx<8; i++) {
 c1=s[x+i].p.getNum();
 if ((c0==c1||c1==100))break;
 else x0++;
 }//横の石が反転可能かを調べる
 for (int i=0; i+dx>=0; i--) {
 c1=s[x+i].p.getNum();
 if ((c0==c1||c1==100))break;
 else x0++;
 } 
 for (int i=0; i+dy<8; i++) {
 c1=s[x+i*8].p.getNum();
 if ((c0==c1||c1==100))break;
 else y0++;
 }
 for (int i=0; i+dy>=0; i--) {
 c1=s[x+i*8].p.getNum();
 if ((c0==c1||c1==100))break;
 else y0++;
 }
 for (int i=0; x+i*9<MAX; i++) {
 c1=s[x+i*9].p.getNum();
 if ((c0==c1||c1==100))break;
 else x1++;
 }
 for (int i=0; x+i*9>MIN; i--) {
 c1=s[x+i*9].p.getNum();
 if ((c0==c1||c1==100))break;
 else x1++;
 }
 for (int i=0; x+i*7<MAX; i++) {
 c1=s[x+i*7].p.getNum();
 if ((c0==c1||c1==100))break;
 else x1++;
 }
 for (int i=0; x+i*7>MIN; i--) {
 c1=s[x+i*7].p.getNum();
 if ((c0==c1||c1==100))break;
 else x1++;
 }
 if (x0==0&&x1==0&&y0==0&&y1==0)
 return false;
 else return true;
 }
 }*/
