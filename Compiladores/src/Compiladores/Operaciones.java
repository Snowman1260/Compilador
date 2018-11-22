/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Compiladores;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Steven Villatoro
 */
public class Operaciones {
    
    
     public static String Validar(String Lvalue, String Valor)
    {        
        //Info aux = (Info) (top.table.get(Lvalue));
        if(Valor.contains("+") || Valor.contains("-") || Valor.contains("*") || Valor.contains("/"))
        {
            if(Valor.contains("\""))
            {
                return Valor;
            }
            else
            {
                String Resultado = Resolve(Valor);
                return Resultado;
            }
          
            //aux.value = Resultado;
            //top.table.replace(Lvalue, aux);
            //System.out.println("  Nuevo valor para el identificador "+Lvalue+ " -> Valor: "+Resultado + " -> Ambito Actual: "+top);
        }
        else
        {
            boolean Variable = isNumeric(Valor);
                if (Variable == true)
                {
                    System.out.println("  Nuevo valor para el identificador "+Lvalue+ " -> Valor: "+Valor + " -> Ambito Actual: ");
                    return Valor;
                         
                    
                }
                else
                {
                    return Valor;
                }
        }
            
        
    }
      public static boolean isBoolean(String S)
    {
        try
        {
            double d = Double.parseDouble(S);
        }
        catch(NumberFormatException nfe)
        {
            return false;
        }
        return true;
    }
    
     
    public static boolean isNumeric(String S)
    {
        try
        {
            double d = Double.parseDouble(S);
        }
        catch(NumberFormatException nfe)
        {
            return false;
        }
        return true;
    }
    

    

    public static String Resolve(String S)
    {
        Postfijo Stage1 = new Postfijo(S);
        String Posfijo = Stage1.getPostFix();    
        Resolver Stage2 = new Resolver(Posfijo);
        return Stage2.getResult();
    }
    
    public static void GenerarTabla(List<TablaSimbolos> ListaSimbolos) throws FileNotFoundException
    {
        PrintWriter writer;
        File salida = new File ("TablaSimbolos.out");
        writer = new PrintWriter(salida);
        writer.println("Ambito"+","+"Tipo"+","+"Valor Ambito"+","+"Tipo Ambito"+","+"Numero Clase"+","+"Parametro"+"\n");
        String SalidaDelArchivoString = "";
        for (int i = 0; i < ListaSimbolos.size(); i++) 
        {
            SalidaDelArchivoString = ListaSimbolos.get(i).nombre+","+ListaSimbolos.get(i).tipo+","+ListaSimbolos.get(i).valor+","+ListaSimbolos.get(i).bandera+","+ListaSimbolos.get(i).clases+","+ListaSimbolos.get(i).bparametro+"\n" ;
            SalidaDelArchivoString = SalidaDelArchivoString.replaceAll("0", "Variable");
            SalidaDelArchivoString = SalidaDelArchivoString.replaceAll("1", "Variable Global");
            SalidaDelArchivoString = SalidaDelArchivoString.replaceAll("2", "Variable");
            SalidaDelArchivoString = SalidaDelArchivoString.replaceAll("3", "Variable");
            SalidaDelArchivoString = SalidaDelArchivoString.replaceAll("4", "Variable");
            writer.println(SalidaDelArchivoString);
        }

         writer.close();
    }

    
}
