class Mapa{
  private ArrayList<Linea> mapa = new ArrayList();
  Linea linea;
  public Mapa(){}
 
  public void iniciarTrazado(int x, int y, PVector col, int grosor)
  {
    linea = new Linea(col, grosor);
    linea.addPunto(x, y);
  }
  
  public void continuarTrazado(int x, int y)
  {
    linea.addPunto(x, y);
  }
  
  public void finalizarTrazado(int x, int y)
  {
    linea.addPunto(x, y);
    if(linea.getSize() > 0)
    {
      mapa.add(linea);
    }
  }
  
  public void atras()
  {
    if(mapa.size()>1)
    {
      limpiarPantalla();
      mapa.remove(mapa.size()-1);
    }
    else
    {
      mapa = new ArrayList();
      limpiarPantalla();
    }
  }
  
  public void Draw()
  {
    for(int i = 0; i < mapa.size(); ++i)
    {
      linea.Draw();
    }
  }
  
  public void limpiarPantalla()
  {
    fill(255,255,255);
    noStroke();
    rect(0, 0 , width, height/2-10);
  }
  
  public void renovarMapa()
  {
    mapa = new ArrayList();
  }
}

class Linea{
 private ArrayList<Punto> puntos = new ArrayList();
 private PVector col;
 private int grosor;
 
 public Linea(PVector col, int grosor)
 {
   this.col = col;
   this.grosor = grosor;
 }
 
 public void addPunto(int x, int y)
 { 
   if(y < height/2 - 15 && y < height/2 - 15 && y >= 0 && x >= 0)
    {
      Punto punto = new Punto(x, y);
      puntos.add(punto);
    }
 }
 
 public int getSize()
 {
   return puntos.size();
 }
 
 public void Draw()
 {
   strokeWeight(grosor);
   stroke(col.x, col.y, col.z);
   beginShape();
   noFill();
   for(int i = 0; i < puntos.size(); i++)
   {
     curveVertex(puntos.get(i).getX(), puntos.get(i).getY());
   }
   endShape();
 }
}

class Punto{
  private int x;
  private int y;
  
  public Punto(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  public int getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
}
