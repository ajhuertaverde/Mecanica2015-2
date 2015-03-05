      program regresion
c     programa para hacer regresiones lineales o  logaritmicas con minimos cuadrados y xi cuadfrada
      integer nmax,  nd
      parameter (nmax=1000000)
      CHARACTER archivo*50 

      real A01(nmax), A02(nmax), A03(nmax), A04(nmax)
      real LA01(nmax), LA03(nmax), sx, sy, sxy, sxx,syy
      real slx,sly, slxly, slxlx, slyly,b1,m1,m1l,b1l
      real p,pl, erry, errly, errm1, errb1, errm1l, errb1l
      real deltay, deltaly, xi, xired, xil, xilred,c1,ndr,c,cl

c Datos de entrada Nombre del archivo, primer renglon del archivo debe de ser el numero de datos
c A partir del segundo renglon estara los datos, primea colomna variable independiente
c Segunda columna error variabble independiente, tercetra col Var dep, cuarta col error variable dep.

      print *, 'archivo de datos y numero de datos'
      read(*,*) archivo ,nd  
      ndr=real(nd)
      sx=0.0
      sy=0.0
      sxy=0.0
      sxx=0.0
      syy=0.0
      slx=0.0
      sly=0.0
      slxly=0.0
      slxlx=0.0
      slyly=0.0
    
      open (1,FILE=archivo)
c    Lectura del archivo de datos y asignacion de variables
c  Loop over the data points
      do 10 i= 1, nd
          read(1,*) A01(i), A02(i), A03(i), A04(i)
           LA01(i)=log(A01(i))
           LA03(i)=log(A03(i))
           sx=sx+A01(i)
           slx=slx+LA01(i)
           sy=sy+A03(i)
           sly=sly+LA03(i)
           sxy=sxy+A01(i)*A03(i)
           slxly=slxly+LA01(i)*LA03(i)
           sxx=sxx+A01(i)*A01(i)
           slxlx=slxlx+LA01(i)*LA01(i)
           syy=syy+A03(i)*A03(i)
           slyly=slyly+LA03(i)*LA03(i)

c         continue
   10 end do
C ajuste de minimos cuadrados caso logaritmico
      m1l=(ndr*slxly-slx*sly)/(ndr*slxlx-slx*slx)
      b1l=(slxlx*sly-slx*slxly)/(ndr*slxlx-slx*slx)
C ajuste minimos cuadrados a caso lineal
      m1=(ndr*sxy-sx*sy)/(ndr*sxx-sx*sx)
      b1=(sxx*sy-sx*sxy) / (ndr*sxx-sx*sx) 
c parámetro de correlacion de pearson caso lineal
      p=(nd*sxy-sx*sy)/sqrt((nd*sxx-sx*sx)*(nd*syy-sy*sy))
c parametro de correlacion pearson caso log
      pl=(nd*slxly-slx*sly)/sqrt((nd*slxlx-slx*slx)*(nd*slyly-sly*sly))

c error m y b caso lineal
      deltay=0.0
      do 20 j=1, nd
         deltay = deltay + (m1*A01(j)+b1-A03(j))**2
   20 enddo
      erry=sqrt(deltay/(nd-2))
      errm1=erry*sqrt(nd/(nd*sxx-sx*sx))
      errb1=erry*sqrt(sxx/(nd*sxx-sx*sx))

c error m y b caso log
      deltaly=0.0
      do 30 k=1, nd
         deltaly=deltaly+(m1l*LA01(k)+b1l-LA03(k))**2
   30 enddo
      errly=sqrt(deltaly/(nd-2))
      errm1l=errly*sqrt(nd/(nd*slxlx-slx*slx))
      errb1l=errly*sqrt(slxlx/(nd*slxlx-slx*slx))

C  determinacion de xi cuadrada y xi cuadrada reducida para caso lineal y log
      xi=0.0
      xil=0.0
      do 40 l=1, nd
         xi=xi + (A03(l)-m1*A01(l)-b1)**2/(A04(l)**2)
         xil=xil + (A03(l)-exp(b1l)*A01(l)**m1l)**2/(A04(l)**2)
   40 enddo
      xired=xi/(nd-2)
      xilred=xil/(nd-2)
c cerrar archivo de datos
      close (1)
C   presentacion de resultados
c parametros  de correlacion de pearson lineal y log
      print*, 'parametros de correlacion lineal y en plano log'
      print *, p, pl 
      PRINT *,'resultados de minimos cuadrados en plano lineal'
      print *, 'm, error en m, b, error en b'
      print *, m1, errm1, b1, errb1
      print *, 'resultados en plano log'
      print*, 'm, error en m, b, error en b'
      print*, m1l, errm1l, b1l, errb1l
      print*, 'Xi CR caso lineal, Xi CR ley potencias'
      print*, xired, xilred 

      end
