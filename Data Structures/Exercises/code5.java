class Rectangle {

  Point supdir= new Point();
  Point infesq= new Point();


  Rectangle (int x1, int y1, int x2, int y2){
    infesq= new Point (x1,y1);
    supdir= new Point (x2,y2);
    }

  Rectangle (Point p1, Point p2){
    infesq= p1;
    supdir= p2;

  }
  int area (){
    int r= (supdir.y-infesq.y)*(supdir.x-infesq.x);
    return r;
  }

  int perimeter (){
    int p= (supdir.y-infesq.y)*2 + (supdir.x-infesq.x)*2;
    return p;
  }

  boolean pointInside (Point p){
    if ((p.x >= infesq.x && p.x <= supdir.x) && (p.y >= infesq.y && p.y <= supdir.y))
    return true;
    else return false;
  }

  boolean rectangleInside (Rectangle r){
    if (pointInside (r.supdir) && pointInside (r.infesq))
    return true;
    else return false;

  }
}
