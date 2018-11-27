/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paneles;

import Conexion.Conexion;
import sisalmacen.MenuPrincipal;
import clases.*;
import java.awt.FileDialog;
import java.io.File;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

public class pnlModificarProd extends javax.swing.JPanel {

    MenuPrincipal principal;
    String userID,rutaProyect;
    
    String directorio;
    String nombreArchivo="";
    String rutatotal, rutaAnt;
    
    int idCatN[];// = new int[2];
    int idMarc[];//=new int[2];
    int idProd[];// = new int[2];
    int idProdModif;
    
    public pnlModificarProd(String idUser, MenuPrincipal princip) {
        initComponents();
        userID=idUser;
        principal=princip;
        rutaProyect=new File ("").getAbsolutePath ();
        listaCat();
        listaMarca();
        listaProd();
        //JOptionPane.showMessageDialog(null, idMarc.length);
        
        //JOptionPane.showMessageDialog(null, idProd.length);
    }
    public void listaMarca(){
        idMarc=ListaCombos.listaMarca(cboMarca,idMarc);
        
    }
    
    public void listaProd(){
        idProd=ListaCombos.listaProductos(cboProd, idProd);
        
    }
    
    public void listaCat(){
        idCatN=ListaCombos.listaCategoria(cboCatNvo, idCatN);
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        panelImage = new org.edisoncor.gui.panel.PanelImage();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        btnBuscar = new javax.swing.JButton();
        cboProd = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        jLabel26 = new javax.swing.JLabel();
        txtBusqSerie = new javax.swing.JTextField();
        jPanel4 = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        cboMarca = new javax.swing.JComboBox<>();
        txtModelo = new javax.swing.JTextField();
        btnAgregarMarca = new javax.swing.JButton();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txtSerie = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        txtUbicacion = new javax.swing.JTextField();
        jLabel14 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        txtDescrip = new javax.swing.JTextField();
        jLabel16 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        txtUnidMed = new javax.swing.JTextField();
        jLabel18 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        btnExaminar = new rsbuttom.RSButtonMetro();
        panelImagen = new org.edisoncor.gui.panel.PanelImage();
        jLabel20 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        cboCatNvo = new javax.swing.JComboBox<>();
        btnAgregarCat = new javax.swing.JButton();
        jLabel22 = new javax.swing.JLabel();
        jLabel23 = new javax.swing.JLabel();
        txtProducto = new javax.swing.JTextField();
        jLabel24 = new javax.swing.JLabel();
        jLabel25 = new javax.swing.JLabel();
        txtPrecio = new javax.swing.JTextField();
        jPanel5 = new javax.swing.JPanel();
        btnGuardar = new rsbuttom.RSButtonMetro();
        btnCancelar = new rsbuttom.RSButtonMetro();

        setBackground(new java.awt.Color(0, 135, 236));

        panelImage.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        panelImage.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Background.png"))); // NOI18N

        jPanel1.setBackground(new java.awt.Color(252, 253, 242));
        jPanel1.setOpaque(false);

        jLabel2.setBackground(new java.awt.Color(255, 255, 255));
        jLabel2.setFont(new java.awt.Font("Poetsen One", 0, 24)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("MODIFICACIÓN DE PRODUCTOS");
        jLabel2.setAlignmentX(0.5F);

        jPanel2.setOpaque(false);

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(255, 255, 255), 2), "", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 11), new java.awt.Color(255, 255, 255)), "Filtro", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Poetsen One", 0, 16), new java.awt.Color(255, 255, 255))); // NOI18N
        jPanel3.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jPanel3.setOpaque(false);

        jLabel3.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Producto");

        jLabel5.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText(":");

        btnBuscar.setBackground(new java.awt.Color(204, 204, 204));
        btnBuscar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/buscar16.png"))); // NOI18N
        btnBuscar.setBorder(null);
        btnBuscar.setContentAreaFilled(false);
        btnBuscar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnBuscar.setPreferredSize(new java.awt.Dimension(20, 20));
        btnBuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBuscarActionPerformed(evt);
            }
        });

        cboProd.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        cboProd.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cboProdItemStateChanged(evt);
            }
        });
        cboProd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboProdActionPerformed(evt);
            }
        });

        jLabel4.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Serie");

        jLabel26.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel26.setForeground(new java.awt.Color(255, 255, 255));
        jLabel26.setText(":");

        txtBusqSerie.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3)
                    .addComponent(jLabel4))
                .addGap(32, 32, 32)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel5)
                    .addComponent(jLabel26))
                .addGap(18, 18, 18)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(txtBusqSerie, javax.swing.GroupLayout.PREFERRED_SIZE, 197, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(cboProd, javax.swing.GroupLayout.PREFERRED_SIZE, 276, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(70, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(jLabel5)
                    .addComponent(cboProd, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(7, 7, 7)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(jLabel26)
                    .addComponent(txtBusqSerie, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(255, 255, 255), 2), "", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 11), new java.awt.Color(255, 255, 255)), "Datos Opcionales", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Poetsen One", 0, 16), new java.awt.Color(255, 255, 255))); // NOI18N
        jPanel4.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jPanel4.setOpaque(false);

        jLabel6.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Marca");

        jLabel7.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Modelo");

        jLabel8.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText(":");

        jLabel9.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText(":");

        cboMarca.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        txtModelo.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        btnAgregarMarca.setBackground(new java.awt.Color(204, 204, 204));
        btnAgregarMarca.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/anadir.png"))); // NOI18N
        btnAgregarMarca.setBorder(null);
        btnAgregarMarca.setContentAreaFilled(false);
        btnAgregarMarca.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAgregarMarca.setPreferredSize(new java.awt.Dimension(20, 20));
        btnAgregarMarca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarMarcaActionPerformed(evt);
            }
        });

        jLabel10.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(255, 255, 255));
        jLabel10.setText("Serie");

        jLabel11.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(255, 255, 255));
        jLabel11.setText(":");

        txtSerie.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel12.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel12.setForeground(new java.awt.Color(255, 255, 255));
        jLabel12.setText("Ubicación");

        jLabel13.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel13.setForeground(new java.awt.Color(255, 255, 255));
        jLabel13.setText(":");

        txtUbicacion.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel14.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel14.setForeground(new java.awt.Color(255, 255, 255));
        jLabel14.setText("Descripción");

        jLabel15.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel15.setForeground(new java.awt.Color(255, 255, 255));
        jLabel15.setText(":");

        txtDescrip.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel16.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel16.setForeground(new java.awt.Color(255, 255, 255));
        jLabel16.setText("Unid. de Medida");

        jLabel17.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel17.setForeground(new java.awt.Color(255, 255, 255));
        jLabel17.setText(":");

        txtUnidMed.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel18.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel18.setForeground(new java.awt.Color(255, 255, 255));
        jLabel18.setText("Foto");

        jLabel19.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel19.setForeground(new java.awt.Color(255, 255, 255));
        jLabel19.setText(":");

        btnExaminar.setBackground(new java.awt.Color(0, 102, 0));
        btnExaminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/examinarB.png"))); // NOI18N
        btnExaminar.setText("Examinar");
        btnExaminar.setColorHover(new java.awt.Color(153, 0, 0));
        btnExaminar.setColorNormal(new java.awt.Color(0, 102, 0));
        btnExaminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnExaminarActionPerformed(evt);
            }
        });

        panelImagen.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        javax.swing.GroupLayout panelImagenLayout = new javax.swing.GroupLayout(panelImagen);
        panelImagen.setLayout(panelImagenLayout);
        panelImagenLayout.setHorizontalGroup(
            panelImagenLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        panelImagenLayout.setVerticalGroup(
            panelImagenLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        jLabel20.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel20.setForeground(new java.awt.Color(255, 255, 255));
        jLabel20.setText("Categoría");

        jLabel21.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel21.setForeground(new java.awt.Color(255, 255, 255));
        jLabel21.setText(":");

        cboCatNvo.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        btnAgregarCat.setBackground(new java.awt.Color(204, 204, 204));
        btnAgregarCat.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/anadir.png"))); // NOI18N
        btnAgregarCat.setBorder(null);
        btnAgregarCat.setContentAreaFilled(false);
        btnAgregarCat.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAgregarCat.setPreferredSize(new java.awt.Dimension(20, 20));
        btnAgregarCat.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarCatActionPerformed(evt);
            }
        });

        jLabel22.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel22.setForeground(new java.awt.Color(255, 255, 255));
        jLabel22.setText("Producto");

        jLabel23.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel23.setForeground(new java.awt.Color(255, 255, 255));
        jLabel23.setText(":");

        txtProducto.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel24.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel24.setForeground(new java.awt.Color(255, 255, 255));
        jLabel24.setText("Precio");

        jLabel25.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel25.setForeground(new java.awt.Color(255, 255, 255));
        jLabel25.setText(":");

        txtPrecio.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                                    .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                        .addGroup(jPanel4Layout.createSequentialGroup()
                                            .addComponent(jLabel12)
                                            .addGap(49, 49, 49))
                                        .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel4Layout.createSequentialGroup()
                                            .addComponent(jLabel10)
                                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                                    .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(jLabel11)
                                        .addComponent(jLabel13, javax.swing.GroupLayout.Alignment.TRAILING))
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                    .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addComponent(txtUbicacion)
                                        .addComponent(txtSerie, javax.swing.GroupLayout.PREFERRED_SIZE, 152, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGroup(jPanel4Layout.createSequentialGroup()
                                    .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addGroup(jPanel4Layout.createSequentialGroup()
                                            .addComponent(jLabel16)
                                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                            .addComponent(jLabel17))
                                        .addGroup(jPanel4Layout.createSequentialGroup()
                                            .addComponent(jLabel14)
                                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                            .addComponent(jLabel15)))
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                    .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(txtDescrip)
                                        .addComponent(txtUnidMed)))
                                .addGroup(jPanel4Layout.createSequentialGroup()
                                    .addComponent(jLabel7)
                                    .addGap(64, 64, 64)
                                    .addComponent(jLabel9)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                    .addComponent(txtModelo)))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel6)
                                .addGap(70, 70, 70)
                                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel4Layout.createSequentialGroup()
                                        .addComponent(jLabel23)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(txtProducto, javax.swing.GroupLayout.PREFERRED_SIZE, 423, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(jPanel4Layout.createSequentialGroup()
                                        .addComponent(jLabel8)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(cboMarca, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(btnAgregarMarca, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(30, 30, 30)
                                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(panelImagen, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                            .addGroup(jPanel4Layout.createSequentialGroup()
                                                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                    .addGroup(jPanel4Layout.createSequentialGroup()
                                                        .addComponent(jLabel18)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(jLabel19))
                                                    .addGroup(jPanel4Layout.createSequentialGroup()
                                                        .addComponent(jLabel24)
                                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(jLabel25)))
                                                .addGap(10, 10, 10)
                                                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                    .addComponent(txtPrecio, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                    .addComponent(btnExaminar, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)))))))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel20)
                                .addGap(47, 47, 47)
                                .addComponent(jLabel21)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(cboCatNvo, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnAgregarCat, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(225, 225, 225))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel22)
                        .addGap(22, 22, 22))))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel22)
                            .addComponent(jLabel23)
                            .addComponent(txtProducto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(cboMarca, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel6)
                                .addComponent(jLabel8))
                            .addComponent(btnAgregarMarca, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel24)
                        .addComponent(jLabel25)
                        .addComponent(txtPrecio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(cboCatNvo)
                                    .addComponent(jLabel21))
                                .addComponent(jLabel20))
                            .addComponent(btnAgregarCat, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(jLabel9)
                            .addComponent(txtModelo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel10)
                            .addComponent(jLabel11)
                            .addComponent(txtSerie, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(13, 13, 13)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel12)
                            .addComponent(jLabel13)
                            .addComponent(txtUbicacion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel14)
                            .addComponent(jLabel15)
                            .addComponent(txtDescrip, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel16)
                            .addComponent(jLabel17)
                            .addComponent(txtUnidMed, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel18)
                            .addComponent(jLabel19)
                            .addComponent(btnExaminar, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(panelImagen, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap(25, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 580, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(52, 52, 52)
                        .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(17, Short.MAX_VALUE))
        );

        jPanel5.setOpaque(false);

        btnGuardar.setBackground(new java.awt.Color(0, 102, 0));
        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/guardar.png"))); // NOI18N
        btnGuardar.setText("Guardar");
        btnGuardar.setColorHover(new java.awt.Color(153, 0, 0));
        btnGuardar.setColorNormal(new java.awt.Color(0, 102, 0));
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        btnCancelar.setBackground(new java.awt.Color(0, 102, 0));
        btnCancelar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar.png"))); // NOI18N
        btnCancelar.setText("Cancelar");
        btnCancelar.setColorHover(new java.awt.Color(153, 0, 0));
        btnCancelar.setColorNormal(new java.awt.Color(0, 102, 0));
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(21, Short.MAX_VALUE))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(133, 133, 133)
                        .addComponent(jLabel2)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(138, 138, 138)
                .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(23, 23, 23))
        );

        javax.swing.GroupLayout panelImageLayout = new javax.swing.GroupLayout(panelImage);
        panelImage.setLayout(panelImageLayout);
        panelImageLayout.setHorizontalGroup(
            panelImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelImageLayout.createSequentialGroup()
                .addGap(52, 52, 52)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(56, Short.MAX_VALUE))
        );
        panelImageLayout.setVerticalGroup(
            panelImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelImageLayout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(panelImage, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(panelImage, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnBuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBuscarActionPerformed
        CallableStatement cst;
        Connection con=null;
        ResultSet rs;
        
        /*JOptionPane.showMessageDialog(null, "Tamaño del arreglo: "+idProd.length);
        JOptionPane.showMessageDialog(null, "Primer id: "+idProd[1]);
        JOptionPane.showMessageDialog(null, "change del combo: "+cboProd.getSelectedIndex());*/
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraDatosProd(?,?)}");
            cst.setInt(1, idProd[cboProd.getSelectedIndex()]);
            cst.setString(2, txtBusqSerie.getText());
            cst.execute();
            
            rs= cst.getResultSet();
            
            if(rs.next()){
                txtProducto.setText(rs.getString(1));
                cboMarca.setSelectedItem(rs.getString(2));
                cboCatNvo.setSelectedItem(rs.getString(3));
                txtModelo.setText(rs.getString(4));
                txtSerie.setText(rs.getString(5));
                txtUbicacion.setText(rs.getString(6));
                txtDescrip.setText(rs.getString(7));
                txtUnidMed.setText(rs.getString(8));
                txtPrecio.setText(rs.getString(9));
                rutaAnt=rs.getString(10);
                idProdModif=rs.getInt(11);
                panelImagen.removeAll();
                panelImagen.setIcon(new ImageIcon(rutaProyect+rutaAnt));
                panelImagen.updateUI();
            }
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
    }//GEN-LAST:event_btnBuscarActionPerformed

    private void btnAgregarMarcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarMarcaActionPerformed
        Ventanas.frmNvaMarca ver= new Ventanas.frmNvaMarca(2,null,null,this);
        ver.show();
    }//GEN-LAST:event_btnAgregarMarcaActionPerformed

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        principal.panelContenedor.removeAll();
        principal.panelContenedor.updateUI();
    }//GEN-LAST:event_btnCancelarActionPerformed

    private void cboProdActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboProdActionPerformed
        
    }//GEN-LAST:event_cboProdActionPerformed

    private void btnAgregarCatActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarCatActionPerformed
        Ventanas.frmNuevaCat ver= new Ventanas.frmNuevaCat(2,null,null,this,null);
        ver.show();
    }//GEN-LAST:event_btnAgregarCatActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        CallableStatement cst;
        Connection con=null;
                
        try{
            if(nombreArchivo!=""){
                copiarArchivo.copiarArchivo(rutatotal,rutaProyect+"\\src\\imgProd\\"+nombreArchivo);
            }
            
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paModificarProd (?,?,?,?,?,?,?,?,?,?,?)}");
            cst.setInt(1,idProdModif);
            cst.setString(2,txtProducto.getText());
            cst.setString(3,txtSerie.getText());
            cst.setString(4,txtUnidMed.getText());
            cst.setString(5,txtModelo.getText());
            cst.setDouble(6,Double.parseDouble(txtPrecio.getText()));
            cst.setString(7,txtUbicacion.getText());
            if(nombreArchivo!=""){
                cst.setString(8,"\\src\\imgProd\\"+nombreArchivo);
            }
            else{
                cst.setString(8,rutaAnt);
            }
            
            cst.setInt(9,idMarc[cboMarca.getSelectedIndex()]);
            cst.setInt(10,idCatN[cboCatNvo.getSelectedIndex()]);
            cst.setString(11,txtDescrip.getText());
            
            
            cst.execute();
            JOptionPane.showMessageDialog(null, "Producto Modificado correctamente");
            cst.close();
            con.close();
            limpiar();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        } catch (IOException ex) {
            Logger.getLogger(pnlModificarProd.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnGuardarActionPerformed

    public void limpiar(){
        cboProd.setSelectedIndex(0);
        txtBusqSerie.setText("");
        txtProducto.setText("");
        cboMarca.setSelectedIndex(0);
        cboCatNvo.setSelectedIndex(0);
        txtModelo.setText("");
        txtSerie.setText("");
        txtUbicacion.setText("");
        txtDescrip.setText("");
        txtUnidMed.setText("");
        txtPrecio.setText("");
        
        panelImagen.removeAll();
        panelImagen.setIcon(new ImageIcon(rutatotal));
        panelImagen.updateUI();
        
        nombreArchivo="";
    }
    
    private void btnExaminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnExaminarActionPerformed
        FileDialog dialogoArchivo = null;
        dialogoArchivo = new FileDialog(principal, "Explorador",FileDialog.LOAD);
        dialogoArchivo.setVisible(true);

        if(dialogoArchivo.getFile()!=null){ /* Validar que se haya Seleccionado un Archivo*/
            directorio = dialogoArchivo.getDirectory();
            nombreArchivo =dialogoArchivo.getFile(); 
            rutatotal = directorio + nombreArchivo;
            //System.out.println(directorio+"---"+nombreArchivo+"---"+rutatotal);
            panelImagen.removeAll();
            panelImagen.setIcon(new ImageIcon(rutatotal));
            panelImagen.updateUI();
            
        }
        else{
            rutatotal = "";
            System.out.println("No Seleccionó Archivo");
        }
    }//GEN-LAST:event_btnExaminarActionPerformed

    private void cboProdItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cboProdItemStateChanged
        
    }//GEN-LAST:event_cboProdItemStateChanged


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregarCat;
    private javax.swing.JButton btnAgregarMarca;
    private javax.swing.JButton btnBuscar;
    private rsbuttom.RSButtonMetro btnCancelar;
    private rsbuttom.RSButtonMetro btnExaminar;
    private rsbuttom.RSButtonMetro btnGuardar;
    private javax.swing.JComboBox<String> cboCatNvo;
    private javax.swing.JComboBox<String> cboMarca;
    private javax.swing.JComboBox<String> cboProd;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private org.edisoncor.gui.panel.PanelImage panelImage;
    private org.edisoncor.gui.panel.PanelImage panelImagen;
    private javax.swing.JTextField txtBusqSerie;
    private javax.swing.JTextField txtDescrip;
    private javax.swing.JTextField txtModelo;
    private javax.swing.JTextField txtPrecio;
    private javax.swing.JTextField txtProducto;
    private javax.swing.JTextField txtSerie;
    private javax.swing.JTextField txtUbicacion;
    private javax.swing.JTextField txtUnidMed;
    // End of variables declaration//GEN-END:variables
}
