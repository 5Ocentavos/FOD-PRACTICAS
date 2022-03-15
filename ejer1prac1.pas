{
1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del
archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando
se ingrese el número 30000, que no debe incorporarse al archivo.
   
}


program archivoNumerosCreacionYCarga;
type
  archivoNumeros = file of integer;

procedure crearYcargarArchivo (var archNum: archivoNumeros);
var
  num: integer;
begin
  {Creo el archivo, no s1é porque va este paso pero bueno...}
  rewrite (archNum);
  {Leo numeros y los cargo en el archivo}
  write ('Ingrese un numero entero: ');
  readln (num);
  while (num <> 30000) do
    begin
      write (archNum, num);
      write ('Ingrese un numero entero: ');
      readln (num);
    end;
  close (archNum);
end;

var 
  archNum : archivoNumeros;
  nomArch: string;

BEGIN
  {Leo el nombre del archivo}
  write ('Ingrese el nombre del archivo: ');
  readln (nomArch);
  {Hago el enlace de mi archivo binario con el nombre que ingreso el usuario}
  assign (archNum, nomArch);
  {Llamo al metodo crear y cargar}
  crearYcargarArchivo (archNum);
  write ('SE HA CREADO UN ARCHIVO DE NUMEROS');
END.

