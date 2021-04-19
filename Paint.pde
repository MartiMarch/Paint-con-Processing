ArrayList<Button> botones;
ArrayList<PVector> colores;
int undoCounter = -1;
int separacionEntreBotones = 5, separacionEntreBotonesColor = 2, altoboton, altobotoncolor = 120, strokeWidth = 3;
PVector lineStart, lineEnd, colorActual;
Mapa mapa = new Mapa();

public void settings(){
  System.setProperty("jogl.disable.openglcore", "true");
  size(800, 800);
  //fullScreen(PR3);
}

void setup(){
  colorActual = new PVector();
  botones = new ArrayList<Button>();
  background(255,255,255); 
  colores = new ArrayList<PVector>();
  colores.add(new PVector(22, 160, 133));
  colores.add(new PVector(26, 188, 156));
  colores.add(new PVector(39, 174, 96));
  colores.add(new PVector(46, 204, 113));
  colores.add(new PVector(41, 128, 185));
  colores.add(new PVector(52, 152, 219));
  colores.add(new PVector(142, 68, 173));
  colores.add(new PVector(155, 89, 183));
  colores.add(new PVector(44, 62, 80));
  colores.add(new PVector(241, 196, 15));
  colores.add(new PVector(230, 126, 34));
  colores.add(new PVector(231, 76, 60));
  colores.add(new PVector(236, 240, 241));

  String[] textos = {"Atras", "Limpiar", "Guardar", "Enviar", "Salir"};
  altoboton = (height / 2 / 6);
  for(int i = 0; i < 5; ++i)
  {
    botones.add(new Button(width / 2 - 10, altoboton, new PVector(width / 2 + 5, height / 2 + (separacionEntreBotones + altoboton) * i), textos[i], ceil(altoboton * 0.4), textos[i]));
  }
  
  int k = 0;
  altobotoncolor = (height / 2 / 5);
  line(0, height/2-5, width, height/2-5);
  for(int i = 0; i < 4; ++i)
  {
    for(int j = 0; j < 3; j++)
    {
      Button boton = new Button((width/2) / 4 - 10, altobotoncolor, new PVector(10 + i * ((width/2)/4), (height * 0.6) + (j * (altobotoncolor + 10))), "", 1, "", colores.get(k));
      botones.add(boton);
      ++k;
    }
  }
  botones.add(new Button((width/2)/2-5, altoboton, new PVector(3, height/2), "-", ceil(altoboton * 0.4), "Minus"));
  botones.add(new Button((width/2)/2-5, altoboton, new PVector((width/2)/2 + 3, height/2), "+ ", ceil(altoboton * 0.4), "More"));
}

void mousePressed(){
 for(Button b: botones){
   if(b.isClicked(mouseX, mouseY)){
    runAction(b); 
   }
 }
 mapa.iniciarTrazado(mouseX, mouseY, colorActual, strokeWidth);
}

void mouseDragged()
{
  mapa.continuarTrazado(mouseX, mouseY);
}

void mouseReleased()
{
  mapa.finalizarTrazado(mouseX, mouseY);
}

void draw()
{
 if(mouseY < height/2 - 15 && pmouseY < height/2 - 15 && mousePressed){
  stroke(colorActual.x, colorActual.y, colorActual.z);
  strokeWeight(strokeWidth);
  line(pmouseX, pmouseY, mouseX, mouseY);
 }
 for(Button b : botones)
 {
  b.Draw();
 }
 mapa.Draw();
}

void runAction(Button boton)
{
  String nameAction = boton.getFunc();
  switch(nameAction)
  {
    case "Atras":
      mapa.atras();
      break;
    case "Limpiar":
      fill(255,255,255);
      noStroke();
      rect(0, 0 , width, height/2-10);
      mapa.renovarMapa();
      break;
    case "Guardar":
      //saveFrame();
      break;
    case "Enviar":
      
      break;
    case "Salir":
      exit();
      break;
    case "Minus": 
      if(strokeWidth > 0){
        --strokeWidth;
      }
      break;
    case "More":
      ++strokeWidth;
      break;
    default:
      colorActual = boton.setColour();
      break;
  }
}
