import ddf.minim.*;

AudioPlayer[] playerC;//<---disco
AudioPlayer[] playerP;//<---camara de fotos
AudioPlayer[] playerM;//<---walkman
AudioPlayer[] playerZ;//<---celular

AudioPlayer[] playerEInicio;//<---Inicio 
AudioPlayer[] playerEFinal;//<---Fin

AudioPlayer[] playerCyP;//<---Objeto disco y camara de fotos
AudioPlayer[] playerCyM;//<---Objeto disco y walkman
AudioPlayer[] playerCyZ;//<---Objeto disco y celular

AudioPlayer[] playerMyP;//<---Objeto walkman y camara de fotos
AudioPlayer[] playerMyZ;//<---Objeto walkman y celular


AudioPlayer[] playerPyZ; //<---Objeto camara de fotos y celular

AudioPlayer playerCancion;

AudioPlayer[] playerEspera;

AudioPlayer[] playerModerno;
AudioPlayer[] playerAntiguo;
AudioPlayer[] playerMareado;
Reproducir reproducirMusica;

Minim minim;
boolean fading = false;
int count;
String estado; 
int contModernoEspera;
String estadoInicial;
String estadoFinal;
String estadoInicialObj;
String estadoGeneral;
String estadoCancion;
int contador;
int contInicio;
boolean[] keys;
float tiempo;
int savedTime;
int totalTime = 28000;
int contModerno;

void setup() {
  size(200, 200);
  minim = new Minim(this);
  keys=new boolean[256];
  reproducirMusica = new Reproducir();
  savedTime = millis();
  estado = "v";
  estadoGeneral = "v";
  estadoInicial = "v";
  estadoFinal = "f";
  estadoInicialObj = "f";
  estadoCancion = "v";
  contador = 0;
  contInicio = 0;
  contModernoEspera = 0;
  contModerno =0;
  for (int i=0; i <=255; i ++)
  {
   keys[i] = false; 
  }
  
  playerEInicio=iniciarArreglo(01, 05, minim);
  playerEFinal=iniciarArreglo(06, 10, minim);
  playerEspera=iniciarArreglo(11, 15, minim);
     
  playerC=iniciarArreglo(16, 20, minim);
  playerP=iniciarArreglo(21, 25,minim);
  playerM=iniciarArreglo(26, 30,minim);
  playerZ=iniciarArreglo(31, 35,minim);
 
  playerCyP=iniciarArreglo(36, 37,minim);
  playerCyM=iniciarArreglo(38, 39,minim);
  playerCyZ=iniciarArreglo(40, 41,minim);
  
  playerMyP=iniciarArreglo(42, 43,minim); // <----falta 1 acá
  playerMyZ=iniciarArreglo(44, 45,minim);
  
  playerPyZ=iniciarArreglo(46, 47,minim);

  playerModerno = iniciarArreglo(48, 49,minim);
  playerAntiguo = iniciarArreglo(50, 51,minim);
  playerMareado = iniciarArreglo(52, 53,minim);
 
  playerCancion = minim.loadFile("groove.mp3");
 
  playerCancion.loop();
 
} 
 
void draw() {
  
   int passedTime = millis() - savedTime;
   
//------------------------------------------------------Musica

  float currentVolume = playerCancion.getGain();
  
  if(estadoCancion.equals("v") )
  {
    playerCancion.shiftGain(currentVolume,-10,1000); 
    fading = true;
    estadoFinal = "f";
    estadoInicial = "v";
    contInicio = 0;
    println("yo lo active");
  } 
  
//------------------------------------------------------Empieza con el saludo inicial 
  
 if(estadoInicial.equals("v"))
{
 if(keys ['e'] == true && !keys['p'] && !keys['m'] && !keys['z'] && !keys['c']) 
  {
    estadoCancion = "f";
    playerCancion.shiftGain(currentVolume,-80,1000);
    fading = true;
    
    if(!playerEInicio[count].isPlaying() && contInicio == 0 && !playerEFinal[count].isPlaying()) 
  {
    count = int(random(0, 4));
    playerEInicio[count].play();  
    playerEInicio[count].rewind(); 
    playerEInicio[count].unmute();
    estadoInicialObj= "v";
    println("Inicio Play");
    contInicio = 1;
  }
    
  }else{
     
 playerEInicio[count].pause();
 estadoInicial = "f";

    println("ME APAGué");
    }
}   



//------------------------------------------------------Termina con un saludo final  
  if(estadoFinal.equals("v"))
{
 if(!keys ['e'] && !keys['p'] && !keys['m'] && !keys['z'] && !keys['c']) 
  {
    contador ++;
    println(contador);
     if(!playerEFinal[count].isPlaying() && !playerEInicio[count].isPlaying() ) 
  {
    
    count = int(random(0, 4));
    playerEFinal[count].play();  
    playerEFinal[count].rewind(); 
    playerEFinal[count].unmute();
    estadoFinal = "f";
    estadoInicial = "f";
    println("Final Play");
    
    }
    if(contador == 100)
    {
     estadoCancion = "v";
      estadoInicial = "v";
      contador = 0;
      
  }
} 
}


//------------------------------------------------------EMPIEZA ESPERA
if (passedTime > totalTime)
{
if(keys ['e'] == true && !keys['p'] && !keys['m'] && !keys['z'] && !keys['c'])
{
  reproducirMusica.reproducirAudio(playerEspera);
  println("Espera Play");
   
  println( " 5 seconds have passed! " );
  }else{
   estadoFinal = "v";
   reproducirMusica.pararAudio(playerEspera);
   println("Espera Stop"); 
   savedTime = millis();  
}
}






//------------------------------------------------------EMPIEZA C
if(estadoInicialObj.equals("v"))
{
   
if(estado.equals("v"))
{
 if(keys ['c'] == true && !keys['p'] && !keys['m'] && !keys['z']) 
  {
    if(!playerEInicio[count].isPlaying())
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudio(playerC);
    println("C Play");
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudio(playerC);
   println("C Stop");  
  }
}

//------------------------------------------------------EMPIEZA P

if(estado.equals("v"))
{
 if(keys ['p'] == true && !keys['c'] && !keys['m'] && !keys['z']) 
  {
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudio(playerP);
    println("P Play");
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudio(playerP);
   println("P Stop");
  }
}


//------------------------------------------------------EMPIEZA M
if(estado.equals("v"))
{
 if(keys ['m'] == true && !keys['c'] && !keys['p'] && !keys['z']) 
  {
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudio(playerM);
    println("M Play");
   
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudio(playerM);
   println("M Stop");
  }
}

//------------------------------------------------------EMPIEZA Z
if(estado.equals("v"))
{
 if(keys ['z'] == true && !keys['c'] && !keys['p'] && !keys['m']) 
  {
    
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudio(playerZ);
    println("Z Play");
    
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudio(playerZ);
   println("Z Stop");
  }
}



//------------------------------------------------------EMPIEZA C y P  

if(keys ['c'] == true && keys['p'] == true && !keys['m'] && !keys['z']) 
  {
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudioConjunto(playerCyP);
    println("CyP Play");
    estado = "f";
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudioConjunto(playerCyP);
   println("CyP Stop");
   estado = "v";
   
}



//------------------------------------------------------EMPIEZA C y M 
if(estadoGeneral.equals("v")){
if(keys ['c'] == true && keys['m'] == true && !keys['p'] && !keys['z']) 
  {
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudioConjunto(playerCyM);
    println("CyM Play");
    estado = "f";
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudioConjunto(playerCyM);
   println("CyM Stop");
   
  }
}

//------------------------------------------------------EMPIEZA C y Z 
if(estadoGeneral.equals("v")){
if(keys ['c'] == true && keys['z'] == true && !keys['m'] && !keys['p']) 
  {
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudioConjunto(playerCyZ);
    println("CyZ Play");
    estado = "f";
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudioConjunto(playerCyZ);
   println("CyZ Stop");
 }
}


//------------------------------------------------------EMPIEZA M y P 
if(estadoGeneral.equals("v")){
if(keys ['m'] == true && keys['p'] == true && !keys['c'] && !keys['z']) 
  {
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudioConjunto(playerMyP);
    println("MyP Play");
    estado = "f";
  }
  }else{
   estadoFinal = "v";
    estadoInicial = "f";
   reproducirMusica.pararAudioConjunto(playerMyP);
   println("MyP Stop");
   
   
  }
}

//------------------------------------------------------EMPIEZA M y Z 
if(estadoGeneral.equals("v")){
if(keys ['m'] == true && keys['z'] == true && !keys['c'] && !keys['p']) 
  {
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudioConjunto(playerMyZ);
    println("MyZ Play");
    estado = "f";
  }
  }else{
   estadoFinal = "v";
    estadoInicial = "f";
   reproducirMusica.pararAudioConjunto(playerMyZ);
   println("MyZ Stop");
   
   
  }
}

//------------------------------------------------------EMPIEZA P y Z 
if(estadoGeneral.equals("v")){
if(keys ['p'] == true && keys['z'] == true && !keys['c'] && !keys['m']) 
  {
    if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudioConjunto(playerPyZ);
    println("PyZ Play");
    estado = "f";
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudioConjunto(playerPyZ);
   println("PyZ Stop");
   
   
  }
} 


//------------------------------------------------------EMPIEZA LA NEGACION
if(estadoGeneral.equals("v")){
if(keys ['c'] == true && keys['p'] == true && keys['m']== true && keys['z']== true 
||keys ['c'] == true && keys['p'] == true && keys['z']== true && !keys['m']
||keys ['c'] == true && keys['p'] == true && keys['m']== true && !keys['m']
||keys ['m'] == true && keys['p'] == true && keys['z']== true && !keys['c']
||keys ['z'] == true && keys['c'] == true && keys['m']== true && !keys['p']) 
{
   if(!playerEInicio[count].isPlaying()) 
  {
    estadoInicial = "f";
    reproducirMusica.reproducirAudioConjunto(playerMareado);
    println("entreeeeee");
    estado = "f";
  }
  }else{
   estadoFinal = "v";
   estadoInicial = "f";
   reproducirMusica.pararAudioConjunto(playerMareado);  
  }  
}





}
}//<---Termina el DRAW
        


void keyReleased()
{
  keys[ key ] = true;
                            
}


void keyPressed()
{
  keys[ key ] = false;

}




