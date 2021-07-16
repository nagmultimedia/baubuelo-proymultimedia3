class Reproducir{
  int count;
  int countConjunto;
  Reproducir(){
    
  }
  
  void reproducirAudio(AudioPlayer[] letra ){
    if(!letra[count].isPlaying()) 
  {
    count = int(random(0, 4));
    letra[count].play();  
    letra[count].rewind(); 
    letra[count].unmute();
  }
  }
  
 void pararAudio(AudioPlayer[] letra){
  letra[count].pause();
  }
  
  
  
   void reproducirAudioConjunto(AudioPlayer[] letraConjunto ){
    if(!letraConjunto[countConjunto].isPlaying()) 
  {
    count = int(random(0, 1));
    letraConjunto[countConjunto].play();  
    letraConjunto[countConjunto].rewind(); 
    letraConjunto[countConjunto].unmute();
  
  }
  }
  
 void pararAudioConjunto(AudioPlayer[] letraConjunto){
  letraConjunto[countConjunto].pause();
  }
  
}
