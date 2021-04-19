class Button{
    
   int bWidth, bHeight;
   PVector pos, col;
   String text, func;
   int textSize;
   
   public Button(int bWidth, int bHeight, PVector pos, String text, int textSize, String func)
   {
     this.bWidth = bWidth;
     this.bHeight = bHeight;
     this.pos = pos;
     this.text = text;
     this.textSize = textSize;
     this.func = func;
     col = new PVector(-1, -1, -1);
   }
   
   public Button(int bWidth, int bHeight, PVector pos, String text, int textSize, String func, PVector col)
   {
     this.bWidth = bWidth;
     this.bHeight = bHeight;
     this.pos = pos;
     this.text = text;
     this.textSize = textSize;
     this.func = func;
     this.col = col;
   }
   
   public void setColour(PVector col){
     this.col = col;
   }
   
   public String getFunc()
   {
     return this.func;
   }
   
   public PVector setColour()
   {
     return this.col;
   }
   
   public void Draw()
   {
    if(col.x == -1){
     noFill(); 
    }
    else
    {
      fill(col.x, col.y, col.z);
    }
    
    pushMatrix();
    textSize(textSize);
    translate(pos.x, pos.y);
    stroke(0, 0, 0);
    strokeWeight(2);
    rectMode(CORNER);
    rect(0, 0, bWidth, bHeight, 20);
    textAlign(CENTER);
    fill(0);
    text(text, floor(bWidth/2), ceil(bHeight/2) + (textSize/2));
    popMatrix();
   }
   
   public boolean isClicked(int x, int y)
   {
     boolean pulsado = false;
     if(x >= pos.x && x <= pos.x + bWidth && y >= pos.y && y <= pos.y + bHeight)
     {
       pulsado = true;
     }
     else
     {
       pulsado = false;
     }
     return pulsado;
   }
}
