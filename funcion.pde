AudioPlayer[] iniciarArreglo( int indiceInicial , int indiceFinal , Minim minim )
{

  int dimension = indiceFinal - indiceInicial + 1;
  AudioPlayer aux[] = new AudioPlayer[ dimension ];

  for (int i = indiceInicial; i <= indiceFinal; i++) {
    int j = i - indiceInicial;
    aux[j] = minim.loadFile( nf(i, 2) + ".mp3");
  }


  return aux;
}

