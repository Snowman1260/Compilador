/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compiladores;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.*;



/**
 *
 * @author stevi
 */
public class Interfaz extends javax.swing.JFrame {

    /**
     * Creates new form Interfaz
     */
    public Interfaz() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        ButSeleccionarArchivo = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        lblNombreArchivo = new javax.swing.JLabel();
        btnAnalizarArchivo = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        ButSeleccionarArchivo.setText("Seleccionar Archivo");
        ButSeleccionarArchivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ButSeleccionarArchivoActionPerformed(evt);
            }
        });

        jLabel1.setText("Nombre Del Archivo:");

        lblNombreArchivo.setText(" ");

        btnAnalizarArchivo.setText("Analizar Archivo");
        btnAnalizarArchivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarArchivoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(ButSeleccionarArchivo)
                        .addGap(33, 33, 33)
                        .addComponent(btnAnalizarArchivo))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(26, 26, 26)
                        .addComponent(lblNombreArchivo, javax.swing.GroupLayout.PREFERRED_SIZE, 230, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(147, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(lblNombreArchivo))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ButSeleccionarArchivo)
                    .addComponent(btnAnalizarArchivo))
                .addContainerGap(317, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void ButSeleccionarArchivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ButSeleccionarArchivoActionPerformed
        // TODO add your handling code here:
        try{
            EncontrarRuta();
        }
        catch (IOException ex){
            System.out.println(ex.getMessage());
        }
    }//GEN-LAST:event_ButSeleccionarArchivoActionPerformed

    private void btnAnalizarArchivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarArchivoActionPerformed
        try{
            Analizar();
        }
        catch (IOException ex){
            System.out.println(ex.getMessage());
        } 
        // TODO add your handling code here:
    }//GEN-LAST:event_btnAnalizarArchivoActionPerformed

    public void Analizar() throws IOException
    {
        //Leer archivo
        
        String NombreArchivoEntrada = "";
        NombreArchivoEntrada = lblNombreArchivo.getText();
        File Archivo = new File(NombreArchivoEntrada);
        
        BufferedReader bf = new BufferedReader(new FileReader(Archivo));
        
        String temp = "";
        String bfRead = "";
        while ((bfRead = bf.readLine())!= null) {            
            temp = temp + bfRead + "\r\n";
        }
        
        JOptionPane.showMessageDialog(null, temp);
        
        //Leer Lexer
        int contID = 0;
        
        File fichero = new File("fichero.txt");
        PrintWriter writer; 
        
        try 
        {
            writer = new PrintWriter(fichero);
            writer.print(temp);
            writer.close();
        } catch (FileNotFoundException ex) 
        {
            Logger.getLogger(Interfaz.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        BufferedReader Reader = new BufferedReader(new FileReader("fichero.txt"));
        
        Lexer lexer = new Lexer(Reader);
        
        String resul = "";
        
        while (true) {            
            Token token = lexer.yylex();
            if (token == null) {
                resul = resul + "\r\n" + "EOF";
                return;
            }
            switch(token){
                
                case ID:  
                    resul = resul + lexer.lexeme + "\r Se reconocio y es un ID " + "\r\n";
                    break;
                case SIGNO:
                    resul = resul + lexer.lexeme + "\r Se reconocio y es un Signo " + "\r\n";
                    break;
                case INT:
                    resul = resul + lexer.lexeme + "\r Se reconocio y son numeros " + "\r\n";
                    break;
                case ERROR:
                    resul = resul + lexer.lexeme + "\r No reconocido en la linea " + "\r\n";
                    break;
                    
                    
            }
        
        JOptionPane.showMessageDialog(null, resul);
        
        File fichero2 = new File("prueba.out");
        PrintWriter writer2; 
        
        try 
        {
            writer2 = new PrintWriter(fichero2);
            writer2.print(resul);
            writer2.close();
        } catch (FileNotFoundException ex) 
        {
            Logger.getLogger(Interfaz.class.getName()).log(Level.SEVERE, null, ex);
        }
 
         
        
        
        
        
        
    }
        
    }
    
    public void EncontrarRuta() throws IOException
    {
        String NombreA = "";
        
        JFileChooser fc = new JFileChooser();
        fc.setCurrentDirectory(new java.io.File("D:/Universidad/Compiladores"));
        fc.setDialogTitle("Escoja la Entrada del Proyecto");
        FileNameExtensionFilter filter = new FileNameExtensionFilter("TEXT FILES", "txt", "text");
        fc.setFileFilter(filter);
        //fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
        if (fc.showOpenDialog(ButSeleccionarArchivo)== JFileChooser.APPROVE_OPTION) 
        {
           NombreA = (fc.getSelectedFile().getAbsolutePath()).toString();
           lblNombreArchivo.setText(NombreA);
        }
        //
        
        
        
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Interfaz().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton ButSeleccionarArchivo;
    private javax.swing.JButton btnAnalizarArchivo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel lblNombreArchivo;
    // End of variables declaration//GEN-END:variables
}
