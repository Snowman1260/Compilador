/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Compiladores;

import java.io.File;
import java.util.Scanner;
/**
 *
 * @author Steven Villatoro
 */
public class MainConsola {
    /**
     * @param args the command line arguments
     */
    static String RutaArchivo;
    public static void main(String[] args) {
        java.util.Scanner in = new Scanner(System.in);
        System.out.print("Ingrese la direccion del archivo: ");
        RutaArchivo = in.nextLine();
        FLEXYCUP CUP = new FLEXYCUP();
        CUP.main(args, RutaArchivo);
        
        String Peth = "src/Compiladores/alexico.flex";
        Siguiente1(Peth);
        // TODO code application logic here
    }
    
    public static void Siguiente1(String Salida)
    {
        File F = new File(Salida);
        jflex.Main.generate(F);
 
    }      
}
