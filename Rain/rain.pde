int colunas = 200;
int filas = 200;

float[][] atual;
float[][] anterior;

float recaida = 0.9; //colocar uma função que varia entre 0 e 1

void randomDrops()
{
  float randomX = random(colunas);
  float randomY = random(filas);
  
  anterior[int (randomX)][int (randomY)] = 500;
}

void mousePressed()
{
  anterior[mouseX][mouseY] = 500;
}

void setup()
{
  size(600, 400);
  
  colunas = width;
  filas = height;
  
  atual = new float[colunas][filas];
  anterior = new float[colunas][filas];
}

void draw()
{    
  background(0);
  loadPixels();
  randomDrops();
  //Iniciado com 1, pois precisamo que tenha pelo menos 0 no i-1 ou j-1
  for(int i = 1; i < colunas-1; i++)
  {
    //colocando o ramdonDrop dentro desse for, cria uma tempestade do demonio
    //randomDrops();
    for(int j = 1; j < filas-1; j++)
    {
      atual[i][j] =(anterior[i-1][j] + 
                    anterior[i+1][j] + 
                    anterior[i][j-1] + 
                    anterior[i][j+1])/2 - atual[i][j];
      
      atual[i][j] = atual[i][j] * recaida;
      
      int index = i + j * colunas;
      pixels[index] = color(atual[i][j]*10);
      //colocando o randomDrop dentro desse for, faz um tipo de fogo lateral
      //randomDrops();
    }
  }
  updatePixels();
  //uma troca simples
  float[][] aux = anterior;
  anterior = atual;
  atual = aux;
}
