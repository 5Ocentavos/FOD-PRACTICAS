{
2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y
el promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.   
}


program analisisDeArchivoCreadoEnEjer1;
type
  archivoNumeros = file of integer;

function esMenor (num: integer): boolean;
begin
  esMenor := (num < 1500);
end;

procedure procesarArchivo (var archNum: archivoNumeros; var cantNumMenores: integer; var sumaNum: integer; var cantNum: integer);
var
  num: integer;
begin
  reset (archNum);
  cantNum := fileSize (archNum);
  sumaNum := 0;
  cantNumMenores := 0;
  while (not eof (archNum)) do
    begin
      read (archNum, num);
      writeln (num);
      if (esMenor (num)) then
        cantNumMenores := cantNumMenores +1;
      sumaNum := sumaNum + num;
    end;
    close (archNum);
end;

var 
  archNum: archivoNumeros;
  nomArch: string;
  cantNumMenores: integer;
  sumaNum: integer;
  cantNum: integer;
BEGIN
  {El nombre de archivo ingresado de teclado puede ser erroneo pero vamos a suponer que es válido
    ya que la catedra asi lo dijo, mas especificamente Emmanuel}
  write ('Ingrese el nombre del archivo a procesar: ');
  readln (nomArch);
  assign (archNum, nomArch);
  {En el metodo procesar archivo voy a usar la operacion read y close para ser elegante}
  procesarArchivo (archNum, cantNumMenores, sumaNum, cantNum);
  {Imprimo en pantalla los resultados del procesamiento de los datos del archivo}
  writeln ('CANTIDAD DE NUMEROS MENORES A 1500: ', cantNumMenores);
  writeln ('PROMEDIO NUMEROS INGRESADOS ES: ',sumaNum/cantNum:3:2 );
END.

