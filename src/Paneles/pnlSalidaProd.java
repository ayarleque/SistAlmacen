/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paneles;

import Conexion.Conexion;
import clases.ListaCombos;
import java.awt.event.ItemEvent;
import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import sisalmacen.MenuPrincipal;

/**
 *
 * @author Oficina
 */
public class pnlSalidaProd extends javax.swing.JPanel {

     MenuPrincipal principal;
    
    int idCat[];
    int idProd[];
    int idAlmac[];  
    int idTrab[];
    
    int idProdTb[];
    int idAlmTb[];
    int idTrabTb[];
    String unidadTb[];
    Double cantTb[];
    String areaTb[];
    Double stockTb[];
    
    String rutaProyect,rutaFoto;
    CallableStatement cst;
    Connection con=null;
    ResultSet rs;
    DefaultTableModel modelo;
    int UserID, idProduct;
    
    public pnlSalidaProd(MenuPrincipal princ, int idUser) {
        initComponents();
        
        principal=princ;
        rutaProyect=new File ("").getAbsolutePath ();
        listaCat();
        listaProd();
        listaTrab();
        listaAlmacen();
        
        dtDetalle.setAutoResizeMode(dtDetalle.AUTO_RESIZE_LAST_COLUMN);
        
        modelo=new DefaultTableModel();
        modelo.addColumn("Cantidad");
        modelo.addColumn("Producto");
        modelo.addColumn("Almacén");
        modelo.addColumn("Trabajador");
        modelo.addColumn("Area");
        modelo.addColumn("Unidad");
        
        dtDetalle.setModel(modelo);
        dtDetalle.getColumnModel().getColumn(0).setPreferredWidth(70);
        dtDetalle.getColumnModel().getColumn(1).setPreferredWidth(350);
        dtDetalle.getColumnModel().getColumn(3).setPreferredWidth(250);
        dtDetalle.getColumnModel().getColumn(4).setPreferredWidth(150);
        
        UserID=idUser;
        idProdTb=new int[cboProd.getItemCount()];
        idAlmTb=new int[cboProd.getItemCount()];
        cantTb=new Double[cboProd.getItemCount()];
        idTrabTb=new int[cboProd.getItemCount()];
        areaTb=new String[cboProd.getItemCount()];
        unidadTb=new String[cboProd.getItemCount()];
        stockTb=new Double[cboProd.getItemCount()];
    }

    public void listaCat(){
        idCat=clases.ListaCombos.listaCategoria(cboCat,idCat); 
    }
    
    public void listaProd(){
        idProd=ListaCombos.listaProductos(cboProd, idProd);
        
    }
    
    public void listaAlmacen(){
        idAlmac=ListaCombos.listaAlmacen(cboAlmac, idAlmac);
    }
    
    public void listaTrab(){
        idTrab=ListaCombos.listaTrabajadores(cboTrab,idTrab);
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        panelImage = new org.edisoncor.gui.panel.PanelImage();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtCant = new javax.swing.JTextField();
        txtArea = new javax.swing.JTextField();
        btnAgregar = new rsbuttom.RSButtonMetro();
        txtUnid = new javax.swing.JTextField();
        jLabel26 = new javax.swing.JLabel();
        jLabel27 = new javax.swing.JLabel();
        jLabel28 = new javax.swing.JLabel();
        jLabel29 = new javax.swing.JLabel();
        cboTrab = new javax.swing.JComboBox<>();
        jPanel6 = new javax.swing.JPanel();
        jLabel31 = new javax.swing.JLabel();
        jLabel32 = new javax.swing.JLabel();
        jLabel33 = new javax.swing.JLabel();
        cboCat = new javax.swing.JComboBox<>();
        txtSerieProd = new javax.swing.JTextField();
        jLabel34 = new javax.swing.JLabel();
        jLabel35 = new javax.swing.JLabel();
        jLabel36 = new javax.swing.JLabel();
        jLabel37 = new javax.swing.JLabel();
        cboProd = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        cboAlmac = new javax.swing.JComboBox<>();
        btnVerificar = new rsbuttom.RSButtonMetro();
        jPanel4 = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        txtProd = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txtStock = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        txtMarca = new javax.swing.JTextField();
        jLabel16 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        txtModelo = new javax.swing.JTextField();
        jLabel18 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        pnlfoto = new org.edisoncor.gui.panel.PanelImage();
        jLabel20 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        txtUbic = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        dtDetalle = new javax.swing.JTable();
        jPanel5 = new javax.swing.JPanel();
        btnCancelar = new rsbuttom.RSButtonMetro();
        btnGuardar = new rsbuttom.RSButtonMetro();
        btnEliminar = new rsbuttom.RSButtonMetro();

        setBackground(new java.awt.Color(0, 135, 236));

        panelImage.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        panelImage.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Background.png"))); // NOI18N

        jPanel1.setBackground(new java.awt.Color(0, 135, 236));
        jPanel1.setOpaque(false);

        jLabel2.setBackground(new java.awt.Color(255, 255, 255));
        jLabel2.setFont(new java.awt.Font("Poetsen One", 0, 24)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("SALIDA DE PRODUCTOS");
        jLabel2.setAlignmentX(0.5F);

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(255, 255, 255), 2), "", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 11), new java.awt.Color(255, 255, 255)), "Datos de Salida", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Poetsen One", 0, 16), new java.awt.Color(255, 255, 255))); // NOI18N
        jPanel3.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jPanel3.setOpaque(false);

        jLabel1.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Cantidad");

        jLabel3.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Área");

        jLabel4.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText(":");

        jLabel5.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText(":");

        txtCant.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        txtArea.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        btnAgregar.setBackground(new java.awt.Color(0, 102, 0));
        btnAgregar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/agregarPedido.png"))); // NOI18N
        btnAgregar.setText("Agregar");
        btnAgregar.setColorHover(new java.awt.Color(153, 0, 0));
        btnAgregar.setColorNormal(new java.awt.Color(0, 102, 0));
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarActionPerformed(evt);
            }
        });

        txtUnid.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel26.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel26.setForeground(new java.awt.Color(255, 255, 255));
        jLabel26.setText(":");

        jLabel27.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel27.setForeground(new java.awt.Color(255, 255, 255));
        jLabel27.setText("Unidad");

        jLabel28.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel28.setForeground(new java.awt.Color(255, 255, 255));
        jLabel28.setText("Trabajador");

        jLabel29.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel29.setForeground(new java.awt.Color(255, 255, 255));
        jLabel29.setText(":");

        cboTrab.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(26, 26, 26)
                        .addComponent(jLabel4))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel5)))
                .addGap(18, 18, 18)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(txtArea, javax.swing.GroupLayout.DEFAULT_SIZE, 141, Short.MAX_VALUE)
                    .addComponent(txtCant))
                .addGap(69, 69, 69)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel27)
                        .addGap(45, 45, 45)
                        .addComponent(jLabel26))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel28)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel29)))
                .addGap(18, 18, 18)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(txtUnid, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(cboTrab, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addComponent(btnAgregar, javax.swing.GroupLayout.PREFERRED_SIZE, 93, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(48, 48, 48))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel29)
                                .addComponent(jLabel28)
                                .addComponent(cboTrab, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel1)
                                .addComponent(jLabel4)
                                .addComponent(txtCant, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(txtUnid, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jLabel26)
                                .addComponent(jLabel27))
                            .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(txtArea, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jLabel5)
                                .addComponent(jLabel3)))
                        .addGap(0, 5, Short.MAX_VALUE))
                    .addComponent(btnAgregar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(14, 14, 14))
        );

        jPanel6.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(255, 255, 255), 2), "", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 11), new java.awt.Color(255, 255, 255)), "Filtro", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Poetsen One", 0, 16), new java.awt.Color(255, 255, 255))); // NOI18N
        jPanel6.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jPanel6.setOpaque(false);

        jLabel31.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel31.setForeground(new java.awt.Color(255, 255, 255));
        jLabel31.setText("Categoría");

        jLabel32.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel32.setForeground(new java.awt.Color(255, 255, 255));
        jLabel32.setText(":");

        jLabel33.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel33.setForeground(new java.awt.Color(255, 255, 255));
        jLabel33.setText(":");

        cboCat.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        cboCat.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cboCatItemStateChanged(evt);
            }
        });

        txtSerieProd.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        txtSerieProd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtSerieProdActionPerformed(evt);
            }
        });

        jLabel34.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel34.setForeground(new java.awt.Color(255, 255, 255));
        jLabel34.setText("Serie Prod.");

        jLabel35.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel35.setForeground(new java.awt.Color(255, 255, 255));
        jLabel35.setText(":");

        jLabel36.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel36.setForeground(new java.awt.Color(255, 255, 255));
        jLabel36.setText("Producto");

        jLabel37.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel37.setForeground(new java.awt.Color(255, 255, 255));
        jLabel37.setText(":");

        cboProd.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        cboProd.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cboProdItemStateChanged(evt);
            }
        });

        jLabel7.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Almacén");

        cboAlmac.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        btnVerificar.setBackground(new java.awt.Color(0, 102, 0));
        btnVerificar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/aceptar.png"))); // NOI18N
        btnVerificar.setText("Verificar Stock");
        btnVerificar.setColorHover(new java.awt.Color(153, 0, 0));
        btnVerificar.setColorNormal(new java.awt.Color(0, 102, 0));
        btnVerificar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnVerificarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel6Layout.createSequentialGroup()
                                .addComponent(jLabel7)
                                .addGap(28, 28, 28)
                                .addComponent(jLabel37))
                            .addGroup(jPanel6Layout.createSequentialGroup()
                                .addComponent(jLabel36)
                                .addGap(27, 27, 27)
                                .addComponent(jLabel35))
                            .addGroup(jPanel6Layout.createSequentialGroup()
                                .addComponent(jLabel31)
                                .addGap(26, 26, 26)
                                .addComponent(jLabel32))
                            .addGroup(jPanel6Layout.createSequentialGroup()
                                .addComponent(jLabel34)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel33)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(txtSerieProd)
                            .addComponent(cboAlmac, javax.swing.GroupLayout.Alignment.LEADING, 0, 172, Short.MAX_VALUE)
                            .addComponent(cboProd, javax.swing.GroupLayout.Alignment.LEADING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(cboCat, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGap(72, 72, 72)
                        .addComponent(btnVerificar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(23, Short.MAX_VALUE))
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cboCat, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel32)
                    .addComponent(jLabel31))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel33)
                    .addComponent(jLabel34)
                    .addComponent(txtSerieProd, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel35)
                    .addComponent(jLabel36)
                    .addComponent(cboProd, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel37)
                    .addComponent(jLabel7)
                    .addComponent(cboAlmac, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(btnVerificar, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                .addGap(10, 10, 10))
        );

        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(255, 255, 255), 2), "", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 11), new java.awt.Color(255, 255, 255)), "Detalles de Producto", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Poetsen One", 0, 16), new java.awt.Color(255, 255, 255))); // NOI18N
        jPanel4.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jPanel4.setOpaque(false);

        jLabel6.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Producto");

        jLabel8.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText(":");

        txtProd.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel10.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(255, 255, 255));
        jLabel10.setText("Stock");

        jLabel11.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(255, 255, 255));
        jLabel11.setText(":");

        txtStock.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel12.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel12.setForeground(new java.awt.Color(255, 255, 255));
        jLabel12.setText("Marca");

        jLabel13.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel13.setForeground(new java.awt.Color(255, 255, 255));
        jLabel13.setText(":");

        txtMarca.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel16.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel16.setForeground(new java.awt.Color(255, 255, 255));
        jLabel16.setText("Modelo");

        jLabel17.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel17.setForeground(new java.awt.Color(255, 255, 255));
        jLabel17.setText(":");

        txtModelo.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        jLabel18.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel18.setForeground(new java.awt.Color(255, 255, 255));
        jLabel18.setText("Foto");

        jLabel19.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel19.setForeground(new java.awt.Color(255, 255, 255));
        jLabel19.setText(":");

        pnlfoto.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        javax.swing.GroupLayout pnlfotoLayout = new javax.swing.GroupLayout(pnlfoto);
        pnlfoto.setLayout(pnlfotoLayout);
        pnlfotoLayout.setHorizontalGroup(
            pnlfotoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 127, Short.MAX_VALUE)
        );
        pnlfotoLayout.setVerticalGroup(
            pnlfotoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 112, Short.MAX_VALUE)
        );

        jLabel20.setFont(new java.awt.Font("Poetsen One", 0, 14)); // NOI18N
        jLabel20.setForeground(new java.awt.Color(255, 255, 255));
        jLabel20.setText("Ubicación");

        jLabel21.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jLabel21.setForeground(new java.awt.Color(255, 255, 255));
        jLabel21.setText(":");

        txtUbic.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addGap(26, 26, 26)
                        .addComponent(jLabel8))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGap(87, 87, 87)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel11)
                            .addComponent(jLabel13, javax.swing.GroupLayout.Alignment.TRAILING)))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel16)
                        .addGap(38, 38, 38)
                        .addComponent(jLabel17))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel20)
                        .addGap(26, 26, 26)
                        .addComponent(jLabel21)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(txtModelo, javax.swing.GroupLayout.DEFAULT_SIZE, 136, Short.MAX_VALUE)
                            .addComponent(txtMarca, javax.swing.GroupLayout.DEFAULT_SIZE, 136, Short.MAX_VALUE)
                            .addComponent(txtStock, javax.swing.GroupLayout.DEFAULT_SIZE, 136, Short.MAX_VALUE)
                            .addComponent(txtUbic))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 57, Short.MAX_VALUE)
                        .addComponent(jLabel18)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel19)
                        .addGap(6, 6, 6)
                        .addComponent(pnlfoto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(txtProd))
                .addGap(18, 18, 18))
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel12)
                    .addComponent(jLabel10))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(jLabel8)
                    .addComponent(txtProd, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(12, 12, 12)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel10)
                            .addComponent(jLabel11)
                            .addComponent(txtStock, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel18)
                            .addComponent(jLabel19))
                        .addGap(13, 13, 13)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel12)
                            .addComponent(jLabel13)
                            .addComponent(txtMarca, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtUbic, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel20)
                            .addComponent(jLabel21))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel16)
                            .addComponent(jLabel17)
                            .addComponent(txtModelo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(pnlfoto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        dtDetalle.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(dtDetalle);

        jPanel5.setOpaque(false);

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

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addGap(230, 230, 230)
                .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(98, 98, 98)
                .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(263, Short.MAX_VALUE))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel5Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        btnEliminar.setBackground(new java.awt.Color(0, 102, 0));
        btnEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/EliminarB.png"))); // NOI18N
        btnEliminar.setText("Eliminar");
        btnEliminar.setColorHover(new java.awt.Color(153, 0, 0));
        btnEliminar.setColorNormal(new java.awt.Color(0, 102, 0));
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(336, 336, 336)
                        .addComponent(jLabel2))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addComponent(jPanel5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(29, 29, 29)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(10, 10, 10)
                                .addComponent(btnEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addGroup(jPanel1Layout.createSequentialGroup()
                                    .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addComponent(jScrollPane1)))))
                .addContainerGap(27, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 164, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnEliminar, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(3, 3, 3)
                .addComponent(jPanel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout panelImageLayout = new javax.swing.GroupLayout(panelImage);
        panelImage.setLayout(panelImageLayout);
        panelImageLayout.setHorizontalGroup(
            panelImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        panelImageLayout.setVerticalGroup(
            panelImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(panelImageLayout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 22, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panelImage, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(panelImage, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    private void txtSerieProdActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtSerieProdActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtSerieProdActionPerformed

    private void cboCatItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cboCatItemStateChanged
        if (cboCat.getSelectedIndex()!=0 && evt.getStateChange() == ItemEvent.SELECTED)//evt.getStateChange() == ItemEvent.SELECTED) 
        {
            //System.out.println("entro");
            idProd=ListaCombos.listaProdxCat(cboProd, idProd, idCat[cboCat.getSelectedIndex()] );
        }
    }//GEN-LAST:event_cboCatItemStateChanged

    private void cboProdItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cboProdItemStateChanged
        /*if (cboProd.getSelectedIndex()!=0 && evt.getStateChange() == ItemEvent.SELECTED)//evt.getStateChange() == ItemEvent.SELECTED) 
        {
            MostrarDatosProd(idProd[cboProd.getSelectedIndex()],txtSerieProd.getText());
        }*/
    }//GEN-LAST:event_cboProdItemStateChanged

    private void btnVerificarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnVerificarActionPerformed
        if ((cboProd.getSelectedIndex()!=0 || !txtSerieProd.getText().equals("")) && cboAlmac.getSelectedIndex()!=0)//evt.getStateChange() == ItemEvent.SELECTED) 
        {
            MostrarDatosProd(idProd[cboProd.getSelectedIndex()],txtSerieProd.getText(),idAlmac[cboAlmac.getSelectedIndex()]);
        } else JOptionPane.showMessageDialog(null, "Por favor especifique el producto y/o almacén");
    }//GEN-LAST:event_btnVerificarActionPerformed

    private void btnAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarActionPerformed
        try {
            //System.out.println("entro al try");
            if(validarCamposVacios()){
                //System.out.println("entro a la primera condicion");
                if(Double.parseDouble(txtCant.getText())<=Double.parseDouble(txtStock.getText())){
                    //System.out.println("entro a la ultima condicion");
                    idProdTb[dtDetalle.getRowCount()]=idProd[cboProd.getSelectedIndex()];
                    idAlmTb[dtDetalle.getRowCount()]=idAlmac[cboAlmac.getSelectedIndex()];
                    cantTb[dtDetalle.getRowCount()]=Double.parseDouble(txtCant.getText());
                    idTrabTb[dtDetalle.getRowCount()]=idTrab[cboTrab.getSelectedIndex()];
                    unidadTb[dtDetalle.getRowCount()]=txtUnid.getText();
                    areaTb[dtDetalle.getRowCount()]=txtArea.getText();
                    stockTb[dtDetalle.getRowCount()]=Double.parseDouble(txtStock.getText())-Double.parseDouble(txtCant.getText());
                    //System.out.println("lleno los array");
                    modelo.addRow(new Object[]{txtCant.getText(),txtProd.getText(),cboAlmac.getSelectedItem(),cboTrab.getSelectedItem(),txtArea.getText(),txtUnid.getText()});
                }
                else JOptionPane.showMessageDialog(null, "su requerimiento no puede ser procesado.\nEl Stock es de "+txtStock.getText()+" en el almacén");
            }
        else JOptionPane.showMessageDialog(null, "Por favor llene todos los campos");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Error: "+e.toString());
        }
        
    }//GEN-LAST:event_btnAgregarActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed
        try {
            if(dtDetalle.getSelectedRow()!=-1){
                int temp=0;
                double tmp;
                String tmpSrt;
                for (int i = dtDetalle.getSelectedRow()+1; i <dtDetalle.getRowCount()+1 ; i++) {
                    //System.out.println("longitud de arreglo de tabla"+idProdTb.length);
                    temp=idProdTb[i];
                    idProdTb[i-1]=temp;

                    temp=idAlmTb[i];
                    idAlmTb[i-1]=temp;

                    tmp=cantTb[i];
                    cantTb[i-1]=tmp;
                    
                    temp= idTrabTb[i];
                    idTrabTb[i-1]=temp;
                    
                    tmpSrt=areaTb[i];
                    areaTb[i-1]=tmpSrt;
                    
                    tmpSrt=unidadTb[i];
                    unidadTb[i-1]=tmpSrt;
                }
                modelo.removeRow(dtDetalle.getSelectedRow());
                
            }
            else JOptionPane.showMessageDialog(null,"Por favor, seleccione la fila de la tabla que desea eliminar");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Error: "+e);
        }

    }//GEN-LAST:event_btnEliminarActionPerformed

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        principal.panelContenedor.removeAll();
        principal.panelContenedor.updateUI();
    }//GEN-LAST:event_btnCancelarActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        if(dtDetalle.getRowCount()==0){
            JOptionPane.showMessageDialog(null, "Salida no registrada porque la tabla no contiene productos");
            System.out.println("no ingresó");
        }
        else{
            try{
                int i=0;
                con=Conexion.getconnection();
                
                while (i<dtDetalle.getRowCount()){
                    cst=con.prepareCall("{call paRegistraSalidaProd (?,?,?,?,?,?,?,?)}");
                    /*System.out.println("id compra: "+idCompr[cboCompra.getSelectedIndex()]);
                    System.out.println("id producto: "+idProdTb[i]);
                    System.out.println("id almacen: "+idAlmTb[i]);*/
                    cst.setInt(1,idProdTb[i]);
                    cst.setInt(2,idAlmTb[i]);
                    cst.setDouble(3,cantTb[i]);
                    cst.setInt(4,UserID);
                    cst.setDouble(5,idTrabTb[i]);
                    cst.setString(6, areaTb[i]);
                    //System.out.println("unidad: "+unidadTb[i]);
                    cst.setString(7, unidadTb[i]);
                    cst.setDouble(8,stockTb[i]);
                    //System.out.println("id user: "+UserID);
                    
                    i++;
                    cst.execute();
                }

                JOptionPane.showMessageDialog(null, "Salida registrada del almacén \""+cboAlmac.getSelectedItem()+"\" correctamente");
                cst.close();
                con.close();
                principal.panelContenedor.removeAll();
                principal.panelContenedor.updateUI();
            }
            catch (SQLException ex){
                
                JOptionPane.showMessageDialog(null,"Error: "+ ex);
            }
        }
    }//GEN-LAST:event_btnGuardarActionPerformed

    public boolean validarCamposVacios(){
        return cboTrab.getSelectedIndex()>0 && !txtCant.getText().equals("") && !txtArea.getText().equals("") && !txtUnid.getText().equals("");
    }
    
     public void MostrarDatosProd(int id, String serie, int idAlm){
        txtMarca.setText("");
        txtModelo.setText("");
        
        pnlfoto.removeAll();
        pnlfoto.updateUI();
        
        try{
            con=Conexion.getconnection();
        
            cst=con.prepareCall("{call paMuestraDatosProdxAlmac(?,?,?)}");
            cst.setInt(1, id);
            cst.setString(2, serie);
            cst.setInt(3, idAlm);
            cst.execute();
            
            rs= cst.getResultSet();
            
            if(rs.next()){
                txtProd.setText(rs.getString(1));
                cboProd.setSelectedItem(rs.getString(1));
                txtMarca.setText(rs.getString(2));
                txtModelo.setText(rs.getString(4));
                txtUbic.setText(rs.getString(6));
                rutaFoto=rs.getString(10);
                pnlfoto.setIcon(new ImageIcon(rutaProyect+rutaFoto));
                pnlfoto.updateUI(); 
                idProduct=rs.getInt(11);
                txtStock.setText(rs.getDouble(12)+"");
            }
            else JOptionPane.showMessageDialog(null,"Producto no encontrado");
            cst.close();
            rs.close();
            con.close();
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null,"Error: "+ ex);
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private rsbuttom.RSButtonMetro btnAgregar;
    private rsbuttom.RSButtonMetro btnCancelar;
    private rsbuttom.RSButtonMetro btnEliminar;
    private rsbuttom.RSButtonMetro btnGuardar;
    private rsbuttom.RSButtonMetro btnVerificar;
    private javax.swing.JComboBox<String> cboAlmac;
    private javax.swing.JComboBox<String> cboCat;
    private javax.swing.JComboBox<String> cboProd;
    private javax.swing.JComboBox<String> cboTrab;
    private javax.swing.JTable dtDetalle;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel28;
    private javax.swing.JLabel jLabel29;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel31;
    private javax.swing.JLabel jLabel32;
    private javax.swing.JLabel jLabel33;
    private javax.swing.JLabel jLabel34;
    private javax.swing.JLabel jLabel35;
    private javax.swing.JLabel jLabel36;
    private javax.swing.JLabel jLabel37;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JScrollPane jScrollPane1;
    private org.edisoncor.gui.panel.PanelImage panelImage;
    private org.edisoncor.gui.panel.PanelImage pnlfoto;
    private javax.swing.JTextField txtArea;
    private javax.swing.JTextField txtCant;
    private javax.swing.JTextField txtMarca;
    private javax.swing.JTextField txtModelo;
    private javax.swing.JTextField txtProd;
    private javax.swing.JTextField txtSerieProd;
    private javax.swing.JTextField txtStock;
    private javax.swing.JTextField txtUbic;
    private javax.swing.JTextField txtUnid;
    // End of variables declaration//GEN-END:variables
}
