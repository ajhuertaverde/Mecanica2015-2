/** 
* Este programa fue pensado como ejemplo para todos ustedes que 
* insisten en usar C.
* El lenguaje C no es malo, es poderoso, sin embargo es 
* demasiado poderoso y toma un par de años poder explotar dicho poder.
* Les recomendaría usar Lenguajes como Python, Ruby, R, incluso Java
* que dada su ventaja de ser orientados a Objetos, su entendimiento es más 
* sencillo que C. 
* Dicho lo Anterior aquí va esta implementación.
**/

#include<stdio.h>
#include<stdlib.h>

int main(void){
   
   float x,y,xprom,yprom,xsum,ysum;
   int i,contador;
   FILE * fp;
   contador = 0;
   xsum = 0.0;
   ysum = 0.0;
   fp = fopen ("../Datos/medidas.tsv", "r+");
   for(i=0;i<=89;i++){
      contador+=1;
      fscanf(fp, "%f %f", &x, &y);
      xsum = xsum + x;
      ysum = ysum + y;
   }
    
   printf("la suma de x, SigmaX=%f\n",xsum);
   printf("la suma de y, SigmaY=%f\n",ysum);

   printf("el Promedio de x, PromX=%f\n",xsum/contador);
   printf("el Promedio de y, PromY=%f\n",ysum/contador);

   fclose(fp);
   return 0;
}

