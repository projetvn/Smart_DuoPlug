public class Dashboard{
  public Dashboard(){}
  public void afficher(int theme){
    Bouton power1,power2;
    power1=new Bouton();
    power2=new Bouton();
    
    power1.setPosition(450,675,80,80);
    power1.display();
    
    power2.setPosition(775,675,80,80);
    power2.display();
    
    if(theme==0){
      fill(10);
      rect(340,160,344.5,200,15);
      rect(704.5,160,344.5,200,15);
      rect(1069,160,344.5,200,15);
      rect(1433.5,160,344.5,200,15);
      rect(340,490,304.5,450,15);
      rect(664.5,490,304.5,450,15);
      rect(989,420,789,520,15);
      
      fill(148,163,184);
      textSize(17);
      text("Prises actives",375,200);
      text("Consommation actuelle",739.5,200);
      text("Consommation du jour",1104,200);
      text("Alertes",1468.5,200);
      
      fill(255);
      textSize(20);
      text("Mes prises",370,450);
      text("Prise 1",375,540);
      text("Prise 2",699.5,540);
      text("Consommation (24h)",1014,480);
      textSize(30);
      text("/2",420,280);
      
      fill(140,155,176);
      textSize(16);
      text("200 W",1014,557);
      text("150 W",1014,634);
      text("100 W",1014,711);
      text(" 50 W",1014,788);
      text("  0 W",1014,865);
      text("00:00",1090,895);
      text("06:00",1246,895);
      text("12:00",1402,895);
      text("18:00",1558,895);
      text("24:00",1714,895);
      
      strokeWeight(1);
      stroke(20);
      line(1064,554,1748,554);
      line(1064,631,1748,631);
      line(1064,708,1748,708);
      line(1064,785,1748,785);
      line(1064,862,1748,862);
      
      iconePrise(624.5, 220, color(110,120,255));
      iconeEclair(989, 220, color(255,210,40));
      iconeGraph(1353.5, 220, color(120,120,255));
      iconeCloche(1708, 220, color(255,100,100));
    }
    
    else{
      fill(250);
      rect(340,160,344.5,200,15);
      rect(704.5,160,344.5,200,15);
      rect(1069,160,344.5,200,15);
      rect(1433.5,160,344.5,200,15);
    
      rect(340,490,304.5,450,15);
      rect(664.5,490,304.5,450,15);
    
      rect(989,420,789,520,15);
    
      fill(80);
      textSize(17);
    
      text("Prises actives",375,200);
      text("Consommation actuelle",739.5,200);
      text("Consommation du jour",1104,200);
      text("Alertes",1468.5,200);
    
      fill(20);
      textSize(20);
    
      text("Mes prises",370,450);
      text("Prise 1",375,540);
      text("Prise 2",699.5,540);
      text("Consommation (24h)",1014,480);
      textSize(30);
      text("/2",420,280);
    
      fill(120);
    
      textSize(16);
      text("200 W",1014,557);
      text("150 W",1014,634);
      text("100 W",1014,711);
      text(" 50 W",1014,788);
      text("  0 W",1014,865);
    
      text("00:00",1090,895);
      text("06:00",1246,895);
      text("12:00",1402,895);
      text("18:00",1558,895);
      text("24:00",1714,895);
    
      stroke(220);
      strokeWeight(1);
    
      line(1064,554,1748,554);
      line(1064,631,1748,631);
      line(1064,708,1748,708);
      line(1064,785,1748,785);
      line(1064,862,1748,862);
      
      iconePrise(624.5, 220, color(85,90,240));
      iconeEclair(989, 220, color(235,175,0));
      iconeGraph(1353.5, 220, color(90,95,235));
      iconeCloche(1708, 220, color(225,70,70));
    }
  }
}
