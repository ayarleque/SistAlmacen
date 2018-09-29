/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sisalmacen;

import java.awt.Dimension;
import javax.swing.JPanel;

/**
 *
 * @author CONTABILIDAD_3
 */
public class MenuPrincipal extends javax.swing.JFrame {

    String usuario,userID;
    int nivel;
    public MenuPrincipal(String nomUser,int nivel,String idUser) {
        initComponents();
        setLocationRelativeTo(null);
        usuario=nomUser;
        this.nivel=nivel;
        userID=idUser;
        lblUsuario.setText(usuario);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        panelImage = new org.edisoncor.gui.panel.PanelImage();
        panelContenedor = new javax.swing.JPanel();
        PanelMenu = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        lblUsuario = new javax.swing.JLabel();
        lblUsuario1 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jPanel4 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenu5 = new javax.swing.JMenu();
        jMenuItem8 = new javax.swing.JMenuItem();
        jMenuItem9 = new javax.swing.JMenuItem();
        menuElimProd = new javax.swing.JMenuItem();
        jMenu6 = new javax.swing.JMenu();
        MenuNvaCat = new javax.swing.JMenuItem();
        MenuModifCat = new javax.swing.JMenuItem();
        MenuEliminCat = new javax.swing.JMenuItem();
        jMenu7 = new javax.swing.JMenu();
        MenuNvaMarca = new javax.swing.JMenuItem();
        MenuModifMarca = new javax.swing.JMenuItem();
        MenuEliminarMarca = new javax.swing.JMenuItem();
        jMenu8 = new javax.swing.JMenu();
        MenuNvoProv = new javax.swing.JMenuItem();
        MenuModifProv = new javax.swing.JMenuItem();
        MenuElimProv = new javax.swing.JMenuItem();
        jMenu9 = new javax.swing.JMenu();
        MenuNvoTrab = new javax.swing.JMenuItem();
        MenuModifTrab = new javax.swing.JMenuItem();
        MenuEliminarTrab = new javax.swing.JMenuItem();
        jMenu10 = new javax.swing.JMenu();
        MenuAsigUser = new javax.swing.JMenuItem();
        MenuModifUser = new javax.swing.JMenuItem();
        MenuEliminUser = new javax.swing.JMenuItem();
        jMenu11 = new javax.swing.JMenu();
        MenuNvoAlmacen = new javax.swing.JMenuItem();
        MenuModifAlmacen = new javax.swing.JMenuItem();
        MenuEliminAlmac = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenu12 = new javax.swing.JMenu();
        MenuNvoPedido = new javax.swing.JMenuItem();
        menuValidarPedid = new javax.swing.JMenuItem();
        MenuValidaCompra = new javax.swing.JMenuItem();
        jMenu13 = new javax.swing.JMenu();
        MenuIngrProd = new javax.swing.JMenuItem();
        MenuSalidProd = new javax.swing.JMenuItem();
        jMenu3 = new javax.swing.JMenu();
        jMenu4 = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Menú Principal");
        setLocation(new java.awt.Point(0, 0));
        setResizable(false);
        setSize(new java.awt.Dimension(0, 0));

        panelImage.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        panelImage.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Background.png"))); // NOI18N

        panelContenedor.setBackground(new java.awt.Color(0, 135, 236));
        panelContenedor.setOpaque(false);

        javax.swing.GroupLayout panelContenedorLayout = new javax.swing.GroupLayout(panelContenedor);
        panelContenedor.setLayout(panelContenedorLayout);
        panelContenedorLayout.setHorizontalGroup(
            panelContenedorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 718, Short.MAX_VALUE)
        );
        panelContenedorLayout.setVerticalGroup(
            panelContenedorLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 492, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout panelImageLayout = new javax.swing.GroupLayout(panelImage);
        panelImage.setLayout(panelImageLayout);
        panelImageLayout.setHorizontalGroup(
            panelImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 718, Short.MAX_VALUE)
            .addGroup(panelImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(panelContenedor, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        panelImageLayout.setVerticalGroup(
            panelImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 492, Short.MAX_VALUE)
            .addGroup(panelImageLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(panelContenedor, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        PanelMenu.setBackground(new java.awt.Color(153, 153, 153));

        jPanel2.setBackground(new java.awt.Color(153, 153, 153));

        lblUsuario.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        lblUsuario.setForeground(new java.awt.Color(255, 255, 255));

        lblUsuario1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        lblUsuario1.setForeground(new java.awt.Color(255, 255, 255));
        lblUsuario1.setText("Usuario:");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lblUsuario1, javax.swing.GroupLayout.DEFAULT_SIZE, 48, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lblUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(lblUsuario1)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(lblUsuario, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );

        jPanel3.setBackground(new java.awt.Color(153, 153, 153));
        jPanel3.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Fecha y hora");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, 73, Short.MAX_VALUE)
                .addGap(109, 109, 109))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel3)
                .addContainerGap())
        );

        jPanel4.setBackground(new java.awt.Color(153, 153, 153));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("© Todos los derechos reservados");

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 198, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(40, 40, 40))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout PanelMenuLayout = new javax.swing.GroupLayout(PanelMenu);
        PanelMenu.setLayout(PanelMenuLayout);
        PanelMenuLayout.setHorizontalGroup(
            PanelMenuLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelMenuLayout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        PanelMenuLayout.setVerticalGroup(
            PanelMenuLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        jMenuBar1.setBackground(new java.awt.Color(252, 253, 242));
        jMenuBar1.setBorder(null);
        jMenuBar1.setForeground(new java.awt.Color(252, 253, 242));
        jMenuBar1.setToolTipText("");

        jMenu1.setBackground(new java.awt.Color(252, 253, 242));
        jMenu1.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jMenu1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/maestro.png"))); // NOI18N
        jMenu1.setText("Maestro");
        jMenu1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenu1.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        jMenu1.setFont(new java.awt.Font("Poetsen One", 0, 16)); // NOI18N

        jMenu5.setBackground(new java.awt.Color(255, 255, 204));
        jMenu5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/RegistroProd.png"))); // NOI18N
        jMenu5.setText("Producto");
        jMenu5.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        jMenuItem8.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jMenuItem8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ingresar.png"))); // NOI18N
        jMenuItem8.setText("Nuevo");
        jMenuItem8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem8ActionPerformed(evt);
            }
        });
        jMenu5.add(jMenuItem8);

        jMenuItem9.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        jMenuItem9.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/modificar.png"))); // NOI18N
        jMenuItem9.setText("Modificar");
        jMenuItem9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem9ActionPerformed(evt);
            }
        });
        jMenu5.add(jMenuItem9);

        menuElimProd.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        menuElimProd.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png"))); // NOI18N
        menuElimProd.setText("Eliminar");
        menuElimProd.setName(""); // NOI18N
        menuElimProd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuElimProdActionPerformed(evt);
            }
        });
        jMenu5.add(menuElimProd);

        jMenu1.add(jMenu5);

        jMenu6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/categoria.png"))); // NOI18N
        jMenu6.setText("Categoría Prod.");
        jMenu6.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        MenuNvaCat.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuNvaCat.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ingresar.png"))); // NOI18N
        MenuNvaCat.setText("Nuevo");
        MenuNvaCat.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuNvaCatActionPerformed(evt);
            }
        });
        jMenu6.add(MenuNvaCat);

        MenuModifCat.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuModifCat.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/modificar.png"))); // NOI18N
        MenuModifCat.setText("Modificar");
        MenuModifCat.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuModifCatActionPerformed(evt);
            }
        });
        jMenu6.add(MenuModifCat);

        MenuEliminCat.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuEliminCat.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png"))); // NOI18N
        MenuEliminCat.setText("Eliminar");
        MenuEliminCat.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuEliminCatActionPerformed(evt);
            }
        });
        jMenu6.add(MenuEliminCat);

        jMenu1.add(jMenu6);

        jMenu7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/marca.png"))); // NOI18N
        jMenu7.setText("Marca Prod.");
        jMenu7.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        MenuNvaMarca.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuNvaMarca.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ingresar.png"))); // NOI18N
        MenuNvaMarca.setText("Nuevo");
        MenuNvaMarca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuNvaMarcaActionPerformed(evt);
            }
        });
        jMenu7.add(MenuNvaMarca);

        MenuModifMarca.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuModifMarca.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/modificar.png"))); // NOI18N
        MenuModifMarca.setText("Modificar");
        MenuModifMarca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuModifMarcaActionPerformed(evt);
            }
        });
        jMenu7.add(MenuModifMarca);

        MenuEliminarMarca.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuEliminarMarca.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png"))); // NOI18N
        MenuEliminarMarca.setText("Eliminar");
        MenuEliminarMarca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuEliminarMarcaActionPerformed(evt);
            }
        });
        jMenu7.add(MenuEliminarMarca);

        jMenu1.add(jMenu7);

        jMenu8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/proveedor.png"))); // NOI18N
        jMenu8.setText("Proveedor");
        jMenu8.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        MenuNvoProv.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuNvoProv.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ingresar.png"))); // NOI18N
        MenuNvoProv.setText("Nuevo");
        MenuNvoProv.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuNvoProvActionPerformed(evt);
            }
        });
        jMenu8.add(MenuNvoProv);

        MenuModifProv.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuModifProv.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/modificar.png"))); // NOI18N
        MenuModifProv.setText("Modificar");
        MenuModifProv.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuModifProvActionPerformed(evt);
            }
        });
        jMenu8.add(MenuModifProv);

        MenuElimProv.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuElimProv.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png"))); // NOI18N
        MenuElimProv.setText("Eliminar");
        MenuElimProv.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuElimProvActionPerformed(evt);
            }
        });
        jMenu8.add(MenuElimProv);

        jMenu1.add(jMenu8);

        jMenu9.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/trabajador.png"))); // NOI18N
        jMenu9.setText("Trabajador");
        jMenu9.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        MenuNvoTrab.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuNvoTrab.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ingresar.png"))); // NOI18N
        MenuNvoTrab.setText("Nuevo");
        MenuNvoTrab.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuNvoTrabActionPerformed(evt);
            }
        });
        jMenu9.add(MenuNvoTrab);

        MenuModifTrab.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuModifTrab.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/modificar.png"))); // NOI18N
        MenuModifTrab.setText("Modificar");
        MenuModifTrab.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuModifTrabActionPerformed(evt);
            }
        });
        jMenu9.add(MenuModifTrab);

        MenuEliminarTrab.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuEliminarTrab.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png"))); // NOI18N
        MenuEliminarTrab.setText("Eliminar");
        MenuEliminarTrab.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuEliminarTrabActionPerformed(evt);
            }
        });
        jMenu9.add(MenuEliminarTrab);

        jMenu1.add(jMenu9);

        jMenu10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/usuarios.png"))); // NOI18N
        jMenu10.setText("Usuario");
        jMenu10.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        MenuAsigUser.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuAsigUser.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/nuevo-usuario.png"))); // NOI18N
        MenuAsigUser.setText("Asignar");
        MenuAsigUser.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuAsigUserActionPerformed(evt);
            }
        });
        jMenu10.add(MenuAsigUser);

        MenuModifUser.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuModifUser.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/modificar.png"))); // NOI18N
        MenuModifUser.setText("Modificar");
        MenuModifUser.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuModifUserActionPerformed(evt);
            }
        });
        jMenu10.add(MenuModifUser);

        MenuEliminUser.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuEliminUser.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png"))); // NOI18N
        MenuEliminUser.setText("Eliminar");
        MenuEliminUser.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuEliminUserActionPerformed(evt);
            }
        });
        jMenu10.add(MenuEliminUser);

        jMenu1.add(jMenu10);

        jMenu11.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/almacen.png"))); // NOI18N
        jMenu11.setText("Almacén");
        jMenu11.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        MenuNvoAlmacen.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuNvoAlmacen.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ingresar.png"))); // NOI18N
        MenuNvoAlmacen.setText("Nuevo");
        MenuNvoAlmacen.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuNvoAlmacenActionPerformed(evt);
            }
        });
        jMenu11.add(MenuNvoAlmacen);

        MenuModifAlmacen.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuModifAlmacen.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/modificar.png"))); // NOI18N
        MenuModifAlmacen.setText("Modificar");
        MenuModifAlmacen.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuModifAlmacenActionPerformed(evt);
            }
        });
        jMenu11.add(MenuModifAlmacen);

        MenuEliminAlmac.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuEliminAlmac.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png"))); // NOI18N
        MenuEliminAlmac.setText("Eliminar");
        MenuEliminAlmac.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuEliminAlmacActionPerformed(evt);
            }
        });
        jMenu11.add(MenuEliminAlmac);

        jMenu1.add(jMenu11);

        jMenuBar1.add(jMenu1);

        jMenu2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/gestiones.png"))); // NOI18N
        jMenu2.setText("Gestiones");
        jMenu2.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        jMenu2.setFont(new java.awt.Font("Poetsen One", 0, 16)); // NOI18N

        jMenu12.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/pedido.png"))); // NOI18N
        jMenu12.setText("Pedido");
        jMenu12.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        MenuNvoPedido.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuNvoPedido.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ingresar.png"))); // NOI18N
        MenuNvoPedido.setText("Nuevo");
        MenuNvoPedido.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuNvoPedidoActionPerformed(evt);
            }
        });
        jMenu12.add(MenuNvoPedido);

        menuValidarPedid.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        menuValidarPedid.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/validaPedido.png"))); // NOI18N
        menuValidarPedid.setText("Validar");
        menuValidarPedid.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuValidarPedidActionPerformed(evt);
            }
        });
        jMenu12.add(menuValidarPedid);

        jMenu2.add(jMenu12);

        MenuValidaCompra.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N
        MenuValidaCompra.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/validarCompra.png"))); // NOI18N
        MenuValidaCompra.setText("Validar Compra");
        MenuValidaCompra.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuValidaCompraActionPerformed(evt);
            }
        });
        jMenu2.add(MenuValidaCompra);

        jMenu13.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/nuevoPedido.png"))); // NOI18N
        jMenu13.setText("Mov. Producto");
        jMenu13.setFont(new java.awt.Font("Poetsen One", 0, 13)); // NOI18N

        MenuIngrProd.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_R, java.awt.event.InputEvent.CTRL_MASK));
        MenuIngrProd.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuIngrProd.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/recepcionarProd.png"))); // NOI18N
        MenuIngrProd.setText("Recepcionar");
        MenuIngrProd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuIngrProdActionPerformed(evt);
            }
        });
        jMenu13.add(MenuIngrProd);

        MenuSalidProd.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_S, java.awt.event.InputEvent.CTRL_MASK));
        MenuSalidProd.setFont(new java.awt.Font("Poetsen One", 0, 12)); // NOI18N
        MenuSalidProd.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/salidaProd.png"))); // NOI18N
        MenuSalidProd.setText("Retirar");
        MenuSalidProd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MenuSalidProdActionPerformed(evt);
            }
        });
        jMenu13.add(MenuSalidProd);

        jMenu2.add(jMenu13);

        jMenuBar1.add(jMenu2);

        jMenu3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/reporte.png"))); // NOI18N
        jMenu3.setText("Reportes");
        jMenu3.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        jMenu3.setFont(new java.awt.Font("Poetsen One", 0, 16)); // NOI18N
        jMenuBar1.add(jMenu3);

        jMenu4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/inventario.png"))); // NOI18N
        jMenu4.setText("Inventario");
        jMenu4.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        jMenu4.setFont(new java.awt.Font("Poetsen One", 0, 16)); // NOI18N
        jMenuBar1.add(jMenu4);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(PanelMenu, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(panelImage, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(panelImage, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(PanelMenu, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    
    private void MenuIngrProdActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuIngrProdActionPerformed
        Paneles.pnlIngresoProd ver=new Paneles.pnlIngresoProd();
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_MenuIngrProdActionPerformed

    private void jMenuItem8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem8ActionPerformed
        Paneles.PnlRegistrarProd ver=new Paneles.PnlRegistrarProd(userID,this);
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_jMenuItem8ActionPerformed

    private void jMenuItem9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem9ActionPerformed
        Paneles.pnlModificarProd ver=new Paneles.pnlModificarProd(userID,this);
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_jMenuItem9ActionPerformed

    private void menuElimProdActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuElimProdActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmEliminarProducto ver= new Ventanas.frmEliminarProducto();
        ver.show();
    }//GEN-LAST:event_menuElimProdActionPerformed

    private void MenuNvaCatActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuNvaCatActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmNuevaCat ver = new Ventanas.frmNuevaCat(0,this,null,null);
        ver.show();
    }//GEN-LAST:event_MenuNvaCatActionPerformed

    private void MenuModifCatActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuModifCatActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmModificarCat ver = new Ventanas.frmModificarCat();
        ver.show();
    }//GEN-LAST:event_MenuModifCatActionPerformed

    private void MenuEliminCatActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuEliminCatActionPerformed
        Paneles.pnlEliminarCat ver=new Paneles.pnlEliminarCat();
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_MenuEliminCatActionPerformed

    private void MenuNvaMarcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuNvaMarcaActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmNvaMarca ver = new Ventanas.frmNvaMarca(0,this,null,null);
        ver.show();
    }//GEN-LAST:event_MenuNvaMarcaActionPerformed

    private void MenuModifMarcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuModifMarcaActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmModificMarca ver= new Ventanas.frmModificMarca();
        ver.show();
    }//GEN-LAST:event_MenuModifMarcaActionPerformed

    private void MenuEliminarMarcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuEliminarMarcaActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmEliminarMarca ver=new Ventanas.frmEliminarMarca();
        ver.show();
    }//GEN-LAST:event_MenuEliminarMarcaActionPerformed

    private void MenuNvoProvActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuNvoProvActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmNvoProveedor ver = new Ventanas.frmNvoProveedor();
        ver.show();
    }//GEN-LAST:event_MenuNvoProvActionPerformed

    private void MenuModifProvActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuModifProvActionPerformed
        Paneles.pnlModificarProv ver=new Paneles.pnlModificarProv();
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_MenuModifProvActionPerformed

    private void MenuElimProvActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuElimProvActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmEliminarProv ver = new Ventanas.frmEliminarProv();
        ver.show();
    }//GEN-LAST:event_MenuElimProvActionPerformed

    private void MenuNvoTrabActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuNvoTrabActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmNvoTrabajador ver = new Ventanas.frmNvoTrabajador();
        ver.show();
    }//GEN-LAST:event_MenuNvoTrabActionPerformed

    private void MenuModifTrabActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuModifTrabActionPerformed
        Paneles.pnlModifTrab ver=new Paneles.pnlModifTrab();
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_MenuModifTrabActionPerformed

    private void MenuEliminarTrabActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuEliminarTrabActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmEliminarTrab ver = new Ventanas.frmEliminarTrab();
        ver.show();
    }//GEN-LAST:event_MenuEliminarTrabActionPerformed

    private void MenuAsigUserActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuAsigUserActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmAsignarUser ver = new Ventanas.frmAsignarUser();
        ver.show();
    }//GEN-LAST:event_MenuAsigUserActionPerformed

    private void MenuModifUserActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuModifUserActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmModifUser ver = new Ventanas.frmModifUser();
        ver.show();
    }//GEN-LAST:event_MenuModifUserActionPerformed

    private void MenuEliminUserActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuEliminUserActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmEliminarUser ver = new Ventanas.frmEliminarUser();
        ver.show();
    }//GEN-LAST:event_MenuEliminUserActionPerformed

    private void MenuNvoAlmacenActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuNvoAlmacenActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmNvoAlmacen ver = new Ventanas.frmNvoAlmacen();
        ver.show();
    }//GEN-LAST:event_MenuNvoAlmacenActionPerformed

    private void MenuModifAlmacenActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuModifAlmacenActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmModifAlmacen ver = new Ventanas.frmModifAlmacen();
        ver.show();
    }//GEN-LAST:event_MenuModifAlmacenActionPerformed

    private void MenuEliminAlmacActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuEliminAlmacActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmEliminarAlmac ver = new Ventanas.frmEliminarAlmac();
        ver.show();
    }//GEN-LAST:event_MenuEliminAlmacActionPerformed

    private void MenuNvoPedidoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuNvoPedidoActionPerformed
        Paneles.pnlNvoPedido ver=new Paneles.pnlNvoPedido(this);
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_MenuNvoPedidoActionPerformed

    private void menuValidarPedidActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuValidarPedidActionPerformed
        Paneles.pnlValidarPedido ver=new Paneles.pnlValidarPedido();
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_menuValidarPedidActionPerformed

    private void MenuValidaCompraActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuValidaCompraActionPerformed
        panelContenedor.removeAll();
        panelContenedor.updateUI();
        Ventanas.frmValidarCompra ver = new Ventanas.frmValidarCompra();
        ver.show();
    }//GEN-LAST:event_MenuValidaCompraActionPerformed

    private void MenuSalidProdActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MenuSalidProdActionPerformed
        Paneles.pnlSalidaProd ver=new Paneles.pnlSalidaProd();
        cargarPanel(panelContenedor,ver );
    }//GEN-LAST:event_MenuSalidProdActionPerformed

    private void cargarPanel(JPanel contenedor, JPanel contenedorHijo)
    {
        // Se definen los tamanos iniciales de cada uno
        final Dimension tamanoJFrameInicial = this.getSize();
        final Dimension tamanoContenedorPrincipalInicial = contenedor.getPreferredSize().getSize();
        final Dimension tamanoFormularioInicial = contenedorHijo.getPreferredSize().getSize();
 
        contenedor.removeAll();
 
        // Tamano del contenedor que va a tener a los q se le meta
        Dimension nuevoTamano = new Dimension(tamanoFormularioInicial.width, tamanoFormularioInicial.height); 
        contenedor.setPreferredSize(nuevoTamano);
        
        contenedor.add(contenedorHijo).setVisible(true);
        contenedor.updateUI();
        this.pack(); // Hacemos esto para que se reestructure el JFrame principal y autoajuste su tamano a lo que contiene dentro
        contenedorHijo.setBounds(0, 0,contenedor.getWidth(),contenedor.getHeight());
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem MenuAsigUser;
    private javax.swing.JMenuItem MenuElimProv;
    private javax.swing.JMenuItem MenuEliminAlmac;
    private javax.swing.JMenuItem MenuEliminCat;
    private javax.swing.JMenuItem MenuEliminUser;
    private javax.swing.JMenuItem MenuEliminarMarca;
    private javax.swing.JMenuItem MenuEliminarTrab;
    private javax.swing.JMenuItem MenuIngrProd;
    private javax.swing.JMenuItem MenuModifAlmacen;
    private javax.swing.JMenuItem MenuModifCat;
    private javax.swing.JMenuItem MenuModifMarca;
    private javax.swing.JMenuItem MenuModifProv;
    private javax.swing.JMenuItem MenuModifTrab;
    private javax.swing.JMenuItem MenuModifUser;
    private javax.swing.JMenuItem MenuNvaCat;
    private javax.swing.JMenuItem MenuNvaMarca;
    private javax.swing.JMenuItem MenuNvoAlmacen;
    private javax.swing.JMenuItem MenuNvoPedido;
    private javax.swing.JMenuItem MenuNvoProv;
    private javax.swing.JMenuItem MenuNvoTrab;
    private javax.swing.JMenuItem MenuSalidProd;
    private javax.swing.JMenuItem MenuValidaCompra;
    private javax.swing.JPanel PanelMenu;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu10;
    private javax.swing.JMenu jMenu11;
    private javax.swing.JMenu jMenu12;
    private javax.swing.JMenu jMenu13;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenu jMenu6;
    private javax.swing.JMenu jMenu7;
    private javax.swing.JMenu jMenu8;
    private javax.swing.JMenu jMenu9;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem8;
    private javax.swing.JMenuItem jMenuItem9;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JLabel lblUsuario;
    private javax.swing.JLabel lblUsuario1;
    private javax.swing.JMenuItem menuElimProd;
    private javax.swing.JMenuItem menuValidarPedid;
    public javax.swing.JPanel panelContenedor;
    private org.edisoncor.gui.panel.PanelImage panelImage;
    // End of variables declaration//GEN-END:variables
}
