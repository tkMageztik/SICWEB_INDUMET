
/****** Object:  ForeignKey [FK_SIC_T_MENU_SIC_T_MENU]    Script Date: 02/19/2014 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_MENU_SIC_T_MENU]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_MENU] DROP CONSTRAINT [FK_SIC_T_MENU_SIC_T_MENU]
GO
/****** Object:  ForeignKey [FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]'))
ALTER TABLE [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] DROP CONSTRAINT [FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]'))
ALTER TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] DROP CONSTRAINT [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]
GO
/****** Object:  ForeignKey [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]'))
ALTER TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] DROP CONSTRAINT [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_USUARIO_OPCION] DROP CONSTRAINT [FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]
GO
/****** Object:  ForeignKey [FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_USUARIO_OPCION] DROP CONSTRAINT [FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]
GO
/****** Object:  ForeignKey [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[General].[FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]') AND parent_object_id = OBJECT_ID(N'[General].[SIC_T_PARAMETRO_DET]'))
ALTER TABLE [General].[SIC_T_PARAMETRO_DET] DROP CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]
GO
/****** Object:  ForeignKey [FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_PROVINCIA]'))
ALTER TABLE [Mantenimiento].[SIC_T_PROVINCIA] DROP CONSTRAINT [FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_OPCION] DROP CONSTRAINT [FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]
GO
/****** Object:  ForeignKey [FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_OPCION] DROP CONSTRAINT [FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]
GO
/****** Object:  ForeignKey [FK_SIC_T_PERFIL_MENU_SIC_T_MENU]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_MENU_SIC_T_MENU]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [FK_SIC_T_PERFIL_MENU_SIC_T_MENU]
GO
/****** Object:  ForeignKey [FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]
GO
/****** Object:  ForeignKey [FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] DROP CONSTRAINT [FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]
GO
/****** Object:  ForeignKey [FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMP_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_EMP_DIRECCION] DROP CONSTRAINT [FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]'))
ALTER TABLE [Mantenimiento].[SIC_T_COLABORADOR] DROP CONSTRAINT [FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]
GO
/****** Object:  ForeignKey [FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]'))
ALTER TABLE [Mantenimiento].[SIC_T_COLABORADOR] DROP CONSTRAINT [FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] DROP CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] DROP CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] DROP CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_DISTRITO]'))
ALTER TABLE [Mantenimiento].[SIC_T_DISTRITO] DROP CONSTRAINT [FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]
GO
/****** Object:  ForeignKey [FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM] DROP CONSTRAINT [FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]
GO
/****** Object:  ForeignKey [FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN] DROP CONSTRAINT [FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]
GO
/****** Object:  ForeignKey [FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN] DROP CONSTRAINT [FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] DROP CONSTRAINT [FK_SIC_T_VENTA_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] DROP CONSTRAINT [FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] DROP CONSTRAINT [FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_NOMB_COM]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_NOMB_COM] DROP CONSTRAINT [FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION] DROP CONSTRAINT [FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION] DROP CONSTRAINT [FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO] DROP CONSTRAINT [FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO] DROP CONSTRAINT [FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]
GO
/****** Object:  ForeignKey [FK_SIC_T_BOLETA_SIC_T_VENTA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_BOLETA_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA]'))
ALTER TABLE [Venta].[SIC_T_BOLETA] DROP CONSTRAINT [FK_SIC_T_BOLETA_SIC_T_VENTA]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] DROP CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] DROP CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] DROP CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]
GO
/****** Object:  ForeignKey [FK_SIC_T_FACTURA_SIC_T_VENTA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_FACTURA_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA]'))
ALTER TABLE [Venta].[SIC_T_FACTURA] DROP CONSTRAINT [FK_SIC_T_FACTURA_SIC_T_VENTA]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]
GO
/****** Object:  ForeignKey [FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA_DETALLE]'))
ALTER TABLE [Venta].[SIC_T_FACTURA_DETALLE] DROP CONSTRAINT [FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]
GO
/****** Object:  ForeignKey [FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA_DETALLE]'))
ALTER TABLE [Venta].[SIC_T_BOLETA_DETALLE] DROP CONSTRAINT [FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_REINICIAR_GENERAL]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_REINICIAR_GENERAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_REINICIAR_GENERAL]
GO
/****** Object:  Table [Venta].[SIC_T_BOLETA_DETALLE]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA_DETALLE]'))
ALTER TABLE [Venta].[SIC_T_BOLETA_DETALLE] DROP CONSTRAINT [FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA_DETALLE]') AND type in (N'U'))
DROP TABLE [Venta].[SIC_T_BOLETA_DETALLE]
GO
/****** Object:  Table [Venta].[SIC_T_FACTURA_DETALLE]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA_DETALLE]'))
ALTER TABLE [Venta].[SIC_T_FACTURA_DETALLE] DROP CONSTRAINT [FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA_DETALLE]') AND type in (N'U'))
DROP TABLE [Venta].[SIC_T_FACTURA_DETALLE]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]
GO
/****** Object:  Table [Venta].[SIC_T_FACTURA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_FACTURA_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA]'))
ALTER TABLE [Venta].[SIC_T_FACTURA] DROP CONSTRAINT [FK_SIC_T_FACTURA_SIC_T_VENTA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA]') AND type in (N'U'))
DROP TABLE [Venta].[SIC_T_FACTURA]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_VENTA_DETALLE]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] DROP CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] DROP CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] DROP CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_REINICIAR_CLIENTE]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_REINICIAR_CLIENTE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_REINICIAR_CLIENTE]
GO
/****** Object:  Table [Venta].[SIC_T_BOLETA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_BOLETA_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA]'))
ALTER TABLE [Venta].[SIC_T_BOLETA] DROP CONSTRAINT [FK_SIC_T_BOLETA_SIC_T_VENTA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA]') AND type in (N'U'))
DROP TABLE [Venta].[SIC_T_BOLETA]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_CONTAR]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_CONTAR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_CONTAR]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_ELIMINAR_RELACION]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_ELIMINAR_RELACION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_ELIMINAR_RELACION]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_REGISTRAR]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_REGISTRAR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_REGISTRAR]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_NOMBRECOMERCIAL_LIMPIAR]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_NOMBRECOMERCIAL_LIMPIAR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_NOMBRECOMERCIAL_LIMPIAR]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_GENERARIDDIRECCION]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_GENERARIDDIRECCION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_GENERARIDDIRECCION]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_LIMPIAR]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_LIMPIAR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_LIMPIAR]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_LISTAR]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_LISTAR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_LISTAR]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_CONTACTO_LIMPIAR]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_CONTACTO_LIMPIAR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_CONTACTO_LIMPIAR]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_NOMBRE_COMERCIAL_LISTAR]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_NOMBRE_COMERCIAL_LISTAR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_NOMBRE_COMERCIAL_LISTAR]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] DROP CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]
GO
/****** Object:  View [Mantenimiento].[SIC_VW_CLIENTE_LISTA]    Script Date: 02/19/2014 10:27:56 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_VW_CLIENTE_LISTA]'))
DROP VIEW [Mantenimiento].[SIC_VW_CLIENTE_LISTA]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_CONTAR_RUC]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_CONTAR_RUC]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_CONTAR_RUC]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_VERIFICAR_EXISTENCIA]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_VERIFICAR_EXISTENCIA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_VERIFICAR_EXISTENCIA]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_DESHABILITAR_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_DESHABILITAR_CLIENTE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_DESHABILITAR_CLIENTE]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_CONTACTO]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO] DROP CONSTRAINT [FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO] DROP CONSTRAINT [FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_DIRECCION]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION] DROP CONSTRAINT [FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION] DROP CONSTRAINT [FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_NOMB_COM]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_NOMB_COM]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_NOMB_COM] DROP CONSTRAINT [FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_NOMB_COM]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_CLI_NOMB_COM]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_VENTA]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] DROP CONSTRAINT [FK_SIC_T_VENTA_SIC_T_CLIENTE]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] DROP CONSTRAINT [FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] DROP CONSTRAINT [FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_VENTA]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] DROP CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM_ALMACEN]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN] DROP CONSTRAINT [FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN] DROP CONSTRAINT [FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM] DROP CONSTRAINT [FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]
GO

/****** Object:  Table [Mantenimiento].[SIC_T_DISTRITO]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_DISTRITO]'))
ALTER TABLE [Mantenimiento].[SIC_T_DISTRITO] DROP CONSTRAINT [FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_DISTRITO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_DISTRITO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] DROP CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] DROP CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] DROP CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ESTADO_CLI]') AND type = 'D')
BEGIN
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] DROP CONSTRAINT [DF_ESTADO_CLI]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_CLIENTE]
GO
/****** Object:  StoredProcedure [Seguridad].[SIC_SP_LISTAR_HIJOS_MENU]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_SP_LISTAR_HIJOS_MENU]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Seguridad].[SIC_SP_LISTAR_HIJOS_MENU]
GO
/****** Object:  StoredProcedure [Seguridad].[SIC_SP_LISTAR_PADRES_MENU]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_SP_LISTAR_PADRES_MENU]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Seguridad].[SIC_SP_LISTAR_PADRES_MENU]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_MANTENIMIENTO_RAZON_SOCIAL_HISTORICO]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_MANTENIMIENTO_RAZON_SOCIAL_HISTORICO]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_MANTENIMIENTO_RAZON_SOCIAL_HISTORICO]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_NOMBRECOMERCIAL_BUSCAR_EXISTENCIA]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_NOMBRECOMERCIAL_BUSCAR_EXISTENCIA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_NOMBRECOMERCIAL_BUSCAR_EXISTENCIA]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_COLABORADOR]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]'))
ALTER TABLE [Mantenimiento].[SIC_T_COLABORADOR] DROP CONSTRAINT [FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]'))
ALTER TABLE [Mantenimiento].[SIC_T_COLABORADOR] DROP CONSTRAINT [FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_COLABORADOR]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_EMP_DIRECCION]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMP_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_EMP_DIRECCION] DROP CONSTRAINT [FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMP_DIRECCION]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_EMP_DIRECCION]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] DROP CONSTRAINT [FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]
GO
/****** Object:  Table [Seguridad].[SIC_T_PERFIL_MENU]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_MENU_SIC_T_MENU]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [FK_SIC_T_PERFIL_MENU_SIC_T_MENU]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SIC_T_PERFIL_MENU_perf_menu_c_calta]') AND type = 'D')
BEGIN
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_calta]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SIC_T_PERFIL_MENU_perf_menu_c_cmod]') AND type = 'D')
BEGIN
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_cmod]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SIC_T_PERFIL_MENU_perf_menu_c_celim]') AND type = 'D')
BEGIN
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_celim]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SIC_T_PERFIL_MENU_perf_menu_c_cvisual]') AND type = 'D')
BEGIN
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_cvisual]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SIC_T_PERFIL_MENU_perf_menu_c_cimpre]') AND type = 'D')
BEGIN
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_cimpre]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SIC_T_PERFIL_MENU_perf_menu_c_cproc]') AND type = 'D')
BEGIN
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] DROP CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_cproc]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]') AND type in (N'U'))
DROP TABLE [Seguridad].[SIC_T_PERFIL_MENU]
GO
/****** Object:  Table [Seguridad].[SIC_T_PERFIL_OPCION]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_OPCION] DROP CONSTRAINT [FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_OPCION] DROP CONSTRAINT [FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]') AND type in (N'U'))
DROP TABLE [Seguridad].[SIC_T_PERFIL_OPCION]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_PROVINCIA]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_PROVINCIA]'))
ALTER TABLE [Mantenimiento].[SIC_T_PROVINCIA] DROP CONSTRAINT [FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_PROVINCIA]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_PROVINCIA]
GO
/****** Object:  Table [General].[SIC_T_PARAMETRO_DET]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[General].[FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]') AND parent_object_id = OBJECT_ID(N'[General].[SIC_T_PARAMETRO_DET]'))
ALTER TABLE [General].[SIC_T_PARAMETRO_DET] DROP CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[General].[SIC_T_PARAMETRO_DET]') AND type in (N'U'))
DROP TABLE [General].[SIC_T_PARAMETRO_DET]
GO
/****** Object:  Table [Seguridad].[SIC_T_USUARIO_OPCION]    Script Date: 02/19/2014 10:27:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_USUARIO_OPCION] DROP CONSTRAINT [FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_USUARIO_OPCION] DROP CONSTRAINT [FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]') AND type in (N'U'))
DROP TABLE [Seguridad].[SIC_T_USUARIO_OPCION]
GO
/****** Object:  Table [dbo].[SIC_T_ALMACEN_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]'))
ALTER TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] DROP CONSTRAINT [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]'))
ALTER TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] DROP CONSTRAINT [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]') AND type in (N'U'))
DROP TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]'))
ALTER TABLE [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] DROP CONSTRAINT [FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]
GO
/****** Object:  Table [Seguridad].[SIC_T_USUARIO_PERFIL]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SIC_T_USUARIO_PERFIL_usua_perfil_c_cestado]') AND type = 'D')
BEGIN
ALTER TABLE [Seguridad].[SIC_T_USUARIO_PERFIL] DROP CONSTRAINT [DF_SIC_T_USUARIO_PERFIL_usua_perfil_c_cestado]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_PERFIL]') AND type in (N'U'))
DROP TABLE [Seguridad].[SIC_T_USUARIO_PERFIL]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_VEN_ESTADO]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VEN_ESTADO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_VEN_ESTADO]
GO
/****** Object:  Table [Seguridad].[SIC_T_PERFIL]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_SIC_T_PERFIL_perf_c_cestado]') AND type = 'D')
BEGIN
ALTER TABLE [Seguridad].[SIC_T_PERFIL] DROP CONSTRAINT [DF_SIC_T_PERFIL_perf_c_cestado]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL]') AND type in (N'U'))
DROP TABLE [Seguridad].[SIC_T_PERFIL]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ZONA_REPARTO]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ZONA_REPARTO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ZONA_REPARTO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_TASA_CAMBIO]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_TASA_CAMBIO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_TASA_CAMBIO]
GO
/****** Object:  Table [Seguridad].[SIC_T_USUARIO]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO]') AND type in (N'U'))
DROP TABLE [Seguridad].[SIC_T_USUARIO]
GO
/****** Object:  Table [General].[SIC_T_PARAMETRO]    Script Date: 02/19/2014 10:27:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[General].[SIC_T_PARAMETRO]') AND type in (N'U'))
DROP TABLE [General].[SIC_T_PARAMETRO]
GO
/****** Object:  Table [Seguridad].[SIC_T_MENU]    Script Date: 02/19/2014 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_MENU_SIC_T_MENU]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_MENU] DROP CONSTRAINT [FK_SIC_T_MENU_SIC_T_MENU]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_MENU]') AND type in (N'U'))
DROP TABLE [Seguridad].[SIC_T_MENU]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOV_ESTADO]    Script Date: 02/19/2014 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOV_ESTADO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_MOV_ESTADO]
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_NOMB_COMER_OBTENER_POR_NOMBRE]    Script Date: 02/19/2014 10:27:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_NOMB_COMER_OBTENER_POR_NOMBRE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [Mantenimiento].[SIC_SP_NOMB_COMER_OBTENER_POR_NOMBRE]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_NOMB_COM]    Script Date: 02/19/2014 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_NOMB_COM]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_NOMB_COM]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ODC_CLASE]    Script Date: 02/19/2014 10:27:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ODC_CLASE]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ODC_CLASE]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ODC_ESTADO]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ODC_ESTADO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ODC_ESTADO]
GO
/****** Object:  Table [Seguridad].[SIC_T_OPCION]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_OPCION]') AND type in (N'U'))
DROP TABLE [Seguridad].[SIC_T_OPCION]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_EMPRESA]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMPRESA]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_EMPRESA]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTAC_CARGO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_IGV]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_IGV]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_IGV]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM_FAMILIA]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_FAMILIA]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ITEM_FAMILIA]
GO
/****** Object:  Table [General].[SIC_T_CONCEPTO]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[General].[SIC_T_CONCEPTO]') AND type in (N'U'))
DROP TABLE [General].[SIC_T_CONCEPTO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_DEPARTAMENTO]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_DEPARTAMENTO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_DEPARTAMENTO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMP_CENTRO_COSTO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_RS_HISTORICO]    Script Date: 02/19/2014 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_RS_HISTORICO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_CLI_RS_HISTORICO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_SCORING]    Script Date: 02/19/2014 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_SCORING]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_CLI_SCORING]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_COLAB_AREA]    Script Date: 02/19/2014 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLAB_AREA]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_COLAB_AREA]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_COLAB_CARGO]    Script Date: 02/19/2014 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLAB_CARGO]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_COLAB_CARGO]
GO

--ALTER TABLE Mantenimiento.[SIC_T_ITEM_ALMACEN] DROP CONSTRAINT FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM
--ALTER TABLE Mantenimiento.[SIC_T_VENTA_DETALLE] DROP CONSTRAINT FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM
--ALTER TABLE Mantenimiento.[SIC_T_ORDEN_DE_COMPRA_DET] DROP CONSTRAINT FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM
--ALTER TABLE Mantenimiento.[SIC_T_MOVIMIENTO_SALIDA_DETALLE] DROP CONSTRAINT FK_SIC_T_MOVIMIENTO_SALIDA_DETALLE_SIC_T_ITEM

--ALTER TABLE dbo.[SIC_T_ALMACEN_CENTRO_COSTO] DROP CONSTRAINT FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN
--ALTER TABLE Mantenimiento.[SIC_T_ITEM_ALMACEN] DROP CONSTRAINT FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN
--ALTER TABLE Mantenimiento.[SIC_T_MOVIMIENTO_ENTRADA] DROP CONSTRAINT FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN
--ALTER TABLE Mantenimiento.[SIC_T_VENTA_DETALLE] DROP CONSTRAINT FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN
--ALTER TABLE Mantenimiento.[SIC_T_MOVIMIENTO_SALIDA] DROP CONSTRAINT FK_SIC_T_MOVIMIENTO_SALIDA_SIC_T_ALMACEN

--ALTER TABLE Mantenimiento.[SIC_T_MOVIMIENTO_SALIDA_DETALLE] DROP CONSTRAINT FK_SIC_T_MOVIMIENTO_SALIDA_DETALLE_SIC_T_MOVIMIENTO_SALIDA

--ALTER TABLE Mantenimiento.[SIC_T_MOVIMIENTO_SALIDA] DROP CONSTRAINT PK_SIC_T_MOVIMIENTO_SALIDA
--ALTER TABLE Mantenimiento.[SIC_T_MOVIMIENTO_SALIDA_DETALLE] DROP CONSTRAINT PK_SIC_T_MOVIMIENTO_SALIDA_DETALLE

/****** Object:  Table [Mantenimiento].[SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ALMACEN]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ALMACEN]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM]') AND type in (N'U'))
DROP TABLE [Mantenimiento].[SIC_T_ITEM]
GO


/****** Object:  Schema [Facturacion]    Script Date: 02/19/2014 10:27:45 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Facturacion')
DROP SCHEMA [Facturacion]
GO
/****** Object:  Schema [General]    Script Date: 02/19/2014 10:27:45 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'General')
DROP SCHEMA [General]
GO
--/****** Object:  Schema [Mantenimiento]    Script Date: 02/19/2014 10:27:45 ******/
--IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Mantenimiento')
--DROP SCHEMA [Mantenimiento]
--GO
/****** Object:  Schema [Seguridad]    Script Date: 02/19/2014 10:27:45 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Seguridad')
DROP SCHEMA [Seguridad]
GO
/****** Object:  Schema [Venta]    Script Date: 02/19/2014 10:27:45 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Venta')
DROP SCHEMA [Venta]
GO
/****** Object:  User [developer_01]    Script Date: 02/19/2014 10:27:45 ******/
--IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'developer_01')
--DROP USER [developer_01]
--GO
/****** Object:  User [developer_01]    Script Date: 02/19/2014 10:27:45 ******/
--IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'developer_01')
--CREATE USER [developer_01] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
--GO
/****** Object:  Schema [Venta]    Script Date: 02/19/2014 10:27:45 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Venta')
EXEC sys.sp_executesql N'CREATE SCHEMA [Venta] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [Seguridad]    Script Date: 02/19/2014 10:27:45 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Seguridad')
EXEC sys.sp_executesql N'CREATE SCHEMA [Seguridad] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [Mantenimiento]    Script Date: 02/19/2014 10:27:45 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Mantenimiento')
EXEC sys.sp_executesql N'CREATE SCHEMA [Mantenimiento] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [General]    Script Date: 02/19/2014 10:27:45 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'General')
EXEC sys.sp_executesql N'CREATE SCHEMA [General] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [Facturacion]    Script Date: 02/19/2014 10:27:45 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Facturacion')
EXEC sys.sp_executesql N'CREATE SCHEMA [Facturacion] AUTHORIZATION [dbo]'
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ALMACEN]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ALMACEN](
	[alm_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[alm_c_bactivo] [bit] NULL,
	[alm_c_vdes] [varchar](50) NULL,
 CONSTRAINT [PK_SIC_T_ALMACEN] PRIMARY KEY CLUSTERED 
(
	[alm_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO

SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ALMACEN] ON
INSERT [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid], [alm_c_bactivo], [alm_c_vdes]) VALUES (1, 1, N'PRODUCCION LIMA')
INSERT [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid], [alm_c_bactivo], [alm_c_vdes]) VALUES (3, 1, N'VENTAS CHINCHA')
INSERT [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid], [alm_c_bactivo], [alm_c_vdes]) VALUES (7, 1, N'PRODUCCION CHINCHA')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ALMACEN] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_COLAB_CARGO]    Script Date: 02/19/2014 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLAB_CARGO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_COLAB_CARGO](
	[colab_cargo_c_yid] [tinyint] NOT NULL,
	[colab_cargo_c_vnomb] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_COLAB_CARGO] PRIMARY KEY CLUSTERED 
(
	[colab_cargo_c_yid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (1, N'SUPERVISOR DE CENTRO DE CONTROL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (2, N'TÉCNICO DE MANTENIMIENTO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (3, N'ASISTENTE ADMINISTRATIVA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (4, N'JEFE CORPORATIVO DE OPERACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (5, N'COORDINADOR DE FIDELIZACIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (6, N'JEFE DE OPERACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (7, N'GERENTE DE MALL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (8, N'GERENTE  COMERCIAL CORPORATIVO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (9, N'GERENTE GENERAL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (10, N'JEFE LEGAL CORPORATIVO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (11, N'JEFE CORPORATIVO DE MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (12, N'COORDINADOR COMERCIAL Y MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (13, N'ASISTENTE DE OPERACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (14, N'GERENTE CORPORATIVO DE OPERACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (15, N'SUPERVISOR DE ATENCIÓN AL CLIENTE')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (16, N'ANALISTA DE CUENTAS CORRIENTES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (17, N'JEFE CORPORATIVO DE TECNOLOGÍA DE LA INFORMACION')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (18, N'SUBGERENTE CORPORATIVO DE ADMINISTRACIÓN Y FINANZA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (19, N'GESTOR DE COBRANZAS')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (20, N'COORDINADOR DE OPERACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (21, N'ASISTENTE DE TECNOLOGÍA DE LA INFORMACIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (22, N'SUBGERENTE CORPORATIVO DE MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (23, N'AUDITOR DE MALL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (24, N'CONTADOR CORPORATIVO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (25, N'JEFE DE ESTACIÓN CENTRAL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (26, N'ASISTENTE DE GESTIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (27, N'JEFE CORPORATIVO DE ORGANIZACIÓN Y METODOS')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (28, N'JEFE COMERCIAL CORPORATIVO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (29, N'ANALISTA DE GESTIÓN INMOBILIARIA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (30, N'AUXILIAR DE ARCHIVO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (31, N'JEFE CORPORATIVO DE ADMINISTRACIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (32, N'GERENTE CORPORATIVO DE ADMINISTRACIÓN Y FINANZAS')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (33, N'EJECUTIVO COMERCIAL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (34, N'AUXILIAR DE OFICINA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (35, N'JEFE CORPORATIVO DE PLANEAMIENTO Y CONTROL DE GEST')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (36, N'SUBGERENTE COMERCIAL CORPORATIVO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (37, N'JEFE CORPORATIVO DE DISEÑO DE TIENDA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (38, N'COORDINADOR DE COBRANZAS')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (39, N'EJECUTIVO DE BTL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (40, N'ANALISTA DE TECNOLOGÍA DE LA INFORMACIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (41, N'AUXILIAR DE MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (42, N'ANALISTA DE PLANEAMIENTO Y CONTROL DE GESTIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (43, N'ARQUITECTA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (44, N'AUDITOR CORPORATIVO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (45, N'PROGRAMADOR')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (46, N'ANALISTA DE COMPENSACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (47, N'ANALISTA DE FINANZAS Y TESORERÍA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (48, N'JEFE CORPORATIVO DE DESARROLLO Y TALENTO HUMANO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (49, N'EJECUTIVO DE MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (50, N'ASISTENTE DE GERENCIA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (51, N'ASISTENTE DE CONTABILIDAD')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (52, N'ASISTENTE DE CONTRATOS')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (53, N'ASISTENTE DE MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (54, N'AGENTE DE ATENCIÓN AL CLIENTE')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (55, N'ASISTENTE DE ORGANIZACIÓN Y MÉTODOS')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (56, N'ASISTENTE DE TESORERÍA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (57, N'ASISTENTE DE AUDITORÍA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (58, N'COORDINADOR DE GESTIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (59, N'ASISTENTE DE GESTIÓN IMMOBILIARIA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (60, N'PRACTICANTE DE MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (61, N'ANALISTA DE OPERACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (62, N'PRACTICANTE DE OPERACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (63, N'AUXILIAR DE AUDITORÍA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (64, N'ASISTENTE LEGAL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (65, N'ASISTENTE COMERCIAL Y MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (66, N'ANALISTA DE DESARROLLO Y TALENTO HUMANO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (67, N'ASISTENTE DE DESARROLLO Y TALENTO HUMANO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (68, N'PRACTICANTE DE TECNOLOGÍA DE LA INFORMACIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (69, N'PRACTICANTE DE GESTIÓN INMOBILIARIA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (70, N'ASISTENTE DE CUENTAS CORRIENTES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (71, N'PRACTICANTE DE PLANEAMIENTO Y CONTROL DE GESTIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (72, N'PRACTICANTE DE DISEÑO GRAFICO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (73, N'PRACTICANTE DE CONTABILIDAD')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (74, N'PRACTICANTE DE AUDITORIA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (75, N'PRACTICANTE LEGAL')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (76, N'ASISTENTE DE DTH Y COMPENSACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (77, N'PRACTICANTE DE GESTION Y DESARROLLO HUMANO')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (78, N'PRACTICANTE DE ARQUITECTURA')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (79, N'JEFE DE COBRANZAS')
INSERT [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid], [colab_cargo_c_vnomb]) VALUES (80, N'ANALISTA DE CREDITOS')
/****** Object:  Table [Mantenimiento].[SIC_T_COLAB_AREA]    Script Date: 02/19/2014 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLAB_AREA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_COLAB_AREA](
	[colab_area_c_yid] [tinyint] NOT NULL,
	[colab_area_c_vnomb] [varchar](50) NULL,
 CONSTRAINT [PK_SIC_T_COLAB_AREA] PRIMARY KEY CLUSTERED 
(
	[colab_area_c_yid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (1, N'OPERACIONES')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (2, N'ADMINISTRACIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (3, N'COMERCIAL')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (4, N'LEGAL')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (5, N'MARKETING')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (6, N'COBRANZAS')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (7, N'TECNOLOGÍA DE LA INFORMACIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (8, N'AUDITORÍA')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (9, N'CONTABILIDAD')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (10, N'ORGANIZACIÓN Y MÉTODOS')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (11, N'GESTIÓN INMOBILIARIA')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (12, N'SERVICIOS GENERALES')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (13, N'PLANEAMIENTO Y CONTROL DE GESTIÓN')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (14, N'DISEÑO')
INSERT [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid], [colab_area_c_vnomb]) VALUES (15, N'DESARROLLO Y TALENTO HUMANO')
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_SCORING]    Script Date: 02/19/2014 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_SCORING]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_CLI_SCORING](
	[cli_scor_c_cletra] [char](1) NOT NULL,
	[cli_scor_c_vobserv] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_CLI_SCORING] PRIMARY KEY CLUSTERED 
(
	[cli_scor_c_cletra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Mantenimiento].[SIC_T_CLI_SCORING] ([cli_scor_c_cletra], [cli_scor_c_vobserv]) VALUES (N'A', N'BUENO')
INSERT [Mantenimiento].[SIC_T_CLI_SCORING] ([cli_scor_c_cletra], [cli_scor_c_vobserv]) VALUES (N'B', N'REGULAR')
INSERT [Mantenimiento].[SIC_T_CLI_SCORING] ([cli_scor_c_cletra], [cli_scor_c_vobserv]) VALUES (N'C', N'MALO')
INSERT [Mantenimiento].[SIC_T_CLI_SCORING] ([cli_scor_c_cletra], [cli_scor_c_vobserv]) VALUES (N'D', N'MALISIMO')
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_RS_HISTORICO]    Script Date: 02/19/2014 10:27:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_RS_HISTORICO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_CLI_RS_HISTORICO](
	[cli_rs_h_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[cli_c_vdoc_id] [varchar](11) NULL,
	[cli_rs_h_c_vraz_soc] [varchar](200) NULL,
	[cli_rs_h_c_dfec_reg] [datetime] NULL,
 CONSTRAINT [PK_SIC_T_CLI_RS_HISTORICO] PRIMARY KEY CLUSTERED 
(
	[cli_rs_h_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMP_CENTRO_COSTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO](
	[emp_cst_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[emp_cst_c_vdesc] [varchar](100) NOT NULL,
	[emp_cst_c_bactivo] [bit] NOT NULL,
	[emp_cst_c_vseriefactura] [varchar](3) NOT NULL,
	[emp_cst_c_inumerofact] [int] NOT NULL,
	[emp_cst_c_vserieboleta] [varchar](3) NOT NULL,
	[emp_cst_c_inumeroboleta] [int] NOT NULL,
 CONSTRAINT [PK_SIC_T_EMP_CENTRO_COSTO_1] PRIMARY KEY CLUSTERED 
(
	[emp_cst_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO] ON
INSERT [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO] ([emp_cst_c_iid], [emp_cst_c_vdesc], [emp_cst_c_bactivo], [emp_cst_c_vseriefactura], [emp_cst_c_inumerofact], [emp_cst_c_vserieboleta], [emp_cst_c_inumeroboleta]) VALUES (1, N'CHINCHA', 1, N'001', 1, N'001', 1)
INSERT [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO] ([emp_cst_c_iid], [emp_cst_c_vdesc], [emp_cst_c_bactivo], [emp_cst_c_vseriefactura], [emp_cst_c_inumerofact], [emp_cst_c_vserieboleta], [emp_cst_c_inumeroboleta]) VALUES (2, N'LIMA', 1, N'002', 1, N'002', 1)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_DEPARTAMENTO]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_DEPARTAMENTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_DEPARTAMENTO](
	[depa_c_ccod] [char](2) NOT NULL,
	[depa_c_vnomb] [varchar](50) NULL,
 CONSTRAINT [PK_SIC_T_DEPARTAMENTO] PRIMARY KEY CLUSTERED 
(
	[depa_c_ccod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'01', N'AMAZONAS')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'02', N'ANCASH')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'03', N'APURIMAC')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'04', N'AREQUIPA')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'05', N'AYACUCHO')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'06', N'CAJAMARCA')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'07', N'PROV. CONST. DEL CALLAO')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'08', N'CUSCO')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'09', N'HUANCAVELICA')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'10', N'HUANUCO')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'11', N'ICA')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'12', N'JUNIN')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'13', N'LA LIBERTAD')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'14', N'LAMBAYEQUE')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'15', N'LIMA')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'16', N'LORETO')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'17', N'MADRE DE DIOS')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'18', N'MOQUEGUA')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'19', N'PASCO')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'20', N'PIURA')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'21', N'PUNO')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'22', N'SAN MARTIN')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'23', N'TACNA')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'24', N'TUMBES')
INSERT [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod], [depa_c_vnomb]) VALUES (N'25', N'UCAYALI')
/****** Object:  Table [General].[SIC_T_CONCEPTO]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[General].[SIC_T_CONCEPTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [General].[SIC_T_CONCEPTO](
	[con_c_iid] [int] NOT NULL,
	[con_c_vdes] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_CONCEPTO] PRIMARY KEY CLUSTERED 
(
	[con_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [General].[SIC_T_CONCEPTO] ([con_c_iid], [con_c_vdes]) VALUES (1, N'VENTA')
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM_FAMILIA]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_FAMILIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ITEM_FAMILIA](
	[ifm_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[ifm_c_des] [varchar](100) NOT NULL,
	[ifm_c_bactivo] [bit] NOT NULL,
 CONSTRAINT [PK_SIC_T_FAMILIA_ITEM] PRIMARY KEY CLUSTERED 
(
	[ifm_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ON
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (1, N'familia prueba 1', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (2, N'esparragos', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (3, N'test familia 2', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (4, N'Autorroscante', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (5, N'Estobol', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (6, N'pernos exagonales', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (7, N'pernos', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (8, N'Arandelas', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (9, N'Discos', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (10, N'Hoja d cierra', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (11, N'Hoja de cierra', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (12, N'Winchas', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (13, N'Lijas', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (14, N'Brocas', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (15, N'Angulos', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (16, N'Angulo', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (17, N'Platina', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (18, N'TEES', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (19, N'Redondo lizo', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (20, N'Cuadrado Lizo', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (21, N'Planchas', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (22, N'Tubos', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (23, N'Rubo', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (24, N'Rubo rectangular', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (25, N'Fierro', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (26, N'ABRAZADERA', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (27, N'Tarugos', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (28, N'Bisagras', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (29, N'OREJA DE CANDADO', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (30, N'Cerrojo', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (31, N'Manijas', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (32, N'Piña', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (33, N'spray', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (34, N'Grasa', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (35, N'WD', 1)
INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid], [ifm_c_des], [ifm_c_bactivo]) VALUES (36, N'Lunas', 1)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM_FAMILIA] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_IGV]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_IGV]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_IGV](
	[igv_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[igv_c_eigv] [decimal](19, 2) NULL,
	[igv_c_dinicio] [datetime] NULL,
	[igv_c_dfin] [datetime] NULL,
 CONSTRAINT [PK_SIC_T_IGV] PRIMARY KEY CLUSTERED 
(
	[igv_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_IGV] ON
INSERT [Mantenimiento].[SIC_T_IGV] ([igv_c_iid], [igv_c_eigv], [igv_c_dinicio], [igv_c_dfin]) VALUES (1, CAST(0.18 AS Decimal(19, 2)), CAST(0x0000A13900000000 AS DateTime), NULL)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_IGV] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTAC_CARGO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO](
	[cli_contac_cargo_c_yid] [tinyint] IDENTITY(1,1) NOT NULL,
	[cli_contac_cargo_c_vnomb] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_CLI_CONTAC_CARGO] PRIMARY KEY CLUSTERED 
(
	[cli_contac_cargo_c_yid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ON
INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ([cli_contac_cargo_c_yid], [cli_contac_cargo_c_vnomb]) VALUES (1, N'Representante legal')
INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ([cli_contac_cargo_c_yid], [cli_contac_cargo_c_vnomb]) VALUES (2, N'Gerente General')
INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ([cli_contac_cargo_c_yid], [cli_contac_cargo_c_vnomb]) VALUES (3, N'Encargado de pagos')
INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ([cli_contac_cargo_c_yid], [cli_contac_cargo_c_vnomb]) VALUES (4, N'Supervisor de tienda')
INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ([cli_contac_cargo_c_yid], [cli_contac_cargo_c_vnomb]) VALUES (5, N'Jefe de Tienda')
INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ([cli_contac_cargo_c_yid], [cli_contac_cargo_c_vnomb]) VALUES (6, N'Contacto Comercial')
INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ([cli_contac_cargo_c_yid], [cli_contac_cargo_c_vnomb]) VALUES (7, N'Co-Deudor')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_EMPRESA]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMPRESA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_EMPRESA](
	[emp_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[emp_c_vruc] [varchar](100) NULL,
	[emp_c_vrazonsocial] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_EMPRESA] PRIMARY KEY CLUSTERED 
(
	[emp_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_EMPRESA] ON
INSERT [Mantenimiento].[SIC_T_EMPRESA] ([emp_c_iid], [emp_c_vruc], [emp_c_vrazonsocial]) VALUES (1, N'20550768471', N'INDUMET GRUPO ORTIZ S.A.C.')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_EMPRESA] OFF
/****** Object:  Table [Seguridad].[SIC_T_OPCION]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_OPCION]') AND type in (N'U'))
BEGIN
CREATE TABLE [Seguridad].[SIC_T_OPCION](
	[opc_c_iid] [int] NOT NULL,
	[opc_c_vdesc] [varchar](50) NOT NULL,
	[opc_c_bestado] [bit] NOT NULL,
 CONSTRAINT [PK_SIC_T_OPCION] PRIMARY KEY CLUSTERED 
(
	[opc_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ODC_ESTADO]    Script Date: 02/19/2014 10:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ODC_ESTADO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ODC_ESTADO](
	[odc_estado_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_estado_vdescripcion] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_ODC_ESTADO] PRIMARY KEY CLUSTERED 
(
	[odc_estado_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ON
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (1, N'PLANEADA')
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (2, N'ABIERTA')
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (3, N'CERRADA')
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (4, N'VENCIDA')
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (5, N'ANULADA')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_ODC_CLASE]    Script Date: 02/19/2014 10:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ODC_CLASE]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ODC_CLASE](
	[odc_cla_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_cla_vdes] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_ODC_CLASE] PRIMARY KEY CLUSTERED 
(
	[odc_cla_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ODC_CLASE] ON
INSERT [Mantenimiento].[SIC_T_ODC_CLASE] ([odc_cla_iid], [odc_cla_vdes]) VALUES (1, N'PRODUCCIÓN')
INSERT [Mantenimiento].[SIC_T_ODC_CLASE] ([odc_cla_iid], [odc_cla_vdes]) VALUES (2, N'VENTA')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ODC_CLASE] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_NOMB_COM]    Script Date: 02/19/2014 10:27:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_NOMB_COM]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_NOMB_COM](
	[nomb_com_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[nomb_com_c_vnomb] [varchar](200) NULL,
 CONSTRAINT [PK_SIC_T_NOMB_COM] PRIMARY KEY CLUSTERED 
(
	[nomb_com_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_NOMB_COMER_OBTENER_POR_NOMBRE]    Script Date: 02/19/2014 10:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_NOMB_COMER_OBTENER_POR_NOMBRE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE  [Mantenimiento].[SIC_SP_NOMB_COMER_OBTENER_POR_NOMBRE]
(
@nomb_com_c_vnomb varchar(200),
@cli_c_vdoc_id varchar(11)
)
AS
SELECT nc.nomb_com_c_iid, nc.nomb_com_c_vnomb FROM dbo.SIC_T_CLI_NOMB_COM cnc
INNER JOIN dbo.SIC_T_NOMB_COM nc ON cnc.nomb_com_c_iid = nc.nomb_com_c_iid 
WHERE nc.nomb_com_c_vnomb = @nomb_com_c_vnomb AND cnc.cli_c_vdoc_id = @cli_c_vdoc_id
' 
END
GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOV_ESTADO]    Script Date: 02/19/2014 10:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOV_ESTADO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_MOV_ESTADO](
	[mov_estado_iid] [int] IDENTITY(1,1) NOT NULL,
	[mov_estado_vdescrpcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SIC_T_MOV_ESTADO] PRIMARY KEY CLUSTERED 
(
	[mov_estado_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] ON
INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] ([mov_estado_iid], [mov_estado_vdescrpcion]) VALUES (2, N'POR REGULARIZAR')
INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] ([mov_estado_iid], [mov_estado_vdescrpcion]) VALUES (3, N'CERRADO')
INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] ([mov_estado_iid], [mov_estado_vdescrpcion]) VALUES (4, N'ANULADO')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] OFF
/****** Object:  Table [Seguridad].[SIC_T_MENU]    Script Date: 02/19/2014 10:27:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_MENU]') AND type in (N'U'))
BEGIN
CREATE TABLE [Seguridad].[SIC_T_MENU](
	[menu_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[menu_c_iid_padre] [int] NULL,
	[menu_c_vnomb] [varchar](30) NULL,
	[menu_c_ynivel] [tinyint] NULL,
	[menu_c_vpag_asp] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_MENU] PRIMARY KEY CLUSTERED 
(
	[menu_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Seguridad].[SIC_T_MENU] ON
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (1, NULL, N'MANTENIMIENTO', 1, NULL)
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (2, 1, N'CLIENTE / PROVEEDOR', 2, N'Interfaces/Mantenimiento/frmRegCliente.aspx')
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (3, 1, N'ITEM', 2, N'Interfaces/Mantenimiento/frmRegItem.aspx')
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (5, NULL, N'ALMACÉN', 1, NULL)
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (6, NULL, N'FACTURACIÓN', 1, NULL)
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (7, 6, N'VENTA', 2, N'Interfaces/Facturacion/frmVenta.aspx')
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (8, 5, N'MOVIMIENTO DE ENTRADA', 2, N'Interfaces/Almacen/frmMovEntrada.aspx')
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (9, NULL, N'COMPRAS', 1, NULL)
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (10, 9, N'ORDEN DE COMPRA', 2, N'Interfaces/Compras/frmRegOC.aspx')
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (11, 1, N'EMPRESA', 2, N'Interfaces/Mantenimiento/frmMantEmpresa.aspx')
INSERT [Seguridad].[SIC_T_MENU] ([menu_c_iid], [menu_c_iid_padre], [menu_c_vnomb], [menu_c_ynivel], [menu_c_vpag_asp]) VALUES (13, 5, N'ALMACENES', 2, N'Interfaces/Almacen/frmAlmacenes.aspx')
SET IDENTITY_INSERT [Seguridad].[SIC_T_MENU] OFF
/****** Object:  Table [General].[SIC_T_PARAMETRO]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[General].[SIC_T_PARAMETRO]') AND type in (N'U'))
BEGIN
CREATE TABLE [General].[SIC_T_PARAMETRO](
	[par_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[par_c_vdesc] [varchar](100) NULL,
	[par_c_bactivo] [bit] NULL,
 CONSTRAINT [PK_SIC_T_PARAMETRO] PRIMARY KEY CLUSTERED 
(
	[par_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] ON
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (1, N'UNIDAD DE MEDIDA', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (2, N'DOCUMENTO DE IDENTIDAD', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (3, N'IGV', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (4, N'PERCEPCION', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (5, N'MONEDA', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (6, N'DOCUMENTO VENTA', 1)
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] OFF
/****** Object:  Table [Seguridad].[SIC_T_USUARIO]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Seguridad].[SIC_T_USUARIO](
	[usua_c_cusu_red] [char](10) NULL,
	[usua_c_bpropietarioadministrador] [bit] NULL,
	[usua_c_cidempresa] [char](11) NULL,
	[usua_c_cape_pat] [varchar](100) NULL,
	[usua_c_cape_mat] [varchar](100) NULL,
	[usua_c_cape_nombres] [varchar](100) NULL,
	[usua_c_cdoc_id] [varchar](10) NOT NULL
)  
SET ANSI_PADDING ON
ALTER TABLE [Seguridad].[SIC_T_USUARIO] ADD [usua_c_vpass] [varchar](15) NULL
ALTER TABLE [Seguridad].[SIC_T_USUARIO] ADD [usua_c_bestado] [bit] NOT NULL
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO]') AND name = N'PK_SIC_T_USUARIO')
ALTER TABLE [Seguridad].[SIC_T_USUARIO] ADD  CONSTRAINT [PK_SIC_T_USUARIO] PRIMARY KEY CLUSTERED 
(
	[usua_c_cdoc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Seguridad].[SIC_T_USUARIO] ([usua_c_cusu_red], [usua_c_bpropietarioadministrador], [usua_c_cidempresa], [usua_c_cape_pat], [usua_c_cape_mat], [usua_c_cape_nombres], [usua_c_cdoc_id], [usua_c_vpass], [usua_c_bestado]) VALUES (NULL, NULL, NULL, N'', N'', N'ADMIN', N'ADMIN', N'juan899833245', 1)
INSERT [Seguridad].[SIC_T_USUARIO] ([usua_c_cusu_red], [usua_c_bpropietarioadministrador], [usua_c_cidempresa], [usua_c_cape_pat], [usua_c_cape_mat], [usua_c_cape_nombres], [usua_c_cdoc_id], [usua_c_vpass], [usua_c_bestado]) VALUES (N'          ', NULL, NULL, N'ORTIZ', N'ÁVALOS', N'SIXTO', N'SORTIZ', N'123456', 1)
/****** Object:  Table [Mantenimiento].[SIC_T_TASA_CAMBIO]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_TASA_CAMBIO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_TASA_CAMBIO](
	[tsc_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[tsc_c_ecompra] [decimal](17, 4) NOT NULL,
	[tsc_c_eventa] [decimal](17, 4) NOT NULL,
	[tsc_c_dinicio] [datetime] NOT NULL,
	[tsc_c_dfin] [datetime] NULL,
 CONSTRAINT [PK_SIC_T_TASA_CAMBIO] PRIMARY KEY CLUSTERED 
(
	[tsc_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_TASA_CAMBIO] ON
INSERT [Mantenimiento].[SIC_T_TASA_CAMBIO] ([tsc_c_iid], [tsc_c_ecompra], [tsc_c_eventa], [tsc_c_dinicio], [tsc_c_dfin]) VALUES (1, CAST(2.7970 AS Decimal(17, 4)), CAST(2.7990 AS Decimal(17, 4)), CAST(0x0000A2B700000000 AS DateTime), NULL)
INSERT [Mantenimiento].[SIC_T_TASA_CAMBIO] ([tsc_c_iid], [tsc_c_ecompra], [tsc_c_eventa], [tsc_c_dinicio], [tsc_c_dfin]) VALUES (2, CAST(2.9500 AS Decimal(17, 4)), CAST(3.1000 AS Decimal(17, 4)), CAST(0x0000A2C000000000 AS DateTime), NULL)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_TASA_CAMBIO] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_ZONA_REPARTO]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ZONA_REPARTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ZONA_REPARTO](
	[zona_rep_c_yid] [tinyint] IDENTITY(1,1) NOT NULL,
	[zona_rep_c_czona] [char](1) NULL,
 CONSTRAINT [PK_SIC_T_ZONA_REPARTO] PRIMARY KEY CLUSTERED 
(
	[zona_rep_c_yid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO] ON
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO] ([zona_rep_c_yid], [zona_rep_c_czona]) VALUES (1, N'A')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO] ([zona_rep_c_yid], [zona_rep_c_czona]) VALUES (2, N'B')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO] ([zona_rep_c_yid], [zona_rep_c_czona]) VALUES (3, N'C')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO] OFF
/****** Object:  Table [Seguridad].[SIC_T_PERFIL]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL]') AND type in (N'U'))
BEGIN
CREATE TABLE [Seguridad].[SIC_T_PERFIL](
	[perf_c_yid] [tinyint] IDENTITY(1,1) NOT NULL,
	[perf_c_vnomb] [varchar](50) NULL,
	[perf_c_vdesc] [varchar](200) NULL,
	[perf_c_cestado] [char](1) NULL CONSTRAINT [DF_SIC_T_PERFIL_perf_c_cestado]  DEFAULT ('A'),
 CONSTRAINT [PK_SIC_T_PERFIL] PRIMARY KEY CLUSTERED 
(
	[perf_c_yid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Seguridad].[SIC_T_PERFIL] ON
INSERT [Seguridad].[SIC_T_PERFIL] ([perf_c_yid], [perf_c_vnomb], [perf_c_vdesc], [perf_c_cestado]) VALUES (1, N'ADMINISTRADOR', N'TIENE TOTAL CONTROL A LOS MÓDULOS Y PANTALLAS', N'1')
INSERT [Seguridad].[SIC_T_PERFIL] ([perf_c_yid], [perf_c_vnomb], [perf_c_vdesc], [perf_c_cestado]) VALUES (2, N'GERENTE GENERAL', N'TIENE TOTAL CONTROL A LOS MÓDULOS Y PANTALLAS', N'1')
SET IDENTITY_INSERT [Seguridad].[SIC_T_PERFIL] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_VEN_ESTADO]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VEN_ESTADO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_VEN_ESTADO](
	[ven_est_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[ven_est_c_vdescripcion] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_VEN_ESTADO] PRIMARY KEY CLUSTERED 
(
	[ven_est_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_VEN_ESTADO] ON
INSERT [Mantenimiento].[SIC_T_VEN_ESTADO] ([ven_est_c_iid], [ven_est_c_vdescripcion]) VALUES (1, N'POR REGULARIZAR')
INSERT [Mantenimiento].[SIC_T_VEN_ESTADO] ([ven_est_c_iid], [ven_est_c_vdescripcion]) VALUES (2, N'FACTURADO')
INSERT [Mantenimiento].[SIC_T_VEN_ESTADO] ([ven_est_c_iid], [ven_est_c_vdescripcion]) VALUES (3, N'ANULADO')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_VEN_ESTADO] OFF
/****** Object:  Table [Seguridad].[SIC_T_USUARIO_PERFIL]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_PERFIL]') AND type in (N'U'))
BEGIN
CREATE TABLE [Seguridad].[SIC_T_USUARIO_PERFIL](
	[perf_c_yid] [tinyint] NOT NULL,
	[usua_c_cdoc_id] [varchar](10) NOT NULL,
	[usua_perfil_c_cestado] [char](1) NULL CONSTRAINT [DF_SIC_T_USUARIO_PERFIL_usua_perfil_c_cestado]  DEFAULT ('A'),
PRIMARY KEY CLUSTERED 
(
	[perf_c_yid] ASC,
	[usua_c_cdoc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Seguridad].[SIC_T_USUARIO_PERFIL] ([perf_c_yid], [usua_c_cdoc_id], [usua_perfil_c_cestado]) VALUES (1, N'ADMIN', N'1')
INSERT [Seguridad].[SIC_T_USUARIO_PERFIL] ([perf_c_yid], [usua_c_cdoc_id], [usua_perfil_c_cestado]) VALUES (2, N'SORTIZ', N'1')
/****** Object:  Table [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR](
	[zona_rep_lug_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[zona_rep_c_yid] [tinyint] NULL,
	[zona_rep_lug_c_vdesc] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_ZONA_REPARTO_LUGAR] PRIMARY KEY CLUSTERED 
(
	[zona_rep_lug_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ON
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (1, 1, N'ATE')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (2, 1, N'LA MOLINA')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (3, 1, N'SAN BORJA')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (4, 1, N'SAN ISIDRO 1')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (5, 1, N'SANTA ANITA 1')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (6, 1, N'SURCO 1')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (7, 1, N'SURQUILLO')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (8, 2, N'BREÑA')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (9, 2, N'CALLAO')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (10, 2, N'CERCADO')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (11, 2, N'JESUS MARIA')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (12, 2, N'LA VICTORIA')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (13, 2, N'LOS OLIVOS')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (14, 2, N'PUEBLO LIBRE')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (15, 2, N'RIMAC')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (16, 2, N'SAN LUIS')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (17, 2, N'SAN MIGUEL')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (18, 2, N'SANTA ANITA 2')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (19, 3, N'BARRANCO')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (20, 3, N'CHORRILLOS')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (21, 3, N'LINCE')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (22, 3, N'MAGDALENA')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (23, 3, N'SAN ISIDRO 2')
INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] ([zona_rep_lug_c_iid], [zona_rep_c_yid], [zona_rep_lug_c_vdesc]) VALUES (24, 3, N'SURCO 2')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] OFF
/****** Object:  Table [dbo].[SIC_T_ALMACEN_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO](
	[alm_cst_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[alm_cst_c_iid_centro_costo] [int] NOT NULL,
	[alm_cst_c_iid_almacen] [int] NOT NULL,
 CONSTRAINT [PK_SIC_T_ALMACEN_CENTRO_COSTO] PRIMARY KEY CLUSTERED 
(
	[alm_cst_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET IDENTITY_INSERT [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] ON
INSERT [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] ([alm_cst_c_iid], [alm_cst_c_iid_centro_costo], [alm_cst_c_iid_almacen]) VALUES (1, 2, 1)
INSERT [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] ([alm_cst_c_iid], [alm_cst_c_iid_centro_costo], [alm_cst_c_iid_almacen]) VALUES (4, 1, 3)
INSERT [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] ([alm_cst_c_iid], [alm_cst_c_iid_centro_costo], [alm_cst_c_iid_almacen]) VALUES (5, 1, 7)
SET IDENTITY_INSERT [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] OFF
/****** Object:  Table [Seguridad].[SIC_T_USUARIO_OPCION]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]') AND type in (N'U'))
BEGIN
CREATE TABLE [Seguridad].[SIC_T_USUARIO_OPCION](
	[usua_c_cdoc_id] [varchar](10) NOT NULL,
	[opc_c_iid] [int] NOT NULL,
 CONSTRAINT [PK_SIC_T_USUARIO_OPCION] PRIMARY KEY CLUSTERED 
(
	[usua_c_cdoc_id] ASC,
	[opc_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [General].[SIC_T_PARAMETRO_DET]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[General].[SIC_T_PARAMETRO_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [General].[SIC_T_PARAMETRO_DET](
	[par_c_iid] [int] NOT NULL,
	[par_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[par_det_c_vdesc] [varchar](100) NULL,
	[par_det_c_vcampo_1] [varchar](50) NULL,
	[par_det_c_vcampo_desc_1] [varchar](200) NULL,
	[par_det_c_vcampo_2] [varchar](50) NULL,
	[par_det_c_vcampo_desc_2] [varchar](200) NULL,
	[par_det_c_vcampo_3] [varchar](50) NULL,
	[par_det_c_vcampo_desc_3] [varchar](200) NULL,
	[par_det_c_vcampo_4] [varchar](50) NULL,
	[par_det_c_vcampo_desc_4] [varchar](200) NULL,
	[par_det_c_vcampo_5] [varchar](50) NULL,
	[par_det_c_vcampo_desc_5] [varchar](200) NULL,
	[par_det_c_vobs] [varchar](400) NULL,
 CONSTRAINT [PK_SIC_T_PARAMETRO_DET] PRIMARY KEY CLUSTERED 
(
	[par_c_iid] ASC,
	[par_det_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] ON
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 7, N'KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 8, N'LITROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 21, N'LIBRAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 1, N'DNI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 2, N'CARNE EXTRANJERIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 3, N'RUC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (3, 9, N'IGV', N'0.19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (4, 11, N'PERCEPCION', N'0.02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (4, 16, N'MINIMO PARA CALCULO', N'500.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (5, 12, N'SOLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (5, 15, N'DOLARES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (6, 17, N'BOLETA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (6, 18, N'FACTURA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_PROVINCIA]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_PROVINCIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_PROVINCIA](
	[prov_c_ccod] [char](4) NOT NULL,
	[prov_c_vnomb] [varchar](50) NULL,
	[depa_c_ccod] [char](2) NOT NULL,
 CONSTRAINT [PK_SIC_T_PROVINCIA] PRIMARY KEY CLUSTERED 
(
	[prov_c_ccod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0101', N'CHACHAPOYAS', N'01')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0102', N'BAGUA', N'01')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0103', N'BONGARA', N'01')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0104', N'CONDORCANQUI', N'01')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0105', N'LUYA', N'01')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0106', N'RODRIGUEZ DE MENDOZA', N'01')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0107', N'UTCUBAMBA', N'01')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0201', N'HUARAZ', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0202', N'AIJA', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0203', N'ANTONIO RAYMONDI', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0204', N'ASUNCION', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0205', N'BOLOGNESI', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0206', N'CARHUAZ', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0207', N'CARLOS FERMIN FITZCARRALD', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0208', N'CASMA', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0209', N'CORONGO', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0210', N'HUARI', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0211', N'HUARMEY', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0212', N'HUAYLAS', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0213', N'MARISCAL LUZURIAGA', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0214', N'OCROS', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0215', N'PALLASCA', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0216', N'POMABAMBA', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0217', N'RECUAY', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0218', N'SANTA', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0219', N'SIHUAS', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0220', N'YUNGAY', N'02')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0301', N'ABANCAY', N'03')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0302', N'ANDAHUAYLAS', N'03')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0303', N'ANTABAMBA', N'03')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0304', N'AYMARAES', N'03')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0305', N'COTABAMBAS', N'03')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0306', N'CHINCHEROS', N'03')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0307', N'GRAU', N'03')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0401', N'AREQUIPA', N'04')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0402', N'CAMANA', N'04')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0403', N'CARAVELI', N'04')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0404', N'CASTILLA', N'04')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0405', N'CAYLLOMA', N'04')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0406', N'CONDESUYOS', N'04')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0407', N'ISLAY', N'04')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0408', N'LA UNION', N'04')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0501', N'HUAMANGA', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0502', N'CANGALLO', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0503', N'HUANCA SANCOS', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0504', N'HUANTA', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0505', N'LA MAR', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0506', N'LUCANAS', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0507', N'PARINACOCHAS', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0508', N'PAUCAR DEL SARA SARA', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0509', N'SUCRE', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0510', N'VICTOR FAJARDO', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0511', N'VILCAS HUAMAN', N'05')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0601', N'CAJAMARCA', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0602', N'CAJABAMBA', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0603', N'CELENDIN', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0604', N'CHOTA', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0605', N'CONTUMAZA', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0606', N'CUTERVO', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0607', N'HUALGAYOC', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0608', N'JAEN', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0609', N'SAN IGNACIO', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0610', N'SAN MARCOS', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0611', N'SAN MIGUEL', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0612', N'SAN PABLO', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0613', N'SANTA CRUZ', N'06')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0701', N'PROV. CONST. DEL CALLAO', N'07')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0801', N'CUSCO', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0802', N'ACOMAYO', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0803', N'ANTA', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0804', N'CALCA', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0805', N'CANAS', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0806', N'CANCHIS', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0807', N'CHUMBIVILCAS', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0808', N'ESPINAR', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0809', N'LA CONVENCION', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0810', N'PARURO', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0811', N'PAUCARTAMBO', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0812', N'QUISPICANCHI', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0813', N'URUBAMBA', N'08')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0901', N'HUANCAVELICA', N'09')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0902', N'ACOBAMBA', N'09')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0903', N'ANGARAES', N'09')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0904', N'CASTROVIRREYNA', N'09')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0905', N'CHURCAMPA', N'09')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0906', N'HUAYTARA', N'09')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'0907', N'TAYACAJA', N'09')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1001', N'HUANUCO', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1002', N'AMBO', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1003', N'DOS DE MAYO', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1004', N'HUACAYBAMBA', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1005', N'HUAMALIES', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1006', N'LEONCIO PRADO', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1007', N'MARAÑON', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1008', N'PACHITEA', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1009', N'PUERTO INCA', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1010', N'LAURICOCHA', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1011', N'YAROWILCA', N'10')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1101', N'ICA', N'11')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1102', N'CHINCHA', N'11')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1103', N'NAZCA', N'11')
GO
print 'Processed 100 total records'
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1104', N'PALPA', N'11')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1105', N'PISCO', N'11')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1201', N'HUANCAYO', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1202', N'CONCEPCION', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1203', N'CHANCHAMAYO', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1204', N'JAUJA', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1205', N'JUNIN', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1206', N'SATIPO', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1207', N'TARMA', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1208', N'YAULI', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1209', N'CHUPACA', N'12')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1301', N'TRUJILLO', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1302', N'ASCOPE', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1303', N'BOLIVAR', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1304', N'CHEPEN', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1305', N'JULCAN', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1306', N'OTUZCO', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1307', N'PACASMAYO', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1308', N'PATAZ', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1309', N'SANCHEZ CARRION', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1310', N'SANTIAGO DE CHUCO', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1311', N'GRAN CHIMU', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1312', N'VIRU', N'13')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1401', N'CHICLAYO', N'14')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1402', N'FERREÑAFE', N'14')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1403', N'LAMBAYEQUE', N'14')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1501', N'LIMA', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1502', N'BARRANCA', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1503', N'CAJATAMBO', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1504', N'CANTA', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1505', N'CAÑETE', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1506', N'HUARAL', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1507', N'HUAROCHIRI', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1508', N'HUAURA', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1509', N'OYON', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1510', N'YAUYOS', N'15')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1601', N'MAYNAS', N'16')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1602', N'ALTO AMAZONAS', N'16')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1603', N'LORETO', N'16')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1604', N'MARISCAL RAMON CASTILLA', N'16')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1605', N'REQUENA', N'16')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1606', N'UCAYALI', N'16')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1607', N'DATEM DEL MARAÑON', N'16')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1701', N'TAMBOPATA', N'17')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1702', N'MANU', N'17')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1703', N'TAHUAMANU', N'17')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1801', N'MARISCAL NIETO', N'18')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1802', N'GENERAL SANCHEZ CERRO', N'18')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1803', N'ILO', N'18')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1901', N'PASCO', N'19')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1902', N'DANIEL ALCIDES CARRION', N'19')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'1903', N'OXAPAMPA', N'19')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2001', N'PIURA', N'20')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2002', N'AYABACA', N'20')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2003', N'HUANCABAMBA', N'20')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2004', N'MORROPON', N'20')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2005', N'PAITA', N'20')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2006', N'SULLANA', N'20')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2007', N'TALARA', N'20')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2008', N'SECHURA', N'20')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2101', N'PUNO', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2102', N'AZANGARO', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2103', N'CARABAYA', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2104', N'CHUCUITO', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2105', N'EL COLLAO', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2106', N'HUANCANE', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2107', N'LAMPA', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2108', N'MELGAR', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2109', N'MOHO', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2110', N'SAN ANTONIO DE PUTINA', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2111', N'SAN ROMAN', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2112', N'SANDIA', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2113', N'YUNGUYO', N'21')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2201', N'MOYOBAMBA', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2202', N'BELLAVISTA', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2203', N'EL DORADO', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2204', N'HUALLAGA', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2205', N'LAMAS', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2206', N'MARISCAL CACERES', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2207', N'PICOTA', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2208', N'RIOJA', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2209', N'SAN MARTIN', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2210', N'TOCACHE', N'22')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2301', N'TACNA', N'23')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2302', N'CANDARAVE', N'23')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2303', N'JORGE BASADRE', N'23')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2304', N'TARATA', N'23')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2401', N'TUMBES', N'24')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2402', N'CONTRALMIRANTE VILLAR', N'24')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2403', N'ZARUMILLA', N'24')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2501', N'CORONEL PORTILLO', N'25')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2502', N'ATALAYA', N'25')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2503', N'PADRE ABAD', N'25')
INSERT [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod], [prov_c_vnomb], [depa_c_ccod]) VALUES (N'2504', N'PURUS', N'25')
/****** Object:  Table [Seguridad].[SIC_T_PERFIL_OPCION]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]') AND type in (N'U'))
BEGIN
CREATE TABLE [Seguridad].[SIC_T_PERFIL_OPCION](
	[perf_c_yid] [tinyint] NOT NULL,
	[opc_c_iid] [int] NOT NULL,
 CONSTRAINT [PK_SIC_T_PERFIL_OPCION] PRIMARY KEY CLUSTERED 
(
	[perf_c_yid] ASC,
	[opc_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
/****** Object:  Table [Seguridad].[SIC_T_PERFIL_MENU]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]') AND type in (N'U'))
BEGIN
CREATE TABLE [Seguridad].[SIC_T_PERFIL_MENU](
	[perf_c_yid] [tinyint] NOT NULL,
	[menu_c_iid] [int] NOT NULL,
	[perf_menu_c_calta] [char](1) NULL CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_calta]  DEFAULT ('A'),
	[perf_menu_c_cmod] [char](1) NULL CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_cmod]  DEFAULT ('A'),
	[perf_menu_c_celim] [char](1) NULL CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_celim]  DEFAULT ('A'),
	[perf_menu_c_cvisual] [char](1) NULL CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_cvisual]  DEFAULT ('A'),
	[perf_menu_c_cimpre] [char](1) NULL CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_cimpre]  DEFAULT ('A'),
	[perf_menu_c_cproc] [char](1) NULL CONSTRAINT [DF_SIC_T_PERFIL_MENU_perf_menu_c_cproc]  DEFAULT ('A'),
 CONSTRAINT [PK_SIC_T_PERFIL_MENU] PRIMARY KEY CLUSTERED 
(
	[perf_c_yid] ASC,
	[menu_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (1, 1, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (1, 2, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (1, 3, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (1, 5, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (1, 6, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (1, 7, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (1, 8, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (1, 11, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (2, 1, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (2, 2, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (2, 3, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (2, 5, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (2, 6, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (2, 7, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (2, 8, N'A', N'A', N'A', N'A', N'A', N'A')
INSERT [Seguridad].[SIC_T_PERFIL_MENU] ([perf_c_yid], [menu_c_iid], [perf_menu_c_calta], [perf_menu_c_cmod], [perf_menu_c_celim], [perf_menu_c_cvisual], [perf_menu_c_cimpre], [perf_menu_c_cproc]) VALUES (2, 11, N'A', N'A', N'A', N'A', N'A', N'A')
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA](
	[isf_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[isf_c_des] [varchar](100) NOT NULL,
	[isf_c_ifm_iid] [int] NOT NULL,
	[isf_c_bactivo] [bit] NOT NULL,
 CONSTRAINT [PK_SIC_T_SUB_FAMILIA_ITEM] PRIMARY KEY CLUSTERED 
(
	[isf_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ON
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (1, N'sub familia 1', 1, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (2, N'prueba sub familia', 1, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (3, N'esparragos zincado', 2, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (4, N'Autorroscante Zincad', 4, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (5, N'Estobol Zincado', 5, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (6, N'pernos exa negros', 6, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (7, N'pernos exa zincados', 6, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (8, N'pernos exa tropicali', 6, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (9, N'pernos c. de coche', 7, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (10, N'pernos de expansion', 7, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (11, N'arandela zincada', 8, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (12, N'arandelas negras', 8, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (13, N'arandela tropicaliza', 8, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (14, N'disco de corte walt', 9, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (15, N'disco d corte norton', 9, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (16, N'disco debaste walt', 9, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (17, N'polifan norton', 9, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (18, N'disco tronzadora', 9, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (19, N'DISCO TRONZADORA W', 9, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (20, N'hoja d cierra sanfle', 11, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (21, N'winchas', 12, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (22, N'lijas de fierro', 13, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (23, N'lijas de agua', 13, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (24, N'lijas de madera', 13, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (25, N'brocas de fierro', 14, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (26, N'angulo camero', 15, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (27, N'Angulo', 15, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (28, N'Platina', 17, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (29, N'Tees', 18, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (30, N'Redondo lizo', 19, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (31, N'Cuadrado Lizo', 20, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (32, N'Plancha liza', 21, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (33, N'Tubo cuadrado', 22, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (34, N'Tubo redondo negro', 22, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (35, N'Rubo rectangular', 24, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (36, N'Fierro corrugado', 25, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (37, N'abrazadera', 26, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (38, N'tarugo de plastico', 27, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (39, N'bisagra de ventana', 28, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (40, N'bisagra', 28, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (41, N'orejas de candado', 29, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (42, N'cerrojo mediano', 30, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (43, N'Cerrojo bebe', 30, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (44, N'cerrojo familiar', 30, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (45, N'CERROJO', 30, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (46, N'manija de ventana', 31, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (47, N'piña', 32, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (48, N'spray', 33, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (49, N'grasa', 34, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (50, N'WD', 35, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (51, N'lunas negras', 36, 1)
INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid], [isf_c_des], [isf_c_ifm_iid], [isf_c_bactivo]) VALUES (52, N'lunas blancas', 36, 1)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_EMP_DIRECCION]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMP_DIRECCION]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_EMP_DIRECCION](
	[emp_dir_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[emp_dir_c_vdireccion] [varchar](100) NULL,
	[emp_dir_c_bactivo] [bit] NULL,
	[emp_dir_c_iid_centrocosto] [int] NOT NULL,
 CONSTRAINT [PK_SIC_T_EMP_DIRECCION] PRIMARY KEY CLUSTERED 
(
	[emp_dir_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_EMP_DIRECCION] ON
INSERT [Mantenimiento].[SIC_T_EMP_DIRECCION] ([emp_dir_c_iid], [emp_dir_c_vdireccion], [emp_dir_c_bactivo], [emp_dir_c_iid_centrocosto]) VALUES (1, N'Local 01', 1, 1)
INSERT [Mantenimiento].[SIC_T_EMP_DIRECCION] ([emp_dir_c_iid], [emp_dir_c_vdireccion], [emp_dir_c_bactivo], [emp_dir_c_iid_centrocosto]) VALUES (2, N'test2', 1, 2)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_EMP_DIRECCION] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_COLABORADOR]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_COLABORADOR](
	[colab_c_cdoc_id] [char](8) NOT NULL,
	[colab_c_cusu_red] [char](10) NULL,
	[colab_c_vnomb] [varchar](50) NULL,
	[colab_c_vape_pat] [varchar](50) NULL,
	[colab_c_vape_mat] [varchar](50) NULL,
	[colab_area_c_yid] [tinyint] NULL,
	[colab_cargo_c_yid] [tinyint] NULL,
 CONSTRAINT [PK_SIC_T_COLABORADOR] PRIMARY KEY CLUSTERED 
(
	[colab_c_cdoc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'        ', N'RP0345    ', N'JACKELYN ELENA', N'LAUREANO', N'CASAS ', 2, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'00042895', N'RP0197    ', N'ANDREA', N'ROCA', N'SALAZAR ', 3, 5)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'02805977', N'RP0324    ', N'TOMAS', N'YOVERA', N'MORE', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'03497923', N'RP0062    ', N'CECILIA', N'MERINO', N'GUEVARA ', 2, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'06282387', N'RP0340    ', N'ROSA AIDA', N'HERNANDEZ', N'ZUÑIGA ', 1, 34)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'06788882', N'RP0269    ', N'ANA CECILIA', N'TORRES', N'UBILLUS ', 3, 5)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'07466617', N'RP0043    ', N'ALDO EDUARDO', N'BARRERA', N'BARRIENTOS ', 1, 6)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'07489045', N'RP0025    ', N'CESAR AUGUSTO', N'PALACIOS', N'DA POZZO ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'07489506', N'RP0299    ', N'ALDO', N'NUÑUVERO', N'PAZ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'07525873', N'RP0347    ', N'JOSE MANUEL', N'QUISPE', N'LITARDO ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'07632679', N'RP0330    ', N'PATRICIA JANETT', N'SOTO', N'CARBAJAL ', 6, 79)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'07861894', N'RP0060    ', N'PEDRO JOSE', N'SEVILLA', N'ALMEIDA ', 3, 8)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'08165628', N'RP0310    ', N'GUILLERMO JOSE', N'ALFARO', N'GLENY', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'08700196', N'RP0070    ', N'CESAR AUGUSTO', N'PILARES', N'CARMONA ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'08833324', N'RP0065    ', N'MANUEL FELIX', N'NUÑEZ', N'CUJES ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09230956', N'RP0045    ', N'ALFREDO MARTIN', N'SANCHEZ', N'YATACO ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09337138', N'RP0030    ', N'RAFAEL', N'DASSO', N'MONTERO ', 2, 9)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09343258', N'RP0066    ', N'IGNACIO MARTIN', N'SABOGAL', N'CARRILLO ', 4, 10)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09378796', N'RP0329    ', N'RAQUEL LOURDES', N'MACHIN', N'CALDERON ', 5, 11)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09446440', N'RP0244    ', N'JOSE TEODORO', N'SALAZAR', N'MOLINA ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09591052', N'RP0071    ', N'RODRIGO OCTAVIO', N'BARZOLA', N'MONTERO ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09652485', N'RP0056    ', N'EDWAR JHON', N'LIZARRAGA', N'PALACIOS ', 1, 13)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09677964', N'RP0046    ', N'ERIC SALVADOR', N'MAYORGA', N'GUTIERREZ ', 1, 14)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09698614', N'RP0014    ', N'LUIS SANTOS', N'APAZA', N'GALVEZ ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09701038', N'RP0114    ', N'JUAN ANTONIO', N'BARRIOS', N'VELASQUEZ ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09722025', N'RP0047    ', N'ROBERTO RICARDO', N'GUILLEN', N'TREJO ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09883558', N'RP0348    ', N'ABEL', N'VALCARCEL', N'MARQUINA ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09958546', N'RP0048    ', N'JENNIFER CECILIA', N'CASANOVA', N'LA CHIRA ', 6, 16)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'09995844', N'RP0247    ', N'FERNANDO CARLO', N'MELGAR', N'GALLEGOS ', 7, 17)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10000533', N'RP0281    ', N'GARLET NOEMI', N'RODRIGUEZ', N'ORTIZ ', 2, 18)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10141183', N'RP0301    ', N'DESSIRE PAOLA', N'SANCHEZ', N'COZ', 6, 19)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10241998', N'RP0073    ', N'ALFREDO AMADOR', N'RAMOS', N'DURAN ', 1, NULL)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10302638', N'RP0212    ', N'LUIS FELIPE', N'CORNEJO', N'DEL BARCO ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10397760', N'RP0085    ', N'MARCOS', N'CARHUAS', N'MAMANI ', 1, 20)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10398015', N'RP0258    ', N'WASHINGTON', N'RICRA', N'PEÑA', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10601580', N'RP0255    ', N'JUAN CARLOS', N'ISLA', N'SORIANO', 7, 21)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10604867', N'RP0296    ', N'ELIAS JONATAN', N'QUISPE', N'ESPINOZA', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'10808972', N'RP0035    ', N'CHRISTIAN MARCELO', N'ALVA', N'GUEVARA ', 5, 22)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'11111111', N'RPEXT009  ', N'JUAN JOSÉ', N'RUIZ DE CASTILLA', N'RAMIREZ', 6, 79)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'16520536', N'RP0049    ', N'FIDEL ROMAIN', N'MONTOYA', N'PIZARRO ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'16662393', N'RP0012    ', N'FREDDY RONALD', N'DIAZ', N'JIMENEZ ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'16694529', N'RP0192    ', N'LUIS ENRIQUE', N'TORRES', N'MARRUFO', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'16708124', N'RP0003    ', N'ISAIAS', N'SANCHEZ', N'SALAZAR ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'16718913', N'RP0337    ', N'HUGO IVAN', N'ZAPATA', N'CORREA ', 1, 20)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'16722431', N'RP0142    ', N'MILUSKA CELESTE', N'LUNA', N'MERCHAN ', 8, 23)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'16729575', N'RP0006    ', N'CARLOS ALBERTO', N'CARRERA', N'MERINO ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'16779198', N'RP0027    ', N'SEGUNDO MANUEL', N'ALARCON', N'CUNYARACHE ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'18011508', N'RP0008    ', N'SHEILA ENRIQUETA', N'LEZCANO', N'MARTINET ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'18127285', N'RP0007    ', N'JUAN ALEXANDER', N'BAZAN', N'ESTRADA ', 1, 4)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'19098821', N'RP0107    ', N'ELIZABETH SOCORRO', N'FERNANDEZ', N'GARCIA ', 9, 24)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'19258187', N'RP0017    ', N'JUAN RAFAEL', N'ROJAS', N'SALINAS ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'19963695', N'RP0103    ', N'JAVIER ANGEL', N'CUYOTUPA', N'NUÑEZ ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'20029596', N'RP0038    ', N'RUBEN HUMBERTO', N'CAHUAYA', N'COLLACHAGUA ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'25610580', N'RP0050    ', N'OCTAVIO ASENCION', N'PANTA', N'BAYONA ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'25625964', N'RP0170    ', N'SALVADOR DE LOURDES', N'MADUEÑO', N'LLONTOP ', 2, 25)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'25683941', N'RP0021    ', N'OSCAR GUILLERMO', N'LOMPARTE', N'ALARCON ', 1, 13)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'25721853', N'RP0074    ', N'EDWIN ROGER', N'PLASENCIA', N'ALCARRAZ ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'29422366', N'RP0120    ', N'ABELARDO JEFFREY', N'FERNANDEZ', N'ESPEJO ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'29590347', N'RP0198    ', N'LUIS ENRIQUE ALEJANDRO', N'MONTOYA', N'BASURCO', 1, 20)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'29614973', N'RP0127    ', N'CARLOS RUBEN RAFAEL', N'MUÑIZ', N'MADUEÑO ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'29697103', N'RP0075    ', N'MARTIN ROBERTO', N'VARGAS', N'HUAMAN ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'29723988', N'RP0215    ', N'VICTOR WILLIAM', N'FIGUEROA', N'LINARES', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'30413276', N'RP0211    ', N'MARCO ANTONIO', N'RIEGA', N'ESQUIVEL', 1, 13)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'30836196', N'RP0229    ', N'NAYIP', N'AGUILAR', N'MENDOZA ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'32983202', N'RP0328    ', N'PATRICIA CATHERINE', N'MAZA', N'PAREJA', 1, 26)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40011103', N'RP0267    ', N'MARIA PIA', N'BACA', N'CAVASSA ', 10, 27)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40022604', N'RP0266    ', N'ALVARO ANDRES', N'MACIAS', N'ARDITTO ', 3, 28)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40047040', N'RP0036    ', N'ALFREDO', N'PALACIOS', N'GAMBOA ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40064540', N'RP0102    ', N'DEISY AIDEE', N'SUAREZ', N'MENDOZA ', 1, 13)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40097847', N'RP0282    ', N'CARLOS ANDRES', N'PEREZ', N'BELTRAN', 11, 29)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40274367', N'RP0222    ', N'MANUEL GIANFRANCO', N'LAZARTE', N'JACOBSEN ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40322463', N'RP0199    ', N'OSCAR TONINHO', N'ORTIZ', N'BARRERA', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40371457', N'RP0241    ', N'JOSE LUIS', N'CALDERON', N'ROCA', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40476602', N'RP0231    ', N'OSEAS VICENTE', N'PALACIOS', N'SANTOS', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40497629', N'RP0294    ', N'DANIELA ROSA', N'MUÑOZ', N'RAFFO', 12, 30)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40599527', N'RP0235    ', N'MIGUEL ANGEL', N'PIMENTEL', N'VARGAS', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40698994', N'RP0278    ', N'ADOLFO OSCAR', N'LUJAN', N'QUINTANA', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40751002', N'RP0322    ', N'NELSON FERNANDO', N'REATEGUI', N'MESIA', 11, 29)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40798774', N'RP0076    ', N'PAUL ANDY', N'GUARDAMINO', N'TORRALVA ', 2, 31)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40836299', N'RP0312    ', N'JULIO CESAR', N'NECIOSUP', N'NAMUCHE', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40870901', N'RP0262    ', N'HILDA DEL ROSARIO', N'CASTRO', N'GOMEZ', 2, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40933522', N'RP0135    ', N'HUMBERTO', N'DAVILA', N'SILVA ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'40945152', N'RP0087    ', N'JACQUELIN EMPERATRIZ', N'FIGUEREDO', N'GOMEZ ', 1, 12)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41070063', N'RP0032    ', N'FREDY ORLANDO', N'ACOSTA', N'FARRO ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41091979', N'RP0009    ', N'ALFREDO WILDER', N'OLIVA', N'VASQUEZ ', 2, 32)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41211731', N'RP0004    ', N'JIMENA', N'CAMPODONICO', N'BUSTIOS ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41255282', N'RP0018    ', N'ANA MARIA', N'CUBAS', N'MALCA ', 2, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41259486', N'RP0152    ', N'ADRIANA RAQUEL', N'SALAZAR', N'CERRO ', 3, 33)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41316024', N'RP0279    ', N'JUAN ANTONIO', N'GONZALES', N'MONTERO', 12, 34)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41348361', N'RP0101    ', N'MALENA CRISTINA', N'RODRIGUEZ', N'VARGAS ', 13, 35)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41354574', N'RP0064    ', N'ANA MARIA', N'ALOMIA', N'ARRESE ', 3, 36)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41381925', N'RP0033    ', N'CLAUDIA MONICA', N'GUEVARA', N'RODRIGUEZ ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41430164', N'RP0117    ', N'RODRIGO', N'CONROY', N'GANOZA ', 14, 37)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41469811', N'RP0069    ', N'CECILIA LISSETHE', N'LUQUE', N'CHUQUIMBALQUI ', 6, 38)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41491446', N'RP0318    ', N'CESAR', N'SEMINARIO', N'BASTANTE', 5, 49)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41494575', N'RP0109    ', N'LUIS ALBERTO', N'LEYVA', N'HORNA ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41554819', N'RP0295    ', N'ROBERTO CARLOS', N'VALVERDE', N'BARRETO', 6, 16)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41629388', N'RP0261    ', N'HAROLD', N'CACERES', N'AMANZO ', 7, 40)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41698200', N'RP0288    ', N'JORGE', N'CHALCO', N'TRELLES', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41745408', N'RP0123    ', N'ELIO ARTEMIO', N'CACERES', N'CONDORI ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41852309', N'RP0317    ', N'LUIS ANDRES', N'RUETE', N'PEÑA ', 5, 41)
GO
print 'Processed 100 total records'
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41853958', N'RP0054    ', N'JESUS', N'MEOÑO', N'FERNANDEZ ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41881491', N'RP0291    ', N'JESUS ESTEBAN', N'PAEZ', N'ANHUAMAN', 13, 42)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41889710', N'RP0037    ', N'ADA ELISABET', N'MEJIA', N'PAIMA ', 14, 43)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41956730', N'RP0077    ', N'MELISSA', N'CHAVEZ', N'SEDAMANOS ', 14, 43)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'41969364', N'RP0105    ', N'HANS ALEXANDER', N'MILLA', N'LUMBE ', 8, 44)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42005684', N'RP0325    ', N'JENSSON JOEL', N'BENAVIDES', N'SALDAÑA', 6, 79)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42027802', N'RP0213    ', N'CARLA DEBORA', N'CASTRO', N'HILARIO ', 15, 46)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42091158', N'RP0321    ', N'TOMAS DAVID', N'TORRES', N'SALDARRIAGA', 7, 45)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42130161', N'RP0122    ', N'ALVARO RENZO', N'SALAS', N'RIVAROLA ', 2, 7)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42225075', N'RP0202    ', N'JUAN PABLO', N'ARRESE', N'FORERO ', 3, 33)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42244819', N'RP0287    ', N'JORGE EULOGIO', N'CASTAÑEDA', N'VARGAS', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42258646', N'RP0139    ', N'SONIA INES', N'CORDOVA', N'PASTOR ', 12, 34)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42267738', N'RP0078    ', N'LUIS ABSALON', N'LUZA', N'CANCINO ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42279524', N'RP0121    ', N'CARLOS ARAM', N'CALACHUA', N'MUÑOZ ', 1, 13)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42284988', N'RP0350    ', N'MAYRA', N'NUÑEZ DEL PRADO', N'ZARATE ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42285708', N'RP0248    ', N'CRISTIAN JOSE', N'PALOMINO', N'FERNANDEZ', 3, 33)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42320087', N'RP0326    ', N'BRYAN PAUL', N'VERGARA', N'GUERRERO ', 6, 19)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42350217', N'RP0029    ', N'KARLA CORINA', N'BAZAN', N'CACERES ', 13, 47)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42351395', N'RP0110    ', N'FIORELLA MARIA', N'BRESCIA', N'PALOMINO ', 15, 48)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42507788', N'RP0055    ', N'KAREN YIZZA', N'GOMEZ', N'CASTILLO ', 5, 49)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42807394', N'RP0342    ', N'MARINA MANUELA', N'OROZCO', N'GALLO ', 5, 41)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42917528', N'RP0084    ', N'LENINKA ISABEL', N'LAZO', N'RAMOS ', 5, 49)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42924895', N'RP0190    ', N'MARIA PILAR', N'VARGAS', N'VALLE ', 2, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42933671', N'RP0315    ', N'JUAN CARLOS', N'GRANTHON', N'CAMPOS', 3, 33)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42972380', N'RP0309    ', N'ANDREA DEL ROSARIO', N'PONCE', N'CARPIO ', 2, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'42993476', N'RP0039    ', N'ANDRES LUCIANO', N'LAINES', N'LAINES ', 1, 13)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43055305', N'RP0053    ', N'GUISSET', N'CRUZ', N'MEZA ', 13, 42)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43062847', N'RP0100    ', N'ANGEL DELFO', N'PAYANO', N'MUÑOZ ', 1, 20)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43110907', N'RP0108    ', N'CYNTHIA LORENA', N'ORELLANA', N'ZANABRIA ', 9, 51)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43137770', N'RP0251    ', N'MARIA ELENA', N'FERNANDEZ', N'FERNANDEZ', 4, 52)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43151444', N'RP0349    ', N'JOSE LEONARDO', N'CHIPANA', N'GUTIERREZ ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43188010', N'RP0124    ', N'MARIA PAZ', N'DELGADO', N'VASSALLO ', 5, 12)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43353987', N'RP0125    ', N'MARIA DEL PILAR', N'GALDOS', N'RIVERA ', 5, 53)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43394218', N'RP0333    ', N'JESUS OMAR', N'VILCA', N'RAMOS ', 2, 34)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43529694', N'RP0293    ', N'LUCIANA VANESSA', N'LANATA', N'JASAUI', 3, 33)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43555077', N'RP0305    ', N'NATY MARITZA', N'MAMANI', N'MAYTA', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43561143', N'RP0090    ', N'DOMENICO', N'POGGI', N'PALMA ', 5, 49)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43584215', N'RP0335    ', N'ALAN STEEVEN', N'NOLASCO', N'CAJAHUARINGA ', 1, 21)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43593894', N'RP0300    ', N'NELY', N'BUSTINCIO', N'CALATAYUD', 2, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43670491', N'PRP058    ', N'JULIA ISABEL', N'RAMOS', N'RIVERA ', 12, 50)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43700584', N'RP0283    ', N'ALEXANDER', N'BARDALES', N'PEREIRA', 10, 55)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43727590', N'RP0362    ', N'LINDA JENNIFER', N'MINA', N'QUISPE ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43781907', N'RP0264    ', N'RENZO GONZALO', N'DURAND', N'MEDINA ', 3, 33)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43812929', N'RP0332    ', N'LINA NATALY', N'CHUMBE', N'VASQUEZ ', 1, 53)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43828955', N'RP0058    ', N'HILDA GIANINA', N'CHAVEZ', N'ALIAGA ', 5, 12)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43977847', N'RP0263    ', N'ANDREA DEL MILAGRO', N'ORIHUELA', N'SOTO', 5, 12)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'43982930', N'RP0280    ', N'RUBEN VLADIMIR', N'VASQUEZ', N'QUISPE', 13, 56)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44029623', N'RP0341    ', N'DIEGO ALEJANDRO', N'VALVIDIA', N'BRUNETTI ', 5, 53)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44086794', N'RP0254    ', N'KATTY LUCIA', N'SALDAÑA', N'TINOCO', 8, 57)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44089469', N'RP0238    ', N'OSCAR WILDE', N'PEREZ', N'POPUCHE', 1, 58)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44105453', N'RP0224    ', N'FIORELLA', N'CAMPOS', N'DIEZ CANSECO', 3, 33)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44111168', N'RP0320    ', N'MARIA DE LOS ANGELES', N'MARTINEZ', N'BILBAO', 5, 53)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44144936', N'RP0304    ', N'IVAN ANDRÉ', N'TELLEZ', N'GARRIDO ', 1, 20)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44157557', N'RP0306    ', N'KELLY DEL PILAR', N'YAIPÉN', N'SEVILLANO', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44171791', N'RP0188    ', N'ANDREA MARIA', N'RUBINI', N'CABALLERO ', 11, 59)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44278781', N'RP0249    ', N'HELEN', N'MENDOZA', N'BURGA', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44280559', N'PRP043    ', N'PERCY ALEXANDER', N'DIAZ', N'ZAMORA ', 5, 60)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44298037', N'RP0331    ', N'LINDA FLOR', N'GARIBAY', N'CALDERON ', 13, 29)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44361340', N'RP0313    ', N'MARÍA DEL CARMEN', N'VARELA', N'QUISPE', 12, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44372151', N'RP0292    ', N'EVERT JHON', N'ENCISO', N'HINOJOSA', 1, 13)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44372488', N'RP0184    ', N'MARIA VICTORIA', N'VASQUEZ', N'PANCORBO ', 1, 61)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44444444', N'RPEXT004  ', N'LENNY', N'ARIAS', N'CAMACHO', 7, 45)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44488068', N'RP0162    ', N'GENESIS', N'VASQUEZ', N'CHAVEZ ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44501438', N'RP0336    ', N'ELIZABETH PATRICIA', N'CALDERON', N'CARLOS ', 1, 16)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44528940', N'PRP032    ', N'SILVANA PAMELA', N'SALAZAR', N'OBREGON ', 1, 62)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44662006', N'RP0216    ', N'WILBER JAVIER', N'MENDOZA', N'CONDORI', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44674054', N'PRP051    ', N'LUCILA BEATRIZ', N'CASTRO', N'MENDOZA ', 5, 60)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44681448', N'RP0143    ', N'NATALY MELISSA', N'GUADALUPE', N'FIERRO ', 8, 23)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44720144', N'RP0284    ', N'ALBA IVET', N'CARBAJAL', N'CASTAÑEDA', 5, 12)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44755856', N'RP0339    ', N'VIVIANA KAREN', N'BAZALAR', N'CHAVARRIA ', 2, 63)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44777727', N'RP0115    ', N'JERLY', N'ARQUEÑO', N'COZ ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44938331', N'RP0273    ', N'JUSTA MARLENY', N'OSCALLA', N'MOCHICA ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'44942648', N'RP0355    ', N'HUBERT', N'GRANDA', N'BATALLANOS ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45021219', N'RP0237    ', N'SANDRA', N'ILLICH', N'LOBATON', 4, 64)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45192603', N'RP0052    ', N'KATIA LOURDES DEL PILAR', N'CHALA', N'PAZ ', 11, 29)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45201220', N'RP0265    ', N'NORKA ESTRELLA', N'SOTIL', N'OLAZABAL ', 15, 66)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45241016', N'RP0311    ', N'ADRIANA', N'BALLON-LANDA', N'DE LA COLINA ', 15, 67)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45282849', N'RP0099    ', N'EDINSON DANNY', N'SALAZAR', N'UCAÑAY ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45355519', N'RP0148    ', N'JOHANA FIORELLA', N'VILLALOBOS', N'VARGAS ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45372071', N'RP0243    ', N'ALEX ENRIQUE', N'MORENO', N'MEREGILDO', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45399398', N'RP0067    ', N'MANUEL ENRIQUE', N'FARIAS', N'MAZA ', 12, 34)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45446052', N'RPEXT006  ', N'OSCAR', N'CUEVA', N'MOSCOSO', 6, 79)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45495063', N'RP0346    ', N'ALVARO AUGUSTO', N'NUÑEZ', N'GUTIERREZ ', 14, 43)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45507632', N'RP0319    ', N'NESTOR DANIEL', N'QUINTANA', N'CALLE', 5, 53)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45738311', N'RP0137    ', N'KAREN VERONICA', N'REQUE', N'ANGELES ', 5, 12)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45798024', N'PRP044    ', N'DELSA YADIRA', N'MALDONADO', N'TARRAGA ', 5, 60)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45799545', N'PRP061    ', N'HELEN', N'CHAVARRY', N'JIMENEZ ', 14, 72)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45864385', N'RP0179    ', N'JUAN', N'MUÑOZ', N'AGUILAR ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45946761', N'RP0242    ', N'CLAUDIA MARIA', N'BORDA', N'FERNANDEZ NESPRAL', 12, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'45968313', N'RP0180    ', N'SHARON CAROLINA', N'SALAZAR', N'LOZANO ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46006731', N'PRP047    ', N'MARYORY ZOYLA YARINA', N'RAMOS', N'DE LOS SANTOS ', 5, 60)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46070950', N'RPP057    ', N'CHRISTIAN ROBERTO', N'YESQUEN', N'LIHIM ', 7, 68)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46090559', N'PRP027    ', N'JHONNY WALTER', N'AGUIRRE', N'ORTEGA ', 11, 69)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46103391', N'PRP046    ', N'JUAN JOSÉ', N'ILLATOPA', N'GUZMAN ', 7, 68)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46131584', N'PRP064    ', N'NATALIA', N'MUÑOZ', N'ROMERO ', 5, 60)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46168763', N'RP0344    ', N'ANNIE ELIZABETH', N'EGOAVIL', N'UEHARA ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46315121', N'RP0220    ', N'EVELYN KAREN', N'PEREZ', N'CUBA', 2, 3)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46331580', N'PRP052    ', N'YESENIA HELEN', N'ROJAS', N'SAENZ ', 5, 60)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46371868', N'PRP063    ', N'CLAUDIA ELISA', N'RAMOS', N'MEJORADA ', 4, 75)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46383526', N'RP0302    ', N'YTALO RODRIGO', N'ESPINAL', N'REYES', 6, 70)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46411333', N'PRP050    ', N'JUAN CARLOS', N'GONZALES', N'LARREA ', 13, 71)
GO
print 'Processed 200 total records'
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46513536', N'RP0298    ', N'YESENIA ALLYSON', N'ROSSI', N'ABURTO', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46579504', N'PRP045    ', N'PAOLO-ANDRE ALBERTO', N'BERETTA', N'PORTOCARRERO ', 15, 72)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46675056', N'PRP026    ', N'KELLY', N'MORENO', N'VELASQUEZ ', 9, 73)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46717579', N'PRP054    ', N'FABIOLA FIORELLA', N'ALVAREZ', N'BETANCOURT ', 2, 74)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46753662', N'PRP059    ', N'TALIA', N'DENEGRI', N'MARTINELLY ', 15, 67)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46786186', NULL, N'JUAN JOSÉ III', N'RUIZ DE CASTILLA', N'RAMIREZ', 1, 1)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46840370', N'RPEXT007  ', N'VALERIA ARELIS', N'QUISPE', N'AUCCASI', 6, 70)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'46868752', N'PRP056    ', N'PAMELA', N'SALAZAR', N'ESPICHE ', 5, 72)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'47143103', N'PRP049    ', N'LOURDES CAROLINA', N'GOMEZ', N'SOLAR ', 5, 60)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'47398992', N'RP0194    ', N'ADA LIZ', N'RODRIGUEZ', N'VILCACHAGUA', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'47466504', N'PRP060    ', N'SILVIA PATRICIA', N'DIAZ', N'NUÑEZ ', 15, 62)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'47511128', N'RP0221    ', N'MARIA EDELMIRA', N'MUÑOZ', N'VASQUEZ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'47756020', N'RP0252    ', N'LILI MARJHORY', N'IBAÑEZ', N'SOSA', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'70014775', N'RP0307    ', N'EVELYN LILIANA', N'RODRIGUEZ', N'SORIANO', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'70309191', N'RP0343    ', N'KATERIN MERCEDES', N'HUARI', N'CHOQUE ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'70315373', N'PRP033    ', N'ANGELICA VIRGINIA', N'ALVARADO', N'ROJAS ', 11, 69)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'70435779', N'PRP020    ', N'BREZZI', N'VENTURA', N'ACURIO ', 11, 69)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'70436625', N'RP0276    ', N'MAYRA GABRIELA', N'ORELLANA', N'LIZARBE', 5, 65)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'71272408', N'RP0316    ', N'THALIA SARA', N'TICSE', N'OTAROLA', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'71274017', N'RP0308    ', N'AMPARO ALICIA', N'ÑAUPARI', N'ESPIRITU', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'71802093', N'RP0361    ', N'ANDREA MARIANA', N'CUADROS', N'ESPINOZA ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'72270623', N'RP0230    ', N'MARIANA FRANCESCA', N'GUTIERREZ', N'VALVERDE', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'72467738', N'RP0334    ', N'BONNY LUCIA', N'DEL CARPIO', N'VILLENA ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'72654411', N'RP0178    ', N'FATIMA ESTHER', N'SONO', N'ROJAS ', 2, 54)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'72860399', N'RP0239    ', N'ADA EVANGELINA', N'TASAYCO', N'VALVERDE ', 15, 76)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'80002785', N'RP0040    ', N'CARLOS GABRIEL', N'BENDEZU', N'CORILLOCLLA ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'80347209', N'RP0028    ', N'AUGUSTO', N'DIAZ', N'GOMEZ ', 1, 2)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'80395336', N'RP0228    ', N'PAUL VICTOR YSRAEL', N'GARCIA', N'CATIRE', 12, 34)
INSERT [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id], [colab_c_cusu_red], [colab_c_vnomb], [colab_c_vape_pat], [colab_c_vape_mat], [colab_area_c_yid], [colab_cargo_c_yid]) VALUES (N'80639739', N'RP0106    ', N'JULIA ZOILA', N'DIAZ', N'VILCA ', 1, 13)
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_NOMBRECOMERCIAL_BUSCAR_EXISTENCIA]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_NOMBRECOMERCIAL_BUSCAR_EXISTENCIA]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_NOMBRECOMERCIAL_BUSCAR_EXISTENCIA]
  @nomb_com_c_vnomb varchar(200)
  AS
  SELECT COUNT(*) FROM SIC_T_NOMB_COM
  WHERE nomb_com_c_vnomb=@nomb_com_c_vnomb
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_MANTENIMIENTO_RAZON_SOCIAL_HISTORICO]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_MANTENIMIENTO_RAZON_SOCIAL_HISTORICO]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_MANTENIMIENTO_RAZON_SOCIAL_HISTORICO]
@CHOPCION CHAR(1),
@CLI_C_VDOC_ID VARCHAR(11), -- CÓDIGO DE CLIENTE
@CLI_RS_H_C_VRAZ_SOC VARCHAR(200)-- RAZÓN SOCIAL ACTUAL DE CLIENTE
AS

IF @CHOPCION = 2 -- TIPO DE OPERACIÓN CREACIÓN
	BEGIN
		IF( @CLI_RS_H_C_VRAZ_SOC <> 
		(SELECT ISNULL(cli_c_vraz_soc,'''') FROM ADV_T_CLIENTE WHERE cli_c_vdoc_id = @CLI_C_VDOC_ID))
		BEGIN
			INSERT INTO SIC_T_CLI_RS_HISTORICO
			VALUES (@CLI_C_VDOC_ID,@CLI_RS_H_C_VRAZ_SOC,GETDATE())
		END
	END
ELSE IF @CHOPCION = 4 -- TIPO DE OPERACIÓN ELIMINACIÓN
	BEGIN
		DELETE SIC_T_CLI_RS_HISTORICO
		WHERE CLI_C_VDOC_ID = @CLI_C_VDOC_ID 
		AND CLI_RS_H_C_VRAZ_SOC = @CLI_RS_H_C_VRAZ_SOC
	END
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_LISTAR_COLABORADORES_POR_AREA]
@INTCODIGOAREA TINYINT
AS

SELECT 
colab_c_cdoc_id ,
colab_c_cusu_red ,
colab_c_vnomb,
colab_c_vape_pat+'' ''+ RTRIM(colab_c_vape_mat)+'', ''+colab_c_vnomb AS ''colab_c_vnomb_completo'',
colab_c_vape_pat,
colab_c_vape_mat,
colab_area_c_yid, 
colab_cargo_c_yid
FROM Mantenimiento.SIC_T_COLABORADOR 
WHERE colab_area_c_yid = @INTCODIGOAREA
ORDER BY colab_c_vape_pat
' 
END
GO
/****** Object:  StoredProcedure [Seguridad].[SIC_SP_LISTAR_PADRES_MENU]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_SP_LISTAR_PADRES_MENU]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [Seguridad].[SIC_SP_LISTAR_PADRES_MENU]
(
	@PC_CODUSUARIO CHAR(10)	
)
/*********************************************************************    
 PROCEDIMIENTO  : SIC_SP_LISTAR_PADRES_MENU
 PROPÓSITO		: CONSIGUE LA CABECERA DEL MENÚ PRINCIPAL.
 INPUTS/OUTPUT  : 
 RETORNO		: N/A     
 AUTOR			: Juan Ruiz de Castilla
 FECHA Y HORA	: 11/10/2012
 MODIFICACIONES : N/A
**********************************************************************/ 
AS
BEGIN
	SELECT DISTINCT	M.menu_c_iid, 
			M.menu_c_vnomb, 
			M.menu_c_vpag_asp, 
			M.menu_c_iid_padre,
			M.menu_c_ynivel
	FROM Seguridad.SIC_T_MENU M 
		INNER JOIN Seguridad.SIC_T_PERFIL_MENU PM
	ON M.menu_c_iid = PM.menu_c_iid
		AND M.menu_c_ynivel = 1
		AND PM.perf_menu_c_cvisual = ''A''
		AND PM.perf_c_yid IN (	SELECT perf_c_yid
								FROM Seguridad.SIC_T_USUARIO_PERFIL
								WHERE usua_c_cdoc_id = @PC_CODUSUARIO 
								AND usua_perfil_c_cestado = ''1'' )
END;



' 
END
GO
/****** Object:  StoredProcedure [Seguridad].[SIC_SP_LISTAR_HIJOS_MENU]    Script Date: 02/19/2014 10:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Seguridad].[SIC_SP_LISTAR_HIJOS_MENU]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [Seguridad].[SIC_SP_LISTAR_HIJOS_MENU]
(
	@PC_CODUSUARIO char(10),
	@PC_CODMENUPRINCIPAL INT
)
/*********************************************************************    
 PROCEDIMIENTO  : SIC_SP_LISTAR_HIJOS_MENU
 PROPÓSITO		: CONSIGUE LOS ITEMS DEL MENÚ PRINCIPAL.
 INPUTS/OUTPUT  : 
 RETORNO		: N/A     
 AUTOR			: Jonnathan De La Barra 
 FECHA Y HORA	: 11/10/2012
 MODIFICACIONES : N/A
**********************************************************************/ 
AS
BEGIN
	SELECT DISTINCT
			M.menu_c_iid, 
			M.menu_c_vnomb, 
			M.menu_c_vpag_asp, 
			M.menu_c_iid_padre,
			M.menu_c_ynivel
	FROM SIC_T_MENU M 
		INNER JOIN SIC_T_PERFIL_MENU PM
	ON M.menu_c_iid = PM.menu_c_iid
		AND M.menu_c_ynivel = 2
		AND	m.menu_c_iid_padre = @PC_CODMENUPRINCIPAL
		AND PM.perf_menu_c_cvisual = ''A'' 
		AND PM.perf_c_yid IN (
					SELECT perf_c_yid
					FROM SIC_T_USUARIO_PERFIL
					WHERE usua_c_cdoc_id = @PC_CODUSUARIO 
					AND usua_perfil_c_cestado = ''1'')
END

' 
END
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_CLIENTE](
	[cli_c_vraz_soc] [varchar](200) NULL,
	[cli_c_vpartida] [varchar](30) NULL,
	[cli_c_vrubro] [varchar](200) NULL,
	[cli_c_ctlf] [varchar](15) NULL,
	[cli_c_dfec_aniv] [date] NULL,
	[cli_c_btipo_pers] [bit] NULL,
	[colab_c_cdoc_id] [char](8) NULL,
	[cli_scor_c_cletra] [char](1) NULL,
	[cli_c_bactivo] [bit] NULL CONSTRAINT [DF_ESTADO_CLI]  DEFAULT ((1)),
	[cli_c_vdoc_id] [varchar](11) NOT NULL,
	[zona_rep_c_yid] [tinyint] NULL,
	[cli_c_dfecharegistra] [datetime] NOT NULL,
	[cli_c_dfechaactualiza] [datetime] NULL,
	[cli_c_dfec_const] [date] NULL,
	[cli_c_bproveedor] [bit] NULL,
	[cli_c_bcliente] [bit] NULL,
 CONSTRAINT [PK_SIC_T_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[cli_c_vdoc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_DISTRITO]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_DISTRITO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_DISTRITO](
	[dist_c_ccod_ubig] [char](6) NOT NULL,
	[dist_c_vnomb] [varchar](50) NULL,
	[prov_c_ccod] [char](4) NOT NULL,
 CONSTRAINT [PK_SIC_T_DISTRITO] PRIMARY KEY CLUSTERED 
(
	[dist_c_ccod_ubig] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010101', N'CHACHAPOYAS', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010102', N'ASUNCION', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010103', N'BALSAS', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010104', N'CHETO', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010105', N'CHILIQUIN', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010106', N'CHUQUIBAMBA', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010107', N'GRANADA', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010108', N'HUANCAS', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010109', N'LA JALCA', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010110', N'LEIMEBAMBA', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010111', N'LEVANTO', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010112', N'MAGDALENA', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010113', N'MARISCAL CASTILLA', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010114', N'MOLINOPAMPA', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010115', N'MONTEVIDEO', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010116', N'OLLEROS', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010117', N'QUINJALCA', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010118', N'SAN FRANCISCO DE DAGUAS', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010119', N'SAN ISIDRO DE MAINO', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010120', N'SOLOCO', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010121', N'SONCHE', N'0101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010201', N'BAGUA', N'0102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010202', N'ARAMANGO', N'0102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010203', N'COPALLIN', N'0102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010204', N'EL PARCO', N'0102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010205', N'IMAZA', N'0102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010206', N'LA PECA', N'0102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010301', N'JUMBILLA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010302', N'CHISQUILLA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010303', N'CHURUJA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010304', N'COROSHA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010305', N'CUISPES', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010306', N'FLORIDA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010307', N'JAZAN', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010308', N'RECTA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010309', N'SAN CARLOS', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010310', N'SHIPASBAMBA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010311', N'VALERA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010312', N'YAMBRASBAMBA', N'0103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010401', N'NIEVA', N'0104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010402', N'EL CENEPA', N'0104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010403', N'RIO SANTIAGO', N'0104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010501', N'LAMUD', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010502', N'CAMPORREDONDO', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010503', N'COCABAMBA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010504', N'COLCAMAR', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010505', N'CONILA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010506', N'INGUILPATA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010507', N'LONGUITA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010508', N'LONYA CHICO', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010509', N'LUYA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010510', N'LUYA VIEJO', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010511', N'MARIA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010512', N'OCALLI', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010513', N'OCUMAL', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010514', N'PISUQUIA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010515', N'PROVIDENCIA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010516', N'SAN CRISTOBAL', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010517', N'SAN FRANCISCO DEL YESO', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010518', N'SAN JERONIMO', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010519', N'SAN JUAN DE LOPECANCHA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010520', N'SANTA CATALINA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010521', N'SANTO TOMAS', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010522', N'TINGO', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010523', N'TRITA', N'0105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010601', N'SAN NICOLAS', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010602', N'CHIRIMOTO', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010603', N'COCHAMAL', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010604', N'HUAMBO', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010605', N'LIMABAMBA', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010606', N'LONGAR', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010607', N'MARISCAL BENAVIDES', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010608', N'MILPUC', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010609', N'OMIA', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010610', N'SANTA ROSA', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010611', N'TOTORA', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010612', N'VISTA ALEGRE', N'0106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010701', N'BAGUA GRANDE', N'0107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010702', N'CAJARURO', N'0107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010703', N'CUMBA', N'0107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010704', N'EL MILAGRO', N'0107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010705', N'JAMALCA', N'0107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010706', N'LONYA GRANDE', N'0107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'010707', N'YAMON', N'0107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020101', N'HUARAZ', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020102', N'COCHABAMBA', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020103', N'COLCABAMBA', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020104', N'HUANCHAY', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020105', N'INDEPENDENCIA', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020106', N'JANGAS', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020107', N'LA LIBERTAD', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020108', N'OLLEROS', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020109', N'PAMPAS', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020110', N'PARIACOTO', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020111', N'PIRA', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020112', N'TARICA', N'0201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020201', N'AIJA', N'0202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020202', N'CORIS', N'0202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020203', N'HUACLLAN', N'0202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020204', N'LA MERCED', N'0202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020205', N'SUCCHA', N'0202')
GO
print 'Processed 100 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020301', N'LLAMELLIN', N'0203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020302', N'ACZO', N'0203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020303', N'CHACCHO', N'0203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020304', N'CHINGAS', N'0203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020305', N'MIRGAS', N'0203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020306', N'SAN JUAN DE RONTOY', N'0203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020401', N'CHACAS', N'0204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020402', N'ACOCHACA', N'0204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020501', N'CHIQUIAN', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020502', N'ABELARDO PARDO LEZAMETA', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020503', N'ANTONIO RAYMONDI', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020504', N'AQUIA', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020505', N'CAJACAY', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020506', N'CANIS', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020507', N'COLQUIOC', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020508', N'HUALLANCA', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020509', N'HUASTA', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020510', N'HUAYLLACAYAN', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020511', N'LA PRIMAVERA', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020512', N'MANGAS', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020513', N'PACLLON', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020514', N'SAN MIGUEL DE CORPANQUI', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020515', N'TICLLOS', N'0205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020601', N'CARHUAZ', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020602', N'ACOPAMPA', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020603', N'AMASHCA', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020604', N'ANTA', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020605', N'ATAQUERO', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020606', N'MARCARA', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020607', N'PARIAHUANCA', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020608', N'SAN MIGUEL DE ACO', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020609', N'SHILLA', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020610', N'TINCO', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020611', N'YUNGAR', N'0206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020701', N'SAN LUIS', N'0207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020702', N'SAN NICOLAS', N'0207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020703', N'YAUYA', N'0207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020801', N'CASMA', N'0208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020802', N'BUENA VISTA ALTA', N'0208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020803', N'COMANDANTE NOEL', N'0208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020804', N'YAUTAN', N'0208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020901', N'CORONGO', N'0209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020902', N'ACO', N'0209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020903', N'BAMBAS', N'0209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020904', N'CUSCA', N'0209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020905', N'LA PAMPA', N'0209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020906', N'YANAC', N'0209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'020907', N'YUPAN', N'0209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021001', N'HUARI', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021002', N'ANRA', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021003', N'CAJAY', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021004', N'CHAVIN DE HUANTAR', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021005', N'HUACACHI', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021006', N'HUACCHIS', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021007', N'HUACHIS', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021008', N'HUANTAR', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021009', N'MASIN', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021010', N'PAUCAS', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021011', N'PONTO', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021012', N'RAHUAPAMPA', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021013', N'RAPAYAN', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021014', N'SAN MARCOS', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021015', N'SAN PEDRO DE CHANA', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021016', N'UCO', N'0210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021101', N'HUARMEY', N'0211')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021102', N'COCHAPETI', N'0211')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021103', N'CULEBRAS', N'0211')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021104', N'HUAYAN', N'0211')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021105', N'MALVAS', N'0211')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021201', N'CARAZ', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021202', N'HUALLANCA', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021203', N'HUATA', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021204', N'HUAYLAS', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021205', N'MATO', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021206', N'PAMPAROMAS', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021207', N'PUEBLO LIBRE  / 1 ', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021208', N'SANTA CRUZ', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021209', N'SANTO TORIBIO', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021210', N'YURACMARCA', N'0212')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021301', N'PISCOBAMBA', N'0213')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021302', N'CASCA', N'0213')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021303', N'ELEAZAR GUZMAN BARRON', N'0213')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021304', N'FIDEL OLIVAS ESCUDERO', N'0213')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021305', N'LLAMA', N'0213')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021306', N'LLUMPA', N'0213')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021307', N'LUCMA', N'0213')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021308', N'MUSGA', N'0213')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021401', N'OCROS', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021402', N'ACAS', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021403', N'CAJAMARQUILLA', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021404', N'CARHUAPAMPA', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021405', N'COCHAS', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021406', N'CONGAS', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021407', N'LLIPA', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021408', N'SAN CRISTOBAL DE RAJAN', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021409', N'SAN PEDRO', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021410', N'SANTIAGO DE CHILCAS', N'0214')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021501', N'CABANA', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021502', N'BOLOGNESI', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021503', N'CONCHUCOS', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021504', N'HUACASCHUQUE', N'0215')
GO
print 'Processed 200 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021505', N'HUANDOVAL', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021506', N'LACABAMBA', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021507', N'LLAPO', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021508', N'PALLASCA', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021509', N'PAMPAS', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021510', N'SANTA ROSA', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021511', N'TAUCA', N'0215')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021601', N'POMABAMBA', N'0216')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021602', N'HUAYLLAN', N'0216')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021603', N'PAROBAMBA', N'0216')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021604', N'QUINUABAMBA', N'0216')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021701', N'RECUAY', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021702', N'CATAC', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021703', N'COTAPARACO', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021704', N'HUAYLLAPAMPA', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021705', N'LLACLLIN', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021706', N'MARCA', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021707', N'PAMPAS CHICO', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021708', N'PARARIN', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021709', N'TAPACOCHA', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021710', N'TICAPAMPA', N'0217')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021801', N'CHIMBOTE', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021802', N'CACERES DEL PERU', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021803', N'COISHCO', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021804', N'MACATE', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021805', N'MORO', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021806', N'NEPEÑA', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021807', N'SAMANCO', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021808', N'SANTA', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021809', N'NUEVO CHIMBOTE', N'0218')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021901', N'SIHUAS', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021902', N'ACOBAMBA', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021903', N'ALFONSO UGARTE', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021904', N'CASHAPAMPA', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021905', N'CHINGALPO', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021906', N'HUAYLLABAMBA', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021907', N'QUICHES', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021908', N'RAGASH', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021909', N'SAN JUAN', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'021910', N'SICSIBAMBA', N'0219')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'022001', N'YUNGAY', N'0220')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'022002', N'CASCAPARA', N'0220')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'022003', N'MANCOS', N'0220')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'022004', N'MATACOTO', N'0220')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'022005', N'QUILLO', N'0220')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'022006', N'RANRAHIRCA', N'0220')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'022007', N'SHUPLUY', N'0220')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'022008', N'YANAMA', N'0220')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030101', N'ABANCAY', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030102', N'CHACOCHE', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030103', N'CIRCA', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030104', N'CURAHUASI', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030105', N'HUANIPACA', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030106', N'LAMBRAMA', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030107', N'PICHIRHUA', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030108', N'SAN PEDRO DE CACHORA', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030109', N'TAMBURCO', N'0301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030201', N'ANDAHUAYLAS', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030202', N'ANDARAPA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030203', N'CHIARA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030204', N'HUANCARAMA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030205', N'HUANCARAY', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030206', N'HUAYANA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030207', N'KISHUARA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030208', N'PACOBAMBA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030209', N'PACUCHA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030210', N'PAMPACHIRI', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030211', N'POMACOCHA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030212', N'SAN ANTONIO DE CACHI', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030213', N'SAN JERONIMO', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030214', N'SAN MIGUEL DE CHACCRAMPA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030215', N'SANTA MARIA DE CHICMO', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030216', N'TALAVERA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030217', N'TUMAY HUARACA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030218', N'TURPO', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030219', N'KAQUIABAMBA', N'0302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030301', N'ANTABAMBA', N'0303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030302', N'EL ORO', N'0303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030303', N'HUAQUIRCA', N'0303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030304', N'JUAN ESPINOZA MEDRANO', N'0303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030305', N'OROPESA', N'0303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030306', N'PACHACONAS', N'0303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030307', N'SABAINO', N'0303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030401', N'CHALHUANCA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030402', N'CAPAYA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030403', N'CARAYBAMBA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030404', N'CHAPIMARCA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030405', N'COLCABAMBA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030406', N'COTARUSE', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030407', N'HUAYLLO', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030408', N'JUSTO APU SAHUARAURA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030409', N'LUCRE', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030410', N'POCOHUANCA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030411', N'SAN JUAN DE CHACÑA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030412', N'SAÑAYCA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030413', N'SORAYA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030414', N'TAPAIRIHUA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030415', N'TINTAY', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030416', N'TORAYA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030417', N'YANACA', N'0304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030501', N'TAMBOBAMBA', N'0305')
GO
print 'Processed 300 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030502', N'COTABAMBAS', N'0305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030503', N'COYLLURQUI', N'0305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030504', N'HAQUIRA', N'0305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030505', N'MARA', N'0305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030506', N'CHALLHUAHUACHO', N'0305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030601', N'CHINCHEROS', N'0306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030602', N'ANCO-HUALLO', N'0306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030603', N'COCHARCAS', N'0306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030604', N'HUACCANA', N'0306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030605', N'OCOBAMBA', N'0306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030606', N'ONGOY', N'0306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030607', N'URANMARCA', N'0306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030608', N'RANRACANCHA', N'0306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030701', N'CHUQUIBAMBILLA', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030702', N'CURPAHUASI', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030703', N'GAMARRA', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030704', N'HUAYLLATI', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030705', N'MAMARA', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030706', N'MICAELA BASTIDAS', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030707', N'PATAYPAMPA', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030708', N'PROGRESO', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030709', N'SAN ANTONIO', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030710', N'SANTA ROSA', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030711', N'TURPAY', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030712', N'VILCABAMBA', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030713', N'VIRUNDO', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'030714', N'CURASCO', N'0307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040101', N'AREQUIPA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040102', N'ALTO SELVA ALEGRE', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040103', N'CAYMA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040104', N'CERRO COLORADO', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040105', N'CHARACATO', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040106', N'CHIGUATA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040107', N'JACOBO HUNTER', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040108', N'LA JOYA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040109', N'MARIANO MELGAR', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040110', N'MIRAFLORES', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040111', N'MOLLEBAYA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040112', N'PAUCARPATA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040113', N'POCSI', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040114', N'POLOBAYA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040115', N'QUEQUEÑA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040116', N'SABANDIA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040117', N'SACHACA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040118', N'SAN JUAN DE SIGUAS /1', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040119', N'SAN JUAN DE TARUCANI', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040120', N'SANTA ISABEL DE SIGUAS', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040121', N'SANTA RITA DE SIGUAS', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040122', N'SOCABAYA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040123', N'TIABAYA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040124', N'UCHUMAYO', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040125', N'VITOR ', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040126', N'YANAHUARA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040127', N'YARABAMBA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040128', N'YURA', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040129', N'JOSE LUIS BUSTAMANTE Y RIVERO', N'0401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040201', N'CAMANA', N'0402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040202', N'JOSE MARIA QUIMPER', N'0402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040203', N'MARIANO NICOLAS VALCARCEL', N'0402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040204', N'MARISCAL CACERES', N'0402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040205', N'NICOLAS DE PIEROLA', N'0402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040206', N'OCOÑA', N'0402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040207', N'QUILCA', N'0402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040208', N'SAMUEL PASTOR', N'0402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040301', N'CARAVELI', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040302', N'ACARI', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040303', N'ATICO', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040304', N'ATIQUIPA', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040305', N'BELLA UNION', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040306', N'CAHUACHO', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040307', N'CHALA', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040308', N'CHAPARRA', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040309', N'HUANUHUANU', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040310', N'JAQUI', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040311', N'LOMAS', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040312', N'QUICACHA', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040313', N'YAUCA', N'0403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040401', N'APLAO', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040402', N'ANDAGUA', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040403', N'AYO', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040404', N'CHACHAS', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040405', N'CHILCAYMARCA', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040406', N'CHOCO', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040407', N'HUANCARQUI', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040408', N'MACHAGUAY', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040409', N'ORCOPAMPA', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040410', N'PAMPACOLCA', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040411', N'TIPAN', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040412', N'UÑON', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040413', N'URACA', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040414', N'VIRACO', N'0404')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040501', N'CHIVAY', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040502', N'ACHOMA', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040503', N'CABANACONDE', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040504', N'CALLALLI', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040505', N'CAYLLOMA', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040506', N'COPORAQUE', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040507', N'HUAMBO', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040508', N'HUANCA', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040509', N'ICHUPAMPA', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040510', N'LARI', N'0405')
GO
print 'Processed 400 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040511', N'LLUTA', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040512', N'MACA', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040513', N'MADRIGAL', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040514', N'SAN ANTONIO DE CHUCA  2/', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040515', N'SIBAYO', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040516', N'TAPAY', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040517', N'TISCO', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040518', N'TUTI', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040519', N'YANQUE', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040520', N'MAJES', N'0405')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040601', N'CHUQUIBAMBA', N'0406')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040602', N'ANDARAY', N'0406')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040603', N'CAYARANI', N'0406')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040604', N'CHICHAS', N'0406')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040605', N'IRAY', N'0406')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040606', N'RIO GRANDE', N'0406')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040607', N'SALAMANCA', N'0406')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040608', N'YANAQUIHUA', N'0406')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040701', N'MOLLENDO', N'0407')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040702', N'COCACHACRA', N'0407')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040703', N'DEAN VALDIVIA', N'0407')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040704', N'ISLAY', N'0407')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040705', N'MEJIA', N'0407')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040706', N'PUNTA DE BOMBON', N'0407')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040801', N'COTAHUASI', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040802', N'ALCA', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040803', N'CHARCANA', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040804', N'HUAYNACOTAS', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040805', N'PAMPAMARCA', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040806', N'PUYCA', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040807', N'QUECHUALLA', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040808', N'SAYLA', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040809', N'TAURIA', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040810', N'TOMEPAMPA', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'040811', N'TORO', N'0408')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050101', N'AYACUCHO', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050102', N'ACOCRO', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050103', N'ACOS VINCHOS', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050104', N'CARMEN ALTO', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050105', N'CHIARA', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050106', N'OCROS', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050107', N'PACAYCASA', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050108', N'QUINUA', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050109', N'SAN JOSE DE TICLLAS', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050110', N'SAN JUAN BAUTISTA', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050111', N'SANTIAGO DE PISCHA', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050112', N'SOCOS', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050113', N'TAMBILLO', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050114', N'VINCHOS', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050115', N'JESUS NAZARENO', N'0501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050201', N'CANGALLO', N'0502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050202', N'CHUSCHI', N'0502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050203', N'LOS MOROCHUCOS', N'0502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050204', N'MARIA PARADO DE BELLIDO', N'0502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050205', N'PARAS', N'0502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050206', N'TOTOS', N'0502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050301', N'SANCOS', N'0503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050302', N'CARAPO', N'0503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050303', N'SACSAMARCA', N'0503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050304', N'SANTIAGO DE LUCANAMARCA', N'0503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050401', N'HUANTA', N'0504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050402', N'AYAHUANCO', N'0504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050403', N'HUAMANGUILLA', N'0504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050404', N'IGUAIN', N'0504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050405', N'LURICOCHA', N'0504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050406', N'SANTILLANA', N'0504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050407', N'SIVIA', N'0504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050408', N'LLOCHEGUA', N'0504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050501', N'SAN MIGUEL', N'0505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050502', N'ANCO', N'0505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050503', N'AYNA', N'0505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050504', N'CHILCAS', N'0505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050505', N'CHUNGUI', N'0505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050506', N'LUIS CARRANZA', N'0505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050507', N'SANTA ROSA', N'0505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050508', N'TAMBO', N'0505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050601', N'PUQUIO', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050602', N'AUCARA', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050603', N'CABANA', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050604', N'CARMEN SALCEDO', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050605', N'CHAVIÑA', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050606', N'CHIPAO', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050607', N'HUAC-HUAS', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050608', N'LARAMATE', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050609', N'LEONCIO PRADO', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050610', N'LLAUTA', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050611', N'LUCANAS', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050612', N'OCAÑA', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050613', N'OTOCA', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050614', N'SAISA', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050615', N'SAN CRISTOBAL', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050616', N'SAN JUAN', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050617', N'SAN PEDRO', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050618', N'SAN PEDRO DE PALCO', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050619', N'SANCOS', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050620', N'SANTA ANA DE HUAYCAHUACHO', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050621', N'SANTA LUCIA', N'0506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050701', N'CORACORA', N'0507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050702', N'CHUMPI', N'0507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050703', N'CORONEL CASTAÑEDA', N'0507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050704', N'PACAPAUSA', N'0507')
GO
print 'Processed 500 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050705', N'PULLO', N'0507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050706', N'PUYUSCA', N'0507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050707', N'SAN FRANCISCO DE RAVACAYCO', N'0507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050708', N'UPAHUACHO', N'0507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050801', N'PAUSA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050802', N'COLTA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050803', N'CORCULLA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050804', N'LAMPA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050805', N'MARCABAMBA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050806', N'OYOLO', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050807', N'PARARCA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050808', N'SAN JAVIER DE ALPABAMBA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050809', N'SAN JOSE DE USHUA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050810', N'SARA SARA', N'0508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050901', N'QUEROBAMBA', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050902', N'BELEN', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050903', N'CHALCOS', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050904', N'CHILCAYOC', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050905', N'HUACAÑA', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050906', N'MORCOLLA', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050907', N'PAICO', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050908', N'SAN PEDRO DE LARCAY', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050909', N'SAN SALVADOR DE QUIJE', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050910', N'SANTIAGO DE PAUCARAY', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'050911', N'SORAS', N'0509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051001', N'HUANCAPI', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051002', N'ALCAMENCA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051003', N'APONGO', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051004', N'ASQUIPATA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051005', N'CANARIA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051006', N'CAYARA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051007', N'COLCA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051008', N'HUAMANQUIQUIA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051009', N'HUANCARAYLLA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051010', N'HUAYA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051011', N'SARHUA', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051012', N'VILCANCHOS', N'0510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051101', N'VILCAS HUAMAN', N'0511')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051102', N'ACCOMARCA', N'0511')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051103', N'CARHUANCA', N'0511')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051104', N'CONCEPCION', N'0511')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051105', N'HUAMBALPA', N'0511')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051106', N'INDEPENDENCIA /1', N'0511')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051107', N'SAURAMA', N'0511')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'051108', N'VISCHONGO', N'0511')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060101', N'CAJAMARCA', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060102', N'ASUNCION', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060103', N'CHETILLA', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060104', N'COSPAN', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060105', N'ENCAÑADA', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060106', N'JESUS', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060107', N'LLACANORA', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060108', N'LOS BAÑOS DEL INCA', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060109', N'MAGDALENA', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060110', N'MATARA', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060111', N'NAMORA', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060112', N'SAN JUAN', N'0601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060201', N'CAJABAMBA', N'0602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060202', N'CACHACHI', N'0602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060203', N'CONDEBAMBA', N'0602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060204', N'SITACOCHA', N'0602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060301', N'CELENDIN', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060302', N'CHUMUCH', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060303', N'CORTEGANA', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060304', N'HUASMIN', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060305', N'JORGE CHAVEZ', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060306', N'JOSE GALVEZ', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060307', N'MIGUEL IGLESIAS', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060308', N'OXAMARCA', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060309', N'SOROCHUCO', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060310', N'SUCRE', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060311', N'UTCO', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060312', N'LA LIBERTAD DE PALLAN', N'0603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060401', N'CHOTA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060402', N'ANGUIA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060403', N'CHADIN', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060404', N'CHIGUIRIP', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060405', N'CHIMBAN', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060406', N'CHOROPAMPA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060407', N'COCHABAMBA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060408', N'CONCHAN', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060409', N'HUAMBOS', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060410', N'LAJAS', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060411', N'LLAMA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060412', N'MIRACOSTA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060413', N'PACCHA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060414', N'PION', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060415', N'QUEROCOTO', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060416', N'SAN JUAN DE LICUPIS', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060417', N'TACABAMBA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060418', N'TOCMOCHE', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060419', N'CHALAMARCA', N'0604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060501', N'CONTUMAZA', N'0605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060502', N'CHILETE', N'0605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060503', N'CUPISNIQUE', N'0605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060504', N'GUZMANGO', N'0605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060505', N'SAN BENITO', N'0605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060506', N'SANTA CRUZ DE TOLED', N'0605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060507', N'TANTARICA', N'0605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060508', N'YONAN', N'0605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060601', N'CUTERVO', N'0606')
GO
print 'Processed 600 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060602', N'CALLAYUC', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060603', N'CHOROS', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060604', N'CUJILLO', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060605', N'LA RAMADA', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060606', N'PIMPINGOS', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060607', N'QUEROCOTILLO', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060608', N'SAN ANDRES DE CUTERVO', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060609', N'SAN JUAN DE CUTERVO', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060610', N'SAN LUIS DE LUCMA', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060611', N'SANTA CRUZ', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060612', N'SANTO DOMINGO DE LA CAPILLA', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060613', N'SANTO TOMAS', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060614', N'SOCOTA', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060615', N'TORIBIO CASANOVA', N'0606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060701', N'BAMBAMARCA', N'0607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060702', N'CHUGUR', N'0607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060703', N'HUALGAYOC', N'0607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060801', N'JAEN', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060802', N'BELLAVISTA', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060803', N'CHONTALI', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060804', N'COLASAY', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060805', N'HUABAL', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060806', N'LAS PIRIAS', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060807', N'POMAHUACA', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060808', N'PUCARA', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060809', N'SALLIQUE', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060810', N'SAN FELIPE', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060811', N'SAN JOSE DEL ALTO', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060812', N'SANTA ROSA', N'0608')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060901', N'SAN IGNACIO', N'0609')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060902', N'CHIRINOS', N'0609')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060903', N'HUARANGO', N'0609')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060904', N'LA COIPA', N'0609')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060905', N'NAMBALLE', N'0609')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060906', N'SAN JOSE DE LOURDES', N'0609')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'060907', N'TABACONAS', N'0609')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061001', N'PEDRO GALVEZ', N'0610')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061002', N'CHANCAY', N'0610')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061003', N'EDUARDO VILLANUEVA', N'0610')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061004', N'GREGORIO PITA', N'0610')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061005', N'ICHOCAN', N'0610')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061006', N'JOSE MANUEL QUIROZ', N'0610')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061007', N'JOSE SABOGAL', N'0610')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061101', N'SAN MIGUEL', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061102', N'BOLIVAR', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061103', N'CALQUIS', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061104', N'CATILLUC', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061105', N'EL PRADO', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061106', N'LA FLORIDA', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061107', N'LLAPA', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061108', N'NANCHOC', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061109', N'NIEPOS', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061110', N'SAN GREGORIO', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061111', N'SAN SILVESTRE DE COCHAN', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061112', N'TONGOD', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061113', N'UNION AGUA BLANCA', N'0611')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061201', N'SAN PABLO', N'0612')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061202', N'SAN BERNARDINO', N'0612')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061203', N'SAN LUIS', N'0612')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061204', N'TUMBADEN', N'0612')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061301', N'SANTA CRUZ', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061302', N'ANDABAMBA', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061303', N'CATACHE', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061304', N'CHANCAYBAÑOS', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061305', N'LA ESPERANZA', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061306', N'NINABAMBA', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061307', N'PULAN', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061308', N'SAUCEPAMPA', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061309', N'SEXI', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061310', N'UTICYACU', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'061311', N'YAUYUCAN', N'0613')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'070101', N'CALLAO', N'0701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'070102', N'BELLAVISTA', N'0701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'070103', N'CARMEN DE LA LEGUA REYNOSO', N'0701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'070104', N'LA PERLA', N'0701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'070105', N'LA PUNTA', N'0701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'070106', N'VENTANILLA', N'0701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080101', N'CUSCO', N'0801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080102', N'CCORCA', N'0801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080103', N'POROY', N'0801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080104', N'SAN JERONIMO', N'0801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080105', N'SAN SEBASTIAN', N'0801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080106', N'SANTIAGO', N'0801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080107', N'SAYLLA', N'0801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080108', N'WANCHAQ', N'0801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080201', N'ACOMAYO', N'0802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080202', N'ACOPIA', N'0802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080203', N'ACOS', N'0802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080204', N'MOSOC LLACTA', N'0802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080205', N'POMACANCHI', N'0802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080206', N'RONDOCAN', N'0802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080207', N'SANGARARA', N'0802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080301', N'ANTA', N'0803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080302', N'ANCAHUASI', N'0803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080303', N'CACHIMAYO', N'0803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080304', N'CHINCHAYPUJIO', N'0803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080305', N'HUAROCONDO', N'0803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080306', N'LIMATAMBO', N'0803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080307', N'MOLLEPATA', N'0803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080308', N'PUCYURA', N'0803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080309', N'ZURITE', N'0803')
GO
print 'Processed 700 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080401', N'CALCA', N'0804')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080402', N'COYA', N'0804')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080403', N'LAMAY', N'0804')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080404', N'LARES', N'0804')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080405', N'PISAC', N'0804')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080406', N'SAN SALVADOR', N'0804')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080407', N'TARAY', N'0804')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080408', N'YANATILE', N'0804')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080501', N'YANAOCA', N'0805')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080502', N'CHECCA', N'0805')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080503', N'KUNTURKANKI', N'0805')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080504', N'LANGUI', N'0805')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080505', N'LAYO', N'0805')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080506', N'PAMPAMARCA', N'0805')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080507', N'QUEHUE', N'0805')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080508', N'TUPAC AMARU', N'0805')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080601', N'SICUANI', N'0806')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080602', N'CHECACUPE', N'0806')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080603', N'COMBAPATA', N'0806')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080604', N'MARANGANI', N'0806')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080605', N'PITUMARCA', N'0806')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080606', N'SAN PABLO', N'0806')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080607', N'SAN PEDRO', N'0806')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080608', N'TINTA', N'0806')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080701', N'SANTO TOMAS', N'0807')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080702', N'CAPACMARCA', N'0807')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080703', N'CHAMACA', N'0807')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080704', N'COLQUEMARCA', N'0807')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080705', N'LIVITACA', N'0807')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080706', N'LLUSCO', N'0807')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080707', N'QUIÑOTA', N'0807')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080708', N'VELILLE', N'0807')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080801', N'ESPINAR', N'0808')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080802', N'CONDOROMA', N'0808')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080803', N'COPORAQUE', N'0808')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080804', N'OCORURO', N'0808')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080805', N'PALLPATA', N'0808')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080806', N'PICHIGUA', N'0808')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080807', N'SUYCKUTAMBO 3/', N'0808')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080808', N'ALTO PICHIGUA', N'0808')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080901', N'SANTA ANA', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080902', N'ECHARATE', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080903', N'HUAYOPATA /1', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080904', N'MARANURA', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080905', N'OCOBAMBA  /2', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080906', N'QUELLOUNO', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080907', N'KIMBIRI', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080908', N'SANTA TERESA', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080909', N'VILCABAMBA', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'080910', N'PICHARI', N'0809')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081001', N'PARURO', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081002', N'ACCHA', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081003', N'CCAPI', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081004', N'COLCHA', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081005', N'HUANOQUITE', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081006', N'OMACHA', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081007', N'PACCARITAMBO', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081008', N'PILLPINTO', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081009', N'YAURISQUE', N'0810')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081101', N'PAUCARTAMBO', N'0811')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081102', N'CAICAY', N'0811')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081103', N'CHALLABAMBA', N'0811')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081104', N'COLQUEPATA', N'0811')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081105', N'HUANCARANI', N'0811')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081106', N'KOSÑIPATA', N'0811')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081201', N'URCOS', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081202', N'ANDAHUAYLILLAS', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081203', N'CAMANTI', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081204', N'CCARHUAYO', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081205', N'CCATCA', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081206', N'CUSIPATA', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081207', N'HUARO', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081208', N'LUCRE', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081209', N'MARCAPATA', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081210', N'OCONGATE', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081211', N'OROPESA', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081212', N'QUIQUIJANA', N'0812')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081301', N'URUBAMBA', N'0813')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081302', N'CHINCHERO', N'0813')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081303', N'HUAYLLABAMBA', N'0813')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081304', N'MACHUPICCHU', N'0813')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081305', N'MARAS', N'0813')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081306', N'OLLANTAYTAMBO', N'0813')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'081307', N'YUCAY', N'0813')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090101', N'HUANCAVELICA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090102', N'ACOBAMBILLA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090103', N'ACORIA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090104', N'CONAYCA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090105', N'CUENCA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090106', N'HUACHOCOLPA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090107', N'HUAYLLAHUARA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090108', N'IZCUCHACA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090109', N'LARIA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090110', N'MANTA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090111', N'MARISCAL CACERES', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090112', N'MOYA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090113', N'NUEVO OCCORO', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090114', N'PALCA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090115', N'PILCHACA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090116', N'VILCA', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090117', N'YAULI', N'0901')
GO
print 'Processed 800 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090118', N'ASCENSION', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090119', N'HUANDO', N'0901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090201', N'ACOBAMBA', N'0902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090202', N'ANDABAMBA', N'0902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090203', N'ANTA', N'0902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090204', N'CAJA', N'0902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090205', N'MARCAS', N'0902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090206', N'PAUCARA', N'0902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090207', N'POMACOCHA', N'0902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090208', N'ROSARIO', N'0902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090301', N'LIRCAY', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090302', N'ANCHONGA', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090303', N'CALLANMARCA', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090304', N'CCOCHACCASA', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090305', N'CHINCHO', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090306', N'CONGALLA', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090307', N'HUANCA-HUANCA', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090308', N'HUAYLLAY GRANDE', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090309', N'JULCAMARCA', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090310', N'SAN ANTONIO DE ANTAPARCO', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090311', N'SANTO TOMAS DE PATA', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090312', N'SECCLLA', N'0903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090401', N'CASTROVIRREYNA', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090402', N'ARMA', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090403', N'AURAHUA', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090404', N'CAPILLAS', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090405', N'CHUPAMARCA', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090406', N'COCAS', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090407', N'HUACHOS', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090408', N'HUAMATAMBO', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090409', N'MOLLEPAMPA', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090410', N'SAN JUAN', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090411', N'SANTA ANA', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090412', N'TANTARA', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090413', N'TICRAPO', N'0904')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090501', N'CHURCAMPA', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090502', N'ANCO', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090503', N'CHINCHIHUASI', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090504', N'EL CARMEN', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090505', N'LA MERCED', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090506', N'LOCROJA', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090507', N'PAUCARBAMBA', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090508', N'SAN MIGUEL DE MAYOCC', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090509', N'SAN PEDRO DE CORIS', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090510', N'PACHAMARCA ', N'0905')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090601', N'HUAYTARA', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090602', N'AYAVI', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090603', N'CORDOVA', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090604', N'HUAYACUNDO ARMA', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090605', N'LARAMARCA', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090606', N'OCOYO', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090607', N'PILPICHACA', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090608', N'QUERCO', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090609', N'QUITO-ARMA', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090610', N'SAN ANTONIO DE CUSICANCHA', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090611', N'SAN FRANCISCO DE SANGAYAICO', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090612', N'SAN ISIDRO', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090613', N'SANTIAGO DE CHOCORVOS', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090614', N'SANTIAGO DE QUIRAHUARA', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090615', N'SANTO DOMINGO DE CAPILLAS', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090616', N'TAMBO', N'0906')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090701', N'PAMPAS', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090702', N'ACOSTAMBO', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090703', N'ACRAQUIA', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090704', N'AHUAYCHA', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090705', N'COLCABAMBA', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090706', N'DANIEL HERNANDEZ', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090707', N'HUACHOCOLPA', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090709', N'HUARIBAMBA', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090710', N'ÑAHUIMPUQUIO', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090711', N'PAZOS', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090713', N'QUISHUAR', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090714', N'SALCABAMBA', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090715', N'SALCAHUASI', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090716', N'SAN MARCOS DE ROCCHAC', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090717', N'SURCUBAMBA', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'090718', N'TINTAY PUNCU', N'0907')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100101', N'HUANUCO', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100102', N'AMARILIS', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100103', N'CHINCHAO', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100104', N'CHURUBAMBA', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100105', N'MARGOS', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100106', N'QUISQUI', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100107', N'SAN FRANCISCO DE CAYRAN', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100108', N'SAN PEDRO DE CHAULAN', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100109', N'SANTA MARIA DEL VALLE', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100110', N'YARUMAYO', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100111', N'PILLCO MARCA', N'1001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100201', N'AMBO', N'1002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100202', N'CAYNA', N'1002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100203', N'COLPAS', N'1002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100204', N'CONCHAMARCA', N'1002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100205', N'HUACAR', N'1002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100206', N'SAN FRANCISCO', N'1002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100207', N'SAN RAFAEL', N'1002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100208', N'TOMAY KICHWA', N'1002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100301', N'LA UNION', N'1003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100307', N'CHUQUIS', N'1003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100311', N'MARIAS', N'1003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100313', N'PACHAS', N'1003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100316', N'QUIVILLA', N'1003')
GO
print 'Processed 900 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100317', N'RIPAN', N'1003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100321', N'SHUNQUI', N'1003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100322', N'SILLAPATA', N'1003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100323', N'YANAS', N'1003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100401', N'HUACAYBAMBA', N'1004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100402', N'CANCHABAMBA', N'1004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100403', N'COCHABAMBA', N'1004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100404', N'PINRA', N'1004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100501', N'LLATA', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100502', N'ARANCAY', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100503', N'CHAVIN DE PARIARCA', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100504', N'JACAS GRANDE', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100505', N'JIRCAN', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100506', N'MIRAFLORES', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100507', N'MONZON', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100508', N'PUNCHAO', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100509', N'PUÑOS', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100510', N'SINGA', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100511', N'TANTAMAYO', N'1005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100601', N'RUPA-RUPA', N'1006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100602', N'DANIEL ALOMIA ROBLES', N'1006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100603', N'HERMILIO VALDIZAN', N'1006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100604', N'JOSE CRESPO Y CASTILLO', N'1006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100605', N'LUYANDO 1/', N'1006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100606', N'MARIANO DAMASO BERAUN', N'1006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100701', N'HUACRACHUCO', N'1007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100702', N'CHOLON', N'1007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100703', N'SAN BUENAVENTURA', N'1007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100801', N'PANAO', N'1008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100802', N'CHAGLLA', N'1008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100803', N'MOLINO', N'1008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100804', N'UMARI  ', N'1008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100901', N'PUERTO INCA', N'1009')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100902', N'CODO DEL POZUZO', N'1009')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100903', N'HONORIA', N'1009')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100904', N'TOURNAVISTA', N'1009')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'100905', N'YUYAPICHIS', N'1009')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101001', N'JESUS', N'1010')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101002', N'BAÑOS', N'1010')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101003', N'JIVIA', N'1010')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101004', N'QUEROPALCA', N'1010')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101005', N'RONDOS', N'1010')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101006', N'SAN FRANCISCO DE ASIS', N'1010')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101007', N'SAN MIGUEL DE CAURI', N'1010')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101101', N'CHAVINILLO', N'1011')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101102', N'CAHUAC', N'1011')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101103', N'CHACABAMBA', N'1011')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101104', N'APARICIO POMARES', N'1011')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101105', N'JACAS CHICO', N'1011')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101106', N'OBAS', N'1011')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101107', N'PAMPAMARCA', N'1011')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'101108', N'CHORAS', N'1011')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110101', N'ICA', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110102', N'LA TINGUIÑA', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110103', N'LOS AQUIJES', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110104', N'OCUCAJE', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110105', N'PACHACUTEC', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110106', N'PARCONA', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110107', N'PUEBLO NUEVO', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110108', N'SALAS', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110109', N'SAN JOSE DE LOS MOLINOS', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110110', N'SAN JUAN BAUTISTA', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110111', N'SANTIAGO', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110112', N'SUBTANJALLA', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110113', N'TATE', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110114', N'YAUCA DEL ROSARIO  1/', N'1101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110201', N'CHINCHA ALTA', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110202', N'ALTO LARAN', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110203', N'CHAVIN', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110204', N'CHINCHA BAJA', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110205', N'EL CARMEN', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110206', N'GROCIO PRADO', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110207', N'PUEBLO NUEVO', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110208', N'SAN JUAN DE YANAC', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110209', N'SAN PEDRO DE HUACARPANA', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110210', N'SUNAMPE', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110211', N'TAMBO DE MORA', N'1102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110301', N'NAZCA', N'1103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110302', N'CHANGUILLO', N'1103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110303', N'EL INGENIO', N'1103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110304', N'MARCONA', N'1103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110305', N'VISTA ALEGRE', N'1103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110401', N'PALPA', N'1104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110402', N'LLIPATA', N'1104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110403', N'RIO GRANDE', N'1104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110404', N'SANTA CRUZ', N'1104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110405', N'TIBILLO', N'1104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110501', N'PISCO', N'1105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110502', N'HUANCANO', N'1105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110503', N'HUMAY', N'1105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110504', N'INDEPENDENCIA', N'1105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110505', N'PARACAS', N'1105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110506', N'SAN ANDRES', N'1105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110507', N'SAN CLEMENTE', N'1105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'110508', N'TUPAC AMARU INCA', N'1105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120101', N'HUANCAYO', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120104', N'CARHUACALLANGA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120105', N'CHACAPAMPA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120106', N'CHICCHE', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120107', N'CHILCA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120108', N'CHONGOS ALTO', N'1201')
GO
print 'Processed 1000 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120111', N'CHUPURO', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120112', N'COLCA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120113', N'CULLHUAS', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120114', N'EL TAMBO', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120116', N'HUACRAPUQUIO', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120117', N'HUALHUAS', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120119', N'HUANCAN', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120120', N'HUASICANCHA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120121', N'HUAYUCACHI', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120122', N'INGENIO', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120124', N'PARIAHUANCA   1/', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120125', N'PILCOMAYO', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120126', N'PUCARA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120127', N'QUICHUAY', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120128', N'QUILCAS', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120129', N'SAN AGUSTIN', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120130', N'SAN JERONIMO DE TUNAN', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120132', N'SAÑO', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120133', N'SAPALLANGA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120134', N'SICAYA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120135', N'SANTO DOMINGO DE ACOBAMBA', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120136', N'VIQUES', N'1201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120201', N'CONCEPCION', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120202', N'ACO', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120203', N'ANDAMARCA', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120204', N'CHAMBARA', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120205', N'COCHAS', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120206', N'COMAS', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120207', N'HEROINAS TOLEDO', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120208', N'MANZANARES', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120209', N'MARISCAL CASTILLA', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120210', N'MATAHUASI', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120211', N'MITO', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120212', N'NUEVE DE JULIO', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120213', N'ORCOTUNA', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120214', N'SAN JOSE DE QUERO', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120215', N'SANTA ROSA DE OCOPA', N'1202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120301', N'CHANCHAMAYO', N'1203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120302', N'PERENE', N'1203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120303', N'PICHANAQUI', N'1203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120304', N'SAN LUIS DE SHUARO', N'1203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120305', N'SAN RAMON', N'1203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120306', N'VITOC', N'1203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120401', N'JAUJA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120402', N'ACOLLA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120403', N'APATA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120404', N'ATAURA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120405', N'CANCHAYLLO', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120406', N'CURICACA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120407', N'EL MANTARO', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120408', N'HUAMALI', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120409', N'HUARIPAMPA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120410', N'HUERTAS', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120411', N'JANJAILLO', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120412', N'JULCAN', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120413', N'LEONOR ORDOÑEZ', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120414', N'LLOCLLAPAMPA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120415', N'MARCO', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120416', N'MASMA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120417', N'MASMA CHICCHE', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120418', N'MOLINOS', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120419', N'MONOBAMBA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120420', N'MUQUI', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120421', N'MUQUIYAUYO', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120422', N'PACA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120423', N'PACCHA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120424', N'PANCAN', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120425', N'PARCO', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120426', N'POMACANCHA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120427', N'RICRAN', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120428', N'SAN LORENZO', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120429', N'SAN PEDRO DE CHUNAN', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120430', N'SAUSA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120431', N'SINCOS', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120432', N'TUNAN MARCA', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120433', N'YAULI', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120434', N'YAUYOS', N'1204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120501', N'JUNIN', N'1205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120502', N'CARHUAMAYO', N'1205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120503', N'ONDORES', N'1205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120504', N'ULCUMAYO', N'1205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120601', N'SATIPO', N'1206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120602', N'COVIRIALI', N'1206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120603', N'LLAYLLA', N'1206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120604', N'MAZAMARI', N'1206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120605', N'PAMPA HERMOSA', N'1206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120606', N'PANGOA', N'1206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120607', N'RIO NEGRO', N'1206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120608', N'RIO TAMBO', N'1206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120701', N'TARMA', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120702', N'ACOBAMBA', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120703', N'HUARICOLCA', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120704', N'HUASAHUASI', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120705', N'LA UNION', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120706', N'PALCA', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120707', N'PALCAMAYO', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120708', N'SAN PEDRO DE CAJAS', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120709', N'TAPO', N'1207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120801', N'LA OROYA', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120802', N'CHACAPALPA', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120803', N'HUAY-HUAY', N'1208')
GO
print 'Processed 1100 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120804', N'MARCAPOMACOCHA', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120805', N'MOROCOCHA', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120806', N'PACCHA', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120807', N'SANTA BARBARA DE CARHUACAYAN', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120808', N'SANTA ROSA DE SACCO', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120809', N'SUITUCANCHA', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120810', N'YAULI', N'1208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120901', N'CHUPACA', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120902', N'AHUAC', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120903', N'CHONGOS BAJO', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120904', N'HUACHAC', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120905', N'HUAMANCACA CHICO', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120906', N'SAN JUAN DE ISCOS', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120907', N'SAN JUAN DE JARPA', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120908', N'TRES DE DICIEMBRE', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'120909', N'YANACANCHA', N'1209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130101', N'TRUJILLO', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130102', N'EL PORVENIR', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130103', N'FLORENCIA DE MORA', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130104', N'HUANCHACO', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130105', N'LA ESPERANZA', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130106', N'LAREDO', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130107', N'MOCHE', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130108', N'POROTO', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130109', N'SALAVERRY', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130110', N'SIMBAL', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130111', N'VICTOR LARCO HERRERA', N'1301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130201', N'ASCOPE', N'1302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130202', N'CHICAMA', N'1302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130203', N'CHOCOPE', N'1302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130204', N'MAGDALENA DE CAO', N'1302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130205', N'PAIJAN', N'1302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130206', N'RAZURI', N'1302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130207', N'SANTIAGO DE CAO', N'1302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130208', N'CASA GRANDE', N'1302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130301', N'BOLIVAR', N'1303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130302', N'BAMBAMARCA', N'1303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130303', N'CONDORMARCA /1', N'1303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130304', N'LONGOTEA', N'1303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130305', N'UCHUMARCA', N'1303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130306', N'UCUNCHA', N'1303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130401', N'CHEPEN', N'1304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130402', N'PACANGA', N'1304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130403', N'PUEBLO NUEVO', N'1304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130501', N'JULCAN', N'1305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130502', N'CALAMARCA', N'1305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130503', N'CARABAMBA', N'1305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130504', N'HUASO', N'1305')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130601', N'OTUZCO', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130602', N'AGALLPAMPA', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130604', N'CHARAT', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130605', N'HUARANCHAL', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130606', N'LA CUESTA', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130608', N'MACHE', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130610', N'PARANDAY', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130611', N'SALPO', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130613', N'SINSICAP', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130614', N'USQUIL', N'1306')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130701', N'SAN PEDRO DE LLOC', N'1307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130702', N'GUADALUPE', N'1307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130703', N'JEQUETEPEQUE', N'1307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130704', N'PACASMAYO', N'1307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130705', N'SAN JOSE', N'1307')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130801', N'TAYABAMBA', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130802', N'BULDIBUYO', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130803', N'CHILLIA', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130804', N'HUANCASPATA', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130805', N'HUAYLILLAS', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130806', N'HUAYO', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130807', N'ONGON', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130808', N'PARCOY', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130809', N'PATAZ', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130810', N'PIAS', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130811', N'SANTIAGO DE CHALLAS', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130812', N'TAURIJA', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130813', N'URPAY', N'1308')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130901', N'HUAMACHUCO', N'1309')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130902', N'CHUGAY', N'1309')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130903', N'COCHORCO', N'1309')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130904', N'CURGOS', N'1309')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130905', N'MARCABAL', N'1309')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130906', N'SANAGORAN', N'1309')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130907', N'SARIN', N'1309')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'130908', N'SARTIMBAMBA', N'1309')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131001', N'SANTIAGO DE CHUCO', N'1310')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131002', N'ANGASMARCA', N'1310')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131003', N'CACHICADAN', N'1310')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131004', N'MOLLEBAMBA', N'1310')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131005', N'MOLLEPATA', N'1310')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131006', N'QUIRUVILCA', N'1310')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131007', N'SANTA CRUZ DE CHUCA', N'1310')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131008', N'SITABAMBA', N'1310')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131101', N'CASCAS', N'1311')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131102', N'LUCMA', N'1311')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131103', N'COMPIN', N'1311')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131104', N'SAYAPULLO', N'1311')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131201', N'VIRU', N'1312')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131202', N'CHAO', N'1312')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'131203', N'GUADALUPITO', N'1312')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140101', N'CHICLAYO', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140102', N'CHONGOYAPE', N'1401')
GO
print 'Processed 1200 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140103', N'ETEN', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140104', N'ETEN PUERTO', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140105', N'JOSE LEONARDO ORTIZ', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140106', N'LA VICTORIA', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140107', N'LAGUNAS   ', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140108', N'MONSEFU', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140109', N'NUEVA ARICA', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140110', N'OYOTUN', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140111', N'PICSI', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140112', N'PIMENTEL', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140113', N'REQUE', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140114', N'SANTA ROSA', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140115', N'SAÑA', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140116', N'CAYALTI', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140117', N'PATAPO', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140118', N'POMALCA', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140119', N'PUCALA', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140120', N'TUMAN', N'1401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140201', N'FERREÑAFE', N'1402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140202', N'CAÑARIS', N'1402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140203', N'INCAHUASI', N'1402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140204', N'MANUEL ANTONIO MESONES MURO', N'1402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140205', N'PITIPO', N'1402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140206', N'PUEBLO NUEVO', N'1402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140301', N'LAMBAYEQUE', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140302', N'CHOCHOPE', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140303', N'ILLIMO', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140304', N'JAYANCA', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140305', N'MOCHUMI', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140306', N'MORROPE', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140307', N'MOTUPE', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140308', N'OLMOS', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140309', N'PACORA', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140310', N'SALAS', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140311', N'SAN JOSE', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'140312', N'TUCUME', N'1403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150101', N'LIMA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150102', N'ANCON', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150103', N'ATE', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150104', N'BARRANCO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150105', N'BREÑA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150106', N'CARABAYLLO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150107', N'CHACLACAYO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150108', N'CHORRILLOS', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150109', N'CIENEGUILLA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150110', N'COMAS', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150111', N'EL AGUSTINO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150112', N'INDEPENDENCIA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150113', N'JESUS MARIA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150114', N'LA MOLINA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150115', N'LA VICTORIA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150116', N'LINCE', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150117', N'LOS OLIVOS', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150118', N'LURIGANCHO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150119', N'LURIN', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150120', N'MAGDALENA DEL MAR', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150121', N'PUEBLO LIBRE', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150122', N'MIRAFLORES', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150123', N'PACHACAMAC', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150124', N'PUCUSANA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150125', N'PUENTE PIEDRA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150126', N'PUNTA HERMOSA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150127', N'PUNTA NEGRA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150128', N'RIMAC', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150129', N'SAN BARTOLO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150130', N'SAN BORJA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150131', N'SAN ISIDRO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150132', N'SAN JUAN DE LURIGANCHO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150133', N'SAN JUAN DE MIRAFLORES', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150134', N'SAN LUIS', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150135', N'SAN MARTIN DE PORRES', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150136', N'SAN MIGUEL', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150137', N'SANTA ANITA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150138', N'SANTA MARIA DEL MAR', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150139', N'SANTA ROSA', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150140', N'SANTIAGO DE SURCO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150141', N'SURQUILLO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150142', N'VILLA EL SALVADOR', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150143', N'VILLA MARIA DEL TRIUNFO', N'1501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150201', N'BARRANCA', N'1502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150202', N'PARAMONGA', N'1502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150203', N'PATIVILCA', N'1502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150204', N'SUPE', N'1502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150205', N'SUPE PUERTO', N'1502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150301', N'CAJATAMBO', N'1503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150302', N'COPA', N'1503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150303', N'GORGOR', N'1503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150304', N'HUANCAPON', N'1503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150305', N'MANAS', N'1503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150401', N'CANTA', N'1504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150402', N'ARAHUAY', N'1504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150403', N'HUAMANTANGA', N'1504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150404', N'HUAROS', N'1504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150405', N'LACHAQUI', N'1504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150406', N'SAN BUENAVENTURA', N'1504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150407', N'SANTA ROSA DE QUIVES', N'1504')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150501', N'SAN VICENTE DE CAÑETE', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150502', N'ASIA', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150503', N'CALANGO', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150504', N'CERRO AZUL', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150505', N'CHILCA', N'1505')
GO
print 'Processed 1300 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150506', N'COAYLLO', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150507', N'IMPERIAL', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150508', N'LUNAHUANA', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150509', N'MALA', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150510', N'NUEVO IMPERIAL', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150511', N'PACARAN', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150512', N'QUILMANA', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150513', N'SAN ANTONIO', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150514', N'SAN LUIS', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150515', N'SANTA CRUZ DE FLORES', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150516', N'ZUÑIGA', N'1505')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150601', N'HUARAL', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150602', N'ATAVILLOS ALTO', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150603', N'ATAVILLOS BAJO', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150604', N'AUCALLAMA', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150605', N'CHANCAY', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150606', N'IHUARI', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150607', N'LAMPIAN', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150608', N'PACARAOS', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150609', N'SAN MIGUEL DE ACOS', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150610', N'SANTA CRUZ DE ANDAMARCA', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150611', N'SUMBILCA', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150612', N'VEINTISIETE DE NOVIEMBRE', N'1506')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150701', N'MATUCANA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150702', N'ANTIOQUIA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150703', N'CALLAHUANCA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150704', N'CARAMPOMA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150705', N'CHICLA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150706', N'CUENCA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150707', N'HUACHUPAMPA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150708', N'HUANZA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150709', N'HUAROCHIRI', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150710', N'LAHUAYTAMBO', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150711', N'LANGA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150712', N'LARAOS', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150713', N'MARIATANA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150714', N'RICARDO PALMA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150715', N'SAN ANDRES DE TUPICOCHA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150716', N'SAN ANTONIO', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150717', N'SAN BARTOLOME', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150718', N'SAN DAMIAN', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150719', N'SAN JUAN DE IRIS', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150720', N'SAN JUAN DE TANTARANCHE', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150721', N'SAN LORENZO DE QUINTI', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150722', N'SAN MATEO', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150723', N'SAN MATEO DE OTAO', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150724', N'SAN PEDRO DE CASTA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150725', N'SAN PEDRO DE HUANCAYRE', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150726', N'SANGALLAYA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150727', N'SANTA CRUZ DE COCACHACRA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150728', N'SANTA EULALIA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150729', N'SANTIAGO DE ANCHUCAYA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150730', N'SANTIAGO DE TUNA', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150731', N'SANTO DOMINGO DE LOS OLLEROS', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150732', N'SURCO', N'1507')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150801', N'HUACHO', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150802', N'AMBAR', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150803', N'CALETA DE CARQUIN', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150804', N'CHECRAS', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150805', N'HUALMAY', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150806', N'HUAURA', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150807', N'LEONCIO PRADO', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150808', N'PACCHO', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150809', N'SANTA LEONOR', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150810', N'SANTA MARIA', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150811', N'SAYAN', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150812', N'VEGUETA', N'1508')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150901', N'OYON', N'1509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150902', N'ANDAJES', N'1509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150903', N'CAUJUL', N'1509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150904', N'COCHAMARCA', N'1509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150905', N'NAVAN', N'1509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'150906', N'PACHANGARA', N'1509')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151001', N'YAUYOS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151002', N'ALIS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151003', N'ALLAUCA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151004', N'AYAVIRI', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151005', N'AZANGARO', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151006', N'CACRA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151007', N'CARANIA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151008', N'CATAHUASI', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151009', N'CHOCOS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151010', N'COCHAS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151011', N'COLONIA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151012', N'HONGOS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151013', N'HUAMPARA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151014', N'HUANCAYA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151015', N'HUANGASCAR', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151016', N'HUANTAN', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151017', N'HUAÑEC', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151018', N'LARAOS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151019', N'LINCHA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151020', N'MADEAN', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151021', N'MIRAFLORES', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151022', N'OMAS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151023', N'PUTINZA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151024', N'QUINCHES', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151025', N'QUINOCAY', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151026', N'SAN JOAQUIN', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151027', N'SAN PEDRO DE PILAS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151028', N'TANTA', N'1510')
GO
print 'Processed 1400 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151029', N'TAURIPAMPA', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151030', N'TOMAS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151031', N'TUPE', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151032', N'VIÑAC', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'151033', N'VITIS', N'1510')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160101', N'IQUITOS', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160102', N'ALTO NANAY', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160103', N'FERNANDO LORES', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160104', N'INDIANA', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160105', N'LAS AMAZONAS', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160106', N'MAZAN', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160107', N'NAPO', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160108', N'PUNCHANA', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160109', N'PUTUMAYO    ', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160110', N'TORRES CAUSANA', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160112', N'BELEN', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160113', N'SAN JUAN BAUTISTA', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160114', N'TENIENTE MANUEL CLAVERO', N'1601')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160201', N'YURIMAGUAS', N'1602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160202', N'BALSAPUERTO', N'1602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160205', N'JEBEROS', N'1602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160206', N'LAGUNAS', N'1602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160210', N'SANTA CRUZ', N'1602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160211', N'TENIENTE CESAR LOPEZ ROJAS', N'1602')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160301', N'NAUTA', N'1603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160302', N'PARINARI ', N'1603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160303', N'TIGRE', N'1603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160304', N'TROMPETEROS', N'1603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160305', N'URARINAS', N'1603')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160401', N'RAMON CASTILLA', N'1604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160402', N'PEBAS', N'1604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160403', N'YAVARI  /1', N'1604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160404', N'SAN PABLO', N'1604')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160501', N'REQUENA', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160502', N'ALTO TAPICHE', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160503', N'CAPELO', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160504', N'EMILIO SAN MARTIN', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160505', N'MAQUIA', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160506', N'PUINAHUA', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160507', N'SAQUENA', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160508', N'SOPLIN', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160509', N'TAPICHE', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160510', N'JENARO HERRERA', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160511', N'YAQUERANA    ', N'1605')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160601', N'CONTAMANA', N'1606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160602', N'INAHUAYA', N'1606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160603', N'PADRE MARQUEZ', N'1606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160604', N'PAMPA HERMOSA', N'1606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160605', N'SARAYACU', N'1606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160606', N'VARGAS GUERRA', N'1606')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160701', N'BARRANCA', N'1607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160702', N'CAHUAPANAS', N'1607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160703', N'MANSERICHE', N'1607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160704', N'MORONA', N'1607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160705', N'PASTAZA', N'1607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'160706', N'ANDOAS', N'1607')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170101', N'TAMBOPATA', N'1701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170102', N'INAMBARI ', N'1701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170103', N'LAS PIEDRAS', N'1701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170104', N'LABERINTO', N'1701')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170201', N'MANU    ', N'1702')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170202', N'FITZCARRALD    ', N'1702')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170203', N'MADRE DE DIOS    ', N'1702')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170204', N'HUEPETUHE', N'1702')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170301', N'IÑAPARI', N'1703')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170302', N'IBERIA', N'1703')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'170303', N'TAHUAMANU', N'1703')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180101', N'MOQUEGUA', N'1801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180102', N'CARUMAS', N'1801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180103', N'CUCHUMBAYA', N'1801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180104', N'SAMEGUA', N'1801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180105', N'SAN CRISTOBAL', N'1801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180106', N'TORATA', N'1801')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180201', N'OMATE', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180202', N'CHOJATA', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180203', N'COALAQUE', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180204', N'ICHUÑA', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180205', N'LA CAPILLA', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180206', N'LLOQUE', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180207', N'MATALAQUE', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180208', N'PUQUINA', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180209', N'QUINISTAQUILLAS', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180210', N'UBINAS', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180211', N'YUNGA', N'1802')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180301', N'ILO', N'1803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180302', N'EL ALGARROBAL', N'1803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'180303', N'PACOCHA', N'1803')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190101', N'CHAUPIMARCA', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190102', N'HUACHON', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190103', N'HUARIACA', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190104', N'HUAYLLAY', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190105', N'NINACACA', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190106', N'PALLANCHACRA', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190107', N'PAUCARTAMBO', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190108', N'SAN FRANCISCO DE ASIS DE YARUSYACAN', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190109', N'SIMON BOLIVAR', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190110', N'TICLACAYAN', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190111', N'TINYAHUARCO', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190112', N'VICCO', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190113', N'YANACANCHA', N'1901')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190201', N'YANAHUANCA', N'1902')
GO
print 'Processed 1500 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190202', N'CHACAYAN', N'1902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190203', N'GOYLLARISQUIZGA', N'1902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190204', N'PAUCAR', N'1902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190205', N'SAN PEDRO DE PILLAO', N'1902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190206', N'SANTA ANA DE TUSI', N'1902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190207', N'TAPUC', N'1902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190208', N'VILCABAMBA', N'1902')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190301', N'OXAPAMPA', N'1903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190302', N'CHONTABAMBA', N'1903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190303', N'HUANCABAMBA', N'1903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190304', N'PALCAZU', N'1903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190305', N'POZUZO', N'1903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190306', N'PUERTO BERMUDEZ', N'1903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'190307', N'VILLA RICA', N'1903')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200101', N'PIURA', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200104', N'CASTILLA', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200105', N'CATACAOS', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200107', N'CURA MORI', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200108', N'EL TALLAN', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200109', N'LA ARENA', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200110', N'LA UNION', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200111', N'LAS LOMAS', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200114', N'TAMBO GRANDE', N'2001')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200201', N'AYABACA', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200202', N'FRIAS', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200203', N'JILILI', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200204', N'LAGUNAS', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200205', N'MONTERO', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200206', N'PACAIPAMPA', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200207', N'PAIMAS', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200208', N'SAPILLICA', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200209', N'SICCHEZ', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200210', N'SUYO', N'2002')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200301', N'HUANCABAMBA', N'2003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200302', N'CANCHAQUE', N'2003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200303', N'EL CARMEN DE LA FRONTERA', N'2003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200304', N'HUARMACA', N'2003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200305', N'LALAQUIZ', N'2003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200306', N'SAN MIGUEL DE EL FAIQUE', N'2003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200307', N'SONDOR', N'2003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200308', N'SONDORILLO', N'2003')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200401', N'CHULUCANAS', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200402', N'BUENOS AIRES', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200403', N'CHALACO', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200404', N'LA MATANZA', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200405', N'MORROPON', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200406', N'SALITRAL', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200407', N'SAN JUAN DE BIGOTE', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200408', N'SANTA CATALINA DE MOSSA', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200409', N'SANTO DOMINGO', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200410', N'YAMANGO', N'2004')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200501', N'PAITA', N'2005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200502', N'AMOTAPE', N'2005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200503', N'ARENAL', N'2005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200504', N'COLAN', N'2005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200505', N'LA HUACA', N'2005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200506', N'TAMARINDO', N'2005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200507', N'VICHAYAL', N'2005')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200601', N'SULLANA', N'2006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200602', N'BELLAVISTA', N'2006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200603', N'IGNACIO ESCUDERO', N'2006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200604', N'LANCONES', N'2006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200605', N'MARCAVELICA', N'2006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200606', N'MIGUEL CHECA', N'2006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200607', N'QUERECOTILLO', N'2006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200608', N'SALITRAL', N'2006')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200701', N'PARIÑAS', N'2007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200702', N'EL ALTO', N'2007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200703', N'LA BREA', N'2007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200704', N'LOBITOS', N'2007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200705', N'LOS ORGANOS', N'2007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200706', N'MANCORA', N'2007')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200801', N'SECHURA', N'2008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200802', N'BELLAVISTA DE LA UNION', N'2008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200803', N'BERNAL', N'2008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200804', N'CRISTO NOS VALGA', N'2008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200805', N'VICE', N'2008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'200806', N'RINCONADA LLICUAR', N'2008')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210101', N'PUNO', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210102', N'ACORA', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210103', N'AMANTANI', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210104', N'ATUNCOLLA', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210105', N'CAPACHICA', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210106', N'CHUCUITO', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210107', N'COATA', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210108', N'HUATA', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210109', N'MAÑAZO', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210110', N'PAUCARCOLLA', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210111', N'PICHACANI', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210112', N'PLATERIA', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210113', N'SAN ANTONIO  /1', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210114', N'TIQUILLACA', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210115', N'VILQUE', N'2101')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210201', N'AZANGARO', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210202', N'ACHAYA', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210203', N'ARAPA', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210204', N'ASILLO', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210205', N'CAMINACA', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210206', N'CHUPA', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210207', N'JOSE DOMINGO CHOQUEHUANCA', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210208', N'MUÑANI', N'2102')
GO
print 'Processed 1600 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210209', N'POTONI', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210210', N'SAMAN', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210211', N'SAN ANTON', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210212', N'SAN JOSE', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210213', N'SAN JUAN DE SALINAS', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210214', N'SANTIAGO DE PUPUJA', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210215', N'TIRAPATA', N'2102')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210301', N'MACUSANI', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210302', N'AJOYANI', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210303', N'AYAPATA', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210304', N'COASA', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210305', N'CORANI', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210306', N'CRUCERO', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210307', N'ITUATA   2/', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210308', N'OLLACHEA', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210309', N'SAN GABAN', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210310', N'USICAYOS', N'2103')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210401', N'JULI', N'2104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210402', N'DESAGUADERO', N'2104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210403', N'HUACULLANI', N'2104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210404', N'KELLUYO', N'2104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210405', N'PISACOMA', N'2104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210406', N'POMATA', N'2104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210407', N'ZEPITA', N'2104')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210501', N'ILAVE', N'2105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210502', N'CAPAZO', N'2105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210503', N'PILCUYO', N'2105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210504', N'SANTA ROSA', N'2105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210505', N'CONDURIRI', N'2105')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210601', N'HUANCANE', N'2106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210602', N'COJATA', N'2106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210603', N'HUATASANI', N'2106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210604', N'INCHUPALLA', N'2106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210605', N'PUSI', N'2106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210606', N'ROSASPATA', N'2106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210607', N'TARACO', N'2106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210608', N'VILQUE CHICO', N'2106')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210701', N'LAMPA', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210702', N'CABANILLA', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210703', N'CALAPUJA', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210704', N'NICASIO', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210705', N'OCUVIRI', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210706', N'PALCA', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210707', N'PARATIA', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210708', N'PUCARA', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210709', N'SANTA LUCIA', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210710', N'VILAVILA', N'2107')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210801', N'AYAVIRI', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210802', N'ANTAUTA', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210803', N'CUPI', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210804', N'LLALLI', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210805', N'MACARI', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210806', N'NUÑOA', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210807', N'ORURILLO', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210808', N'SANTA ROSA', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210809', N'UMACHIRI', N'2108')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210901', N'MOHO', N'2109')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210902', N'CONIMA', N'2109')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210903', N'HUAYRAPATA', N'2109')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'210904', N'TILALI', N'2109')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211001', N'PUTINA', N'2110')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211002', N'ANANEA', N'2110')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211003', N'PEDRO VILCA APAZA', N'2110')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211004', N'QUILCAPUNCU', N'2110')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211005', N'SINA', N'2110')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211101', N'JULIACA', N'2111')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211102', N'CABANA', N'2111')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211103', N'CABANILLAS', N'2111')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211104', N'CARACOTO', N'2111')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211201', N'SANDIA', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211202', N'CUYOCUYO', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211203', N'LIMBANI', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211204', N'PATAMBUCO', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211205', N'PHARA', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211206', N'QUIACA', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211207', N'SAN JUAN DEL ORO', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211208', N'YANAHUAYA', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211209', N'ALTO INAMBARI', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211210', N'SAN PEDRO DE PUTINA PUNCO', N'2112')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211301', N'YUNGUYO', N'2113')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211302', N'ANAPIA', N'2113')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211303', N'COPANI', N'2113')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211304', N'CUTURAPI', N'2113')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211305', N'OLLARAYA', N'2113')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211306', N'TINICACHI', N'2113')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'211307', N'UNICACHI', N'2113')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220101', N'MOYOBAMBA', N'2201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220102', N'CALZADA', N'2201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220103', N'HABANA', N'2201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220104', N'JEPELACIO', N'2201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220105', N'SORITOR', N'2201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220106', N'YANTALO', N'2201')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220201', N'BELLAVISTA', N'2202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220202', N'ALTO BIAVO', N'2202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220203', N'BAJO BIAVO', N'2202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220204', N'HUALLAGA', N'2202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220205', N'SAN PABLO', N'2202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220206', N'SAN RAFAEL', N'2202')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220301', N'SAN JOSE DE SISA', N'2203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220302', N'AGUA BLANCA', N'2203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220303', N'SAN MARTIN', N'2203')
GO
print 'Processed 1700 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220304', N'SANTA ROSA', N'2203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220305', N'SHATOJA', N'2203')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220401', N'SAPOSOA', N'2204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220402', N'ALTO SAPOSOA', N'2204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220403', N'EL ESLABON', N'2204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220404', N'PISCOYACU', N'2204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220405', N'SACANCHE', N'2204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220406', N'TINGO DE SAPOSOA', N'2204')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220501', N'LAMAS', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220502', N'ALONSO DE ALVARADO', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220503', N'BARRANQUITA', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220504', N'CAYNARACHI   1/', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220505', N'CUÑUMBUQUI', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220506', N'PINTO RECODO', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220507', N'RUMISAPA', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220508', N'SAN ROQUE DE CUMBAZA', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220509', N'SHANAO', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220510', N'TABALOSOS', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220511', N'ZAPATERO', N'2205')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220601', N'JUANJUI', N'2206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220602', N'CAMPANILLA', N'2206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220603', N'HUICUNGO', N'2206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220604', N'PACHIZA', N'2206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220605', N'PAJARILLO', N'2206')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220701', N'PICOTA', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220702', N'BUENOS AIRES', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220703', N'CASPISAPA', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220704', N'PILLUANA', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220705', N'PUCACACA', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220706', N'SAN CRISTOBAL', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220707', N'SAN HILARION', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220708', N'SHAMBOYACU', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220709', N'TINGO DE PONASA', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220710', N'TRES UNIDOS', N'2207')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220801', N'RIOJA', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220802', N'AWAJUN', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220803', N'ELIAS SOPLIN VARGAS', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220804', N'NUEVA CAJAMARCA', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220805', N'PARDO MIGUEL', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220806', N'POSIC', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220807', N'SAN FERNANDO', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220808', N'YORONGOS', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220809', N'YURACYACU', N'2208')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220901', N'TARAPOTO', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220902', N'ALBERTO LEVEAU', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220903', N'CACATACHI', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220904', N'CHAZUTA', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220905', N'CHIPURANA', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220906', N'EL PORVENIR', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220907', N'HUIMBAYOC', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220908', N'JUAN GUERRA', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220909', N'LA BANDA DE SHILCAYO', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220910', N'MORALES', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220911', N'PAPAPLAYA', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220912', N'SAN ANTONIO', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220913', N'SAUCE', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'220914', N'SHAPAJA', N'2209')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'221001', N'TOCACHE', N'2210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'221002', N'NUEVO PROGRESO', N'2210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'221003', N'POLVORA', N'2210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'221004', N'SHUNTE  2/ ', N'2210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'221005', N'UCHIZA', N'2210')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230101', N'TACNA', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230102', N'ALTO DE LA ALIANZA', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230103', N'CALANA', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230104', N'CIUDAD NUEVA', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230105', N'INCLAN', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230106', N'PACHIA', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230107', N'PALCA', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230108', N'POCOLLAY', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230109', N'SAMA', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230110', N'CORONEL GREGORIO ALBARRACIN LANCHIPA', N'2301')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230201', N'CANDARAVE', N'2302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230202', N'CAIRANI', N'2302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230203', N'CAMILACA', N'2302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230204', N'CURIBAYA', N'2302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230205', N'HUANUARA', N'2302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230206', N'QUILAHUANI', N'2302')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230301', N'LOCUMBA', N'2303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230302', N'ILABAYA', N'2303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230303', N'ITE', N'2303')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230401', N'TARATA', N'2304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230402', N'HEROES ALBARRACIN', N'2304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230403', N'ESTIQUE', N'2304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230404', N'ESTIQUE-PAMPA', N'2304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230405', N'SITAJARA', N'2304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230406', N'SUSAPAYA', N'2304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230407', N'TARUCACHI', N'2304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'230408', N'TICACO', N'2304')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240101', N'TUMBES', N'2401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240102', N'CORRALES', N'2401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240103', N'LA CRUZ', N'2401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240104', N'PAMPAS DE HOSPITAL', N'2401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240105', N'SAN JACINTO', N'2401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240106', N'SAN JUAN DE LA VIRGEN', N'2401')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240201', N'ZORRITOS', N'2402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240202', N'CASITAS', N'2402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240203', N'CANOAS DE PUNTA SAL', N'2402')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240301', N'ZARUMILLA', N'2403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240302', N'AGUAS VERDES', N'2403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240303', N'MATAPALO', N'2403')
GO
print 'Processed 1800 total records'
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'240304', N'PAPAYAL', N'2403')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250101', N'CALLERIA', N'2501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250102', N'CAMPOVERDE', N'2501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250103', N'IPARIA', N'2501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250104', N'MASISEA', N'2501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250105', N'YARINACOCHA', N'2501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250106', N'NUEVA REQUENA', N'2501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250107', N'MANANTAY', N'2501')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250201', N'RAYMONDI', N'2502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250202', N'SEPAHUA', N'2502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250203', N'TAHUANIA', N'2502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250204', N'YURUA', N'2502')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250301', N'PADRE ABAD', N'2503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250302', N'IRAZOLA', N'2503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250303', N'CURIMANA', N'2503')
INSERT [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig], [dist_c_vnomb], [prov_c_ccod]) VALUES (N'250401', N'PURUS', N'2504')
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ITEM](
	[itm_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[itm_c_ccodigo] [nvarchar](100) NOT NULL,
	[itm_c_vdescripcion] [nvarchar](100) NOT NULL,
	[itm_c_dprecio_compra] [decimal](19, 2) NOT NULL,
	[itm_c_yumedida] [tinyint] NOT NULL,
	[itm_c_vpardes] [nvarchar](100) NOT NULL,
	[itm_c_bactivo] [bit] NOT NULL,
	[itm_c_dprecio_venta] [decimal](19, 2) NOT NULL,
	[itm_c_isf_iid] [int] NOT NULL,
 CONSTRAINT [PK_SIC_T_ITEM] PRIMARY KEY CLUSTERED 
(
	[itm_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  ,
 CONSTRAINT [UQ__SIC_T_IT__28CD5C006EF57B66] UNIQUE NONCLUSTERED 
(
	[itm_c_ccodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM] ON
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (1, N'item prueba', N'item de prueba', CAST(100000.00 AS Decimal(19, 2)), 7, N'KG', 1, CAST(20.00 AS Decimal(19, 2)), 1)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (2, N'789456', N'prueba', CAST(50.00 AS Decimal(19, 2)), 8, N'LITROS', 0, CAST(50.00 AS Decimal(19, 2)), 1)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (3, N'EZ-0001', N'Esparrago Zincado 3/8', CAST(2.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(3.50 AS Decimal(19, 2)), 3)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (4, N'EZ-0002', N'Esparrago Zincado 1/2', CAST(4.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(6.00 AS Decimal(19, 2)), 3)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (5, N'AZ-0001', N'Autorroscante Zincado # 6 - 1/8 x 3/8', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (6, N'AZ-0002', N'Autorroscante Zincado # 6 - 1/8 x 1/2', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (7, N'AZ-0003', N'Autorroscante Zincado # 6 - 1/8 x 5/8', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (8, N'AZ-0004', N'Autorroscante Zincado # 6 - 1/8 x 3/4', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (9, N'AZ-0005', N'Autorroscante Zincado # 6 - 1/8 x 1"', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (10, N'AZ-0006', N'Autorroscante Zincado # 8 - 5/32 x 3/8', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (11, N'AZ-0007', N'Autorroscante Zincado # 8 - 5/32 x 1/2', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (12, N'AZ-0008', N'Autorroscante Zincado # 8 - 5/32 x 5/8', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (13, N'AZ-0009', N'Autorroscante Zincado # 8 - 5/32 x 3/4', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (14, N'AZ-0010', N'Autorroscante Zincado # 8 - 5/32 x 1"', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (15, N'AZ-0011', N'Autorroscante Zincado # 10 - 3/16 x 1/2', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (16, N'AZ-0012', N'Autorroscante Zincado # 10 - 3/16 x 5/8', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (17, N'AZ-0013', N'Autorroscante Zincado # 10 - 3/16 x 3/4', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (18, N'AZ-0014', N'Autorroscante Zincado # 10 - 3/16 x 1"', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (19, N'AZ-0015', N'Autorroscante Zincado # 12 - 7/32 x 1/2', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (20, N'AZ-0016', N'Autorroscante Zincado # 12 - 7/32 x 5/8', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (21, N'AZ-0017', N'Autorroscante Zincado # 12 - 7/32 x 3/4', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (22, N'AZ-0018', N'Autorroscante Zincado # 12 - 7/32 x 1"', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (23, N'AZ-0019', N'Autorroscante Zincado # 14 - 1/4 x 3/4', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (24, N'AZ-0020', N'Autorroscante Zincado # 14 - 1/4 x 1"', CAST(0.06 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (25, N'AZ-0021', N'Autorroscante Zincado # 14 - 1/4 x 1 1/4', CAST(0.06 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (26, N'AZ-0022', N'Autorroscante Zincado # 14 - 1/4 x 1 1/2', CAST(0.07 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (27, N'AZ-0023', N'Autorroscante Zincado # 14 - 1/4 x 2"', CAST(0.09 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 4)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (28, N'ETZ-0001', N'estobol Zincado 1/8 x 3/8', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (29, N'ETZ-0002', N'estobol Zincado 1/8 x 1/2', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (30, N'ETZ-0003', N'estobol Zincado 1/8 x 5/8', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (31, N'ETZ-0004', N'estobol Zincado 1/8 x 3/4', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (32, N'ETZ-0005', N'estobol Zincado 1/8 x 1"', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (33, N'ETZ-0006', N'tuerca zincada 1/8', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (34, N'ETZ-0007', N'estobol Zincado 5/32 x 3/8', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (35, N'ETZ-0008', N'estobol Zincado 5/32 x 1/2', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (36, N'ETZ-0009', N'estobol Zincado 5/32 x5/8', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (37, N'ETZ-0010', N'estobol Zincado 5/32 x 3/4', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (38, N'ETZ-0011', N'estobol Zincado 5/32 x 1"', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (39, N'ETZ-0012', N'tuerca zincada 5/32', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (40, N'ETZ-0013', N'estobol Zincado 3/16 x 3/8', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (41, N'ETZ-0014', N'estobol Zincado 3/16 x 1/2', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (42, N'ETZ-0015', N'estobol Zincado 3/16 x 5/8', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (43, N'ETZ-0016', N'estobol Zincado 3/16 x 3/4', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (44, N'ETZ-0017', N'estobol Zincado 3/16 x 1"', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (45, N'ETZ-0018', N'tuerca zincada 3/16', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (46, N'ETZ-0019', N'estobol Zincado 1/4 x 1/2', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (47, N'ETZ-0020', N'estobol Zincado 1/4 x 5/8', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (48, N'ETZ-0021', N'estobol Zincado 1/4 x 3/4', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (49, N'ETZ-0022', N'estobol Zincado 1/4 x 1"', CAST(0.06 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (50, N'ETZ-0023', N'tuerca zincada 1/4', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 5)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (51, N'PEN-0001', N'Pernos exagonales negros 1/4 x 1/2', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (52, N'PEN-0002', N'Pernos exagonales negros 1/4 x 5/8', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (53, N'PEN-0003', N'Pernos exagonales negros 1/4 x 3/4', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (54, N'PEN-0004', N'Pernos exagonales negros 1/4 x 1"', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (55, N'PEN-0005', N'Pernos exagonales negros 1/4 x 1 1/2', CAST(0.08 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (56, N'PEN-0006', N'Pernos exagonales negros 1/4 x 2"', CAST(0.09 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (57, N'PEN-0007', N'tuerca negra 1/4', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (58, N'PEN-0008', N'Pernos exagonales negros 5/16 x 1/2', CAST(0.06 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (59, N'PEN-0009', N'Pernos exagonales negros 5/16 x 5/8', CAST(0.06 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (60, N'PEN-0010', N'Pernos exagonales negros 5/16 x 3/4', CAST(0.08 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (61, N'PEN-0011', N'Pernos exagonales negros 5/16 x 1"', CAST(0.09 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (62, N'PEN-0012', N'Pernos exagonales negros 5/16 x 1 1/2', CAST(0.11 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (63, N'PEN-0013', N'Pernos exagonales negros 5/16 x 2"', CAST(0.16 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (64, N'PEN-0014', N'tuerca negra 5/16', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (65, N'PEN-0015', N'Pernos exagonales negros 3/8 x 5/8', CAST(0.10 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (66, N'PEN-0016', N'Pernos exagonales negros 3/8 x 3/4', CAST(0.11 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (67, N'PEN-0017', N'Pernos exagonales negros 3/8 x 1"', CAST(0.12 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (68, N'PEN-0018', N'Pernos exagonales negros 3/8 x 1 1/4', CAST(0.15 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.35 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (69, N'PEN-0019', N'Pernos exagonales negros 3/8 x 1 1/2', CAST(0.16 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.35 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (70, N'PEN-0020', N'Pernos exagonales negros 3/8 x 2"', CAST(0.21 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.35 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (71, N'PEN-0021', N'tuerca negra 3/8', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (72, N'PEN-0022', N'Pernos exagonales negros 7/16 x 3/4', CAST(0.16 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (73, N'PEN-0023', N'Pernos exagonales negros 7/16 x 1"', CAST(0.17 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (74, N'PEN-0024', N'Pernos exagonales negros 7/16 x1 1/4', CAST(0.20 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (75, N'PEN-0025', N'Pernos exagonales negros 7/16 x1 1/2', CAST(0.23 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.45 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (76, N'PEN-0026', N'Pernos exagonales negros 7/16 x 2"', CAST(0.31 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.45 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (77, N'PEN-0027', N'tuerca negra 7/16', CAST(0.10 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (78, N'PEN-0028', N'Pernos exagonales negros 1/2 x 1"', CAST(0.28 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.60 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (79, N'PEN-0029', N'Pernos exagonales negros 1/2 x 1 1/4', CAST(0.31 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.60 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (80, N'PEN-0030', N'Pernos exagonales negros 1/2 x 1 1/2', CAST(0.33 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.70 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (81, N'PEN-0031', N'Pernos exagonales negros 1/2 x 2"', CAST(0.42 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.75 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (82, N'PEN-0032', N'tuerca negra 1/2', CAST(0.12 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 6)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (83, N'PEZ-0001', N'Pernos exagonales ZINCADOS 1/4 x 1/2', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (84, N'PEZ-0002', N'Pernos exagonales ZINCADOS 1/4 x 5/8', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (85, N'PEZ-0003', N'Pernos exagonales ZINCADOS 1/4 x 3/4', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (86, N'PEZ-0004', N'Pernos exagonales ZINCADOS 1/4 x 1"', CAST(0.05 AS Decimal(19, 2)), 7, N'KG', 1, CAST(0.15 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (87, N'PEZ-0005', N'Pernos exagonales ZINCADOS 1/4 x 1 1/2', CAST(0.08 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (88, N'PEZ-0006', N'Pernos exagonales ZINCADOS 1/4 x 2"', CAST(0.09 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (89, N'PEZ-0007', N'tuerca zincada 1/4', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (90, N'PEZ-0008', N'Pernos exagonales ZINCADOS 5/16 x 1/2', CAST(0.06 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (91, N'PEZ-0009', N'Pernos exagonales ZINCADOS 5/16 x 5/8', CAST(0.06 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (92, N'PEZ-0010', N'Pernos exagonales ZINCADOS 5/16 x 3/4', CAST(0.08 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (93, N'PEZ-0011', N'Pernos exagonales ZINCADOS 5/16 x1"', CAST(0.09 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (94, N'PEZ-0012', N'Pernos exagonales ZINCADOS 5/16 x 1 1/2', CAST(0.11 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (95, N'PEZ-0013', N'Pernos exagonales ZINCADOS 5/16 x 2"', CAST(0.16 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (96, N'PEZ-0014', N'tuerca zincada 5/16', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (97, N'PEZ-0015', N'Pernos exagonales ZINCADOS 3/8 x 5/8', CAST(0.10 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (98, N'PEZ-0016', N'Pernos exagonales ZINCADOS 3/8 x 3/4', CAST(0.11 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (99, N'PEZ-0017', N'Pernos exagonales ZINCADOS 3/8 x 1"', CAST(0.12 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (100, N'PEZ-0018', N'Pernos exagonales ZINCADOS 3/8 x 1 1/4', CAST(0.15 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.35 AS Decimal(19, 2)), 7)
GO
print 'Processed 100 total records'
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (101, N'PEZ-0019', N'Pernos exagonales ZINCADOS 3/8 x1 1/2', CAST(0.16 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.35 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (102, N'PEZ-0020', N'Pernos exagonales ZINCADOS 3/8 x 2"', CAST(0.21 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.35 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (103, N'PEZ-0021', N'tuerca zincada 3/8', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (104, N'PEZ-0022', N'Pernos exagonales ZINCADOS 7/16 x 3/4', CAST(0.16 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (105, N'PEZ-0023', N'Pernos exagonales ZINCADOS 7/16 x 1"', CAST(0.17 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (106, N'PEZ-0024', N'Pernos exagonales ZINCADOS 7/16 x 1 1/4', CAST(0.20 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (107, N'PEZ-0025', N'Pernos exagonales ZINCADOS 7/16 x 1 1/2', CAST(0.23 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.45 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (108, N'PEZ-0026', N'Pernos exagonales ZINCADOS 7/16 x 2"', CAST(0.31 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.45 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (109, N'PEZ-0027', N'tuerca zincada 7/16', CAST(0.10 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (110, N'PEZ-0028', N'Pernos exagonales ZINCADOS 1/2 x 1"', CAST(0.28 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.60 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (111, N'PEZ-0029', N'Pernos exagonales ZINCADOS 1/2 x 1 1/4', CAST(0.31 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.60 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (112, N'PEZ-0030', N'Pernos exagonales ZINCADOS 1/2 x 1 1/2', CAST(0.33 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.70 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (113, N'PEZ-0031', N'Pernos exagonales ZINCADOS 1/2 x 2"', CAST(0.42 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.75 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (114, N'PEZ-0032', N'tuercas zincada 1/2', CAST(0.12 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 7)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (115, N'PET-0001', N'Pernos exagonales TROPICALIZADOS M 5 x 10', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (116, N'PET-0002', N'Pernos exagonales TROPICALIZADOS M 5 x 15', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (117, N'PET-0003', N'Pernos exagonales TROPICALIZADOS M 5 x 20', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (118, N'PET-0004', N'Pernos exagonales TROPICALIZADOS M 5 x 25', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (119, N'PET-0005', N'tuerca tropicalizada M 5', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.05 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (120, N'PET-0006', N'Pernos exagonales TROPICALIZADOS M 6 x 10', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (121, N'PET-0007', N'Pernos exagonales TROPICALIZADOS M 6 x 15', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (122, N'PET-0008', N'Pernos exagonales TROPICALIZADOS M 6 x 20', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (123, N'PET-0009', N'Pernos exagonales TROPICALIZADOS M 6 x 25', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (124, N'PET-0010', N'tuerca tropicalizada M 6', CAST(0.01 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.05 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (125, N'PET-0011', N'Pernos exagonales TROPICALIZADOS M 8 x 15', CAST(0.08 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (126, N'PET-0012', N'Pernos exagonales TROPICALIZADOS M 8 x 20', CAST(0.08 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (127, N'PET-0013', N'Pernos exagonales TROPICALIZADOS M 8 x 25', CAST(0.10 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (128, N'PET-0014', N'Pernos exagonales TROPICALIZADOS M 8 x 30', CAST(0.11 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (129, N'PET-0015', N'tuerca tropicalizada M 8', CAST(0.03 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (130, N'PET-0016', N'Pernos exagonales TROPICALIZADOS M 10 x 20', CAST(0.17 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (131, N'PET-0017', N'Pernos exagonales TROPICALIZADOS M 10 x 25', CAST(0.18 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (132, N'PET-0018', N'Pernos exagonales TROPICALIZADOS M 10 x 30', CAST(0.19 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.45 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (133, N'PET-0019', N'Pernos exagonales TROPICALIZADOS M 10 x 35', CAST(0.22 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.45 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (134, N'PET-0020', N'Pernos exagonales TROPICALIZADOS M 10 x 40', CAST(0.25 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.50 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (135, N'PET-0021', N'tuerca tropicalizada M 10', CAST(0.08 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (136, N'PET-0022', N'Pernos exagonales TROPICALIZADOS M 12 x 25', CAST(0.25 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.50 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (137, N'PET-0023', N'Pernos exagonales TROPICALIZADOS M 12 x 30', CAST(0.28 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.55 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (138, N'PET-0024', N'Pernos exagonales TROPICALIZADOS M 12 x 35', CAST(0.30 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.60 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (139, N'PET-0025', N'Pernos exagonales TROPICALIZADOS M 12 x 40', CAST(0.32 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.65 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (140, N'PET-0026', N'Pernos exagonales TROPICALIZADOS M 12 x 50', CAST(0.37 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.75 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (141, N'PET-0027', N'tuerca tropicalizada M 12', CAST(0.12 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 8)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (142, N'PCDC-0001', N'Pernos cabeza de coche 1/4 x 3/4', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (143, N'PCDC-0002', N'Pernos cabeza de coche 1/4 x 1"', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (144, N'PCDC-0003', N'Pernos cabeza de coche 1/4 x 1 1/4', CAST(0.06 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (145, N'PCDC-0004', N'Pernos cabeza de coche 1/4 x 1 1/2', CAST(70.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (146, N'PCDC-0005', N'Pernos cabeza de coche 1/4 x 2"', CAST(0.08 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (147, N'PCDC-0006', N'Pernos cabeza de coche 1/4 x 3"', CAST(0.12 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (148, N'PCDC-0007', N'Pernos cabeza de coche 1/4 x 3 1/2', CAST(0.15 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (149, N'PCDC-0008', N'tuerca zincada 1/4', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (150, N'PCDC-0009', N'Pernos cabeza de coche 5/16 x 1"', CAST(0.09 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (151, N'PCDC-0010', N'Pernos cabeza de coche 5/16 x 1 1/4', CAST(0.10 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.25 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (152, N'PCDC-0011', N'Pernos cabeza de coche 5/16 x 1 1/2', CAST(0.12 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.30 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (153, N'PCDC-0012', N'Pernos cabeza de coche 5/16 x 2"', CAST(0.15 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.35 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (154, N'PCDC-0013', N'tuerca zincada 5/16', CAST(0.04 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (155, N'PCDC-0014', N'Pernos cabeza de coche 3/8 x 1"', CAST(150.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.35 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (156, N'PCDC-0015', N'Pernos cabeza de coche 3/8 x 1 1/4', CAST(0.17 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.40 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (157, N'PCDC-0016', N'Pernos cabeza de coche 3/8 x 1 1/2', CAST(0.19 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.45 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (158, N'PCDC-0017', N'Pernos cabeza de coche 3/8 x 2"', CAST(0.21 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.50 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (159, N'PCDC-0018', N'tuerca zincadas 3/8', CAST(0.05 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 9)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (160, N'PDE-0001', N'pernos de expansion 1/4 x 2 1/4', CAST(0.37 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.80 AS Decimal(19, 2)), 10)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (161, N'PDE-0002', N'pernos de expansion 1/4 x 3 1/4', CAST(0.42 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.90 AS Decimal(19, 2)), 10)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (162, N'PDE-0003', N'pernos de expansion 3/8 x 2 3/4', CAST(0.57 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.20 AS Decimal(19, 2)), 10)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (163, N'PDE-0004', N'pernos de expansion 3/8 x 3', CAST(0.62 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.50 AS Decimal(19, 2)), 10)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (164, N'PDE-0005', N'pernos de expansion 3/8 x 3 3/4', CAST(0.77 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.80 AS Decimal(19, 2)), 10)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (165, N'PDE-0006', N'pernos de expansion 1/2 x 2 3/4', CAST(1.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(2.40 AS Decimal(19, 2)), 10)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (166, N'PDE-0007', N'pernos de expansion 1/2 x 3 3/4', CAST(1.25 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(2.70 AS Decimal(19, 2)), 10)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (167, N'PDE-0008', N'pernos de expansion 1/2 x 4 1/4', CAST(1.39 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(3.00 AS Decimal(19, 2)), 10)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (168, N'ARZ-0001', N'arandela zincada 1/8', CAST(12.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.02 AS Decimal(19, 2)), 11)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (169, N'ARZ-0002', N'arandela zincada 5/32', CAST(10.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.02 AS Decimal(19, 2)), 11)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (170, N'ARZ-0003', N'arandela zincada 3/16', CAST(8.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.02 AS Decimal(19, 2)), 11)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (171, N'ARZ-0004', N'arandela zincada 1/4', CAST(6.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.08 AS Decimal(19, 2)), 11)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (172, N'ARZ-0005', N'arandela zincada 5/16', CAST(6.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 11)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (173, N'ARZ-0006', N'arandela zincada 3/8', CAST(6.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.12 AS Decimal(19, 2)), 11)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (174, N'ARZ-0007', N'arandela zincada 1/2', CAST(6.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 11)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (175, N'ARN-0001', N'arandela negra 1/4', CAST(5.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.07 AS Decimal(19, 2)), 12)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (176, N'ARN-0002', N'arandela negra 5/16', CAST(5.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 12)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (177, N'ARN-0003', N'arandela negra 3/8', CAST(5.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.12 AS Decimal(19, 2)), 12)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (178, N'ARN-0004', N'arandela negra 1/2', CAST(5.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 12)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (179, N'ART-0001', N'arandela tropicalizada M5', CAST(10.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.02 AS Decimal(19, 2)), 13)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (180, N'ART-0002', N'arandela tropicalizada M6', CAST(10.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.04 AS Decimal(19, 2)), 13)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (181, N'ART-0003', N'arandela tropicalizada M8', CAST(10.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 13)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (182, N'ART-0004', N'arandela tropicalizada M10', CAST(10.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 13)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (183, N'ART-0005', N'arandela tropicalizada M12', CAST(10.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.20 AS Decimal(19, 2)), 13)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (184, N'DDCW-0001', N'disco de corte de walt 4 1/2"x 1 mm.', CAST(2.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(2.50 AS Decimal(19, 2)), 14)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (185, N'DDCW-0002', N'disco de corte de walt 7"x 1/16', CAST(4.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(5.00 AS Decimal(19, 2)), 14)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (186, N'DDCN-0001', N'disco de corte norton 7"x 1/16', CAST(4.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(5.50 AS Decimal(19, 2)), 15)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (187, N'DDDW-0001', N'disco de debaste de walt 4 1/2 X 1/4', CAST(3.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(4.00 AS Decimal(19, 2)), 16)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (188, N'DDDW-0002', N'disco de debaste de walt 7"', CAST(5.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(6.00 AS Decimal(19, 2)), 16)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (189, N'PN-0001', N'polifan norton grano 80', CAST(8.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(10.00 AS Decimal(19, 2)), 17)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (190, N'PN-0002', N'polifan norton grano 120', CAST(8.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(10.00 AS Decimal(19, 2)), 17)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (191, N'DTW-0001', N'disco de tronzadora de walt 14"', CAST(10.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(13.00 AS Decimal(19, 2)), 18)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (192, N'HDCS-0001', N'hoja de cierra sablex  sanflex', CAST(3.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(3.50 AS Decimal(19, 2)), 20)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (193, N'W-0001', N'WINCHAS 3"', CAST(8.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(9.00 AS Decimal(19, 2)), 21)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (194, N'W-0002', N'WINCHAS 5"', CAST(13.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(14.00 AS Decimal(19, 2)), 21)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (195, N'LDF-0001', N'lijas de fierro # 40', CAST(1.30 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.60 AS Decimal(19, 2)), 22)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (196, N'LDF-0002', N'lijas de fierro # 60', CAST(1.30 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.60 AS Decimal(19, 2)), 22)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (197, N'LDF-0003', N'lijas de fierro # 80', CAST(1.30 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.60 AS Decimal(19, 2)), 22)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (198, N'LDF-0004', N'lijas de fierro # 100', CAST(1.30 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.60 AS Decimal(19, 2)), 22)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (199, N'LDF-0005', N'lijas de fierro # 120', CAST(1.30 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.60 AS Decimal(19, 2)), 22)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (200, N'LDA-0001', N'lijas de agua # 80', CAST(0.80 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 23)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (201, N'LDA-0002', N'lijas de agua # 120', CAST(0.80 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 23)
GO
print 'Processed 200 total records'
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (202, N'LDA-0003', N'lijas de agua # 220', CAST(0.80 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 23)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (203, N'LDA-0004', N'lijas de agua # 240', CAST(0.80 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 23)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (204, N'LDA-0005', N'lijas de agua # 320', CAST(0.80 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 23)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (205, N'LDM-0001', N'lija de madera # 40', CAST(1.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.30 AS Decimal(19, 2)), 24)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (206, N'LDM-0002', N'lija de madera # 60', CAST(1.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.30 AS Decimal(19, 2)), 24)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (207, N'LDM-0003', N'lija de madera # 80', CAST(1.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.30 AS Decimal(19, 2)), 24)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (208, N'BDF-0001', N'brocas de fierro 1/16', CAST(0.40 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 25)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (209, N'BDF-0002', N'brocas de fierro 1/8', CAST(0.40 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 25)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (210, N'BDF-0003', N'brocas de fierro 3/16', CAST(0.70 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(2.00 AS Decimal(19, 2)), 25)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (211, N'BDF-0004', N'brocas de fierro 1/4', CAST(1.20 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(3.00 AS Decimal(19, 2)), 25)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (212, N'BDF-0005', N'brocas de fierro 5/16', CAST(2.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(4.50 AS Decimal(19, 2)), 25)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (213, N'BDF-0006', N'brocas de fierro 3/8', CAST(3.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(6.00 AS Decimal(19, 2)), 25)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (214, N'BDF-0007', N'brocas de fierro 7/16', CAST(5.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(8.00 AS Decimal(19, 2)), 25)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (215, N'BDF-0008', N'brocas de fierro 1/2', CAST(6.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(9.00 AS Decimal(19, 2)), 25)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (216, N'AC-0001', N'Angulo 3/4 X 3/4 X CAMERO', CAST(13.66 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(13.70 AS Decimal(19, 2)), 26)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (217, N'AC-0002', N'Angulo 1"X 1"X CAMERO', CAST(17.27 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(17.30 AS Decimal(19, 2)), 26)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (218, N'A-0001', N'Angulo 3/4 X 3/4 X 1/8', CAST(16.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(16.00 AS Decimal(19, 2)), 27)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (219, N'A-0002', N'Angulo1"X 1"X 1/8', CAST(21.67 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(21.70 AS Decimal(19, 2)), 27)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (220, N'A-0003', N'Angulo 1 1/4"X 1 1/4"X 1/8', CAST(26.44 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(26.50 AS Decimal(19, 2)), 27)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (221, N'A-0004', N'Angulo 1 1/2"X 1 1/2"X 1/8', CAST(33.47 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(33.50 AS Decimal(19, 2)), 27)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (222, N'P-0001', N'Platina 1/2 X 1/8', CAST(6.12 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(6.20 AS Decimal(19, 2)), 28)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (223, N'P-0002', N'Platina 1"X 1/8', CAST(12.11 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(12.20 AS Decimal(19, 2)), 28)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (224, N'P-0003', N'Platina 1 1/4"X 1/8', CAST(15.55 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(15.60 AS Decimal(19, 2)), 28)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (225, N'T-0001', N'TEES 3/4 x 1/8', CAST(18.99 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(19.00 AS Decimal(19, 2)), 29)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (226, N'T-0002', N'TEES 1" x 1/8', CAST(24.13 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(24.20 AS Decimal(19, 2)), 29)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (227, N'RL-0001', N'Redondo Lizo 3/8', CAST(11.60 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(11.60 AS Decimal(19, 2)), 30)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (228, N'RL-0002', N'Redondo Lizo 1/2', CAST(19.36 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(19.40 AS Decimal(19, 2)), 30)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (229, N'RL-0003', N'Redondo Lizo 5/8', CAST(31.21 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(31.30 AS Decimal(19, 2)), 30)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (230, N'RL-0004', N'Cuadrado Lizo 3/8', CAST(12.78 AS Decimal(19, 2)), 19, N'UNIDAD', 0, CAST(12.80 AS Decimal(19, 2)), 30)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (231, N'RL-0005', N'Cuadrado Lizo 1/2', CAST(21.96 AS Decimal(19, 2)), 19, N'UNIDAD', 0, CAST(22.00 AS Decimal(19, 2)), 30)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (232, N'CL-0001', N'Cuadrado Lizo 3/8', CAST(12.78 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(12.80 AS Decimal(19, 2)), 31)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (233, N'CL-0002', N'Cuadrado Lizo 1/2', CAST(21.96 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(22.00 AS Decimal(19, 2)), 31)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (234, N'CL-0003', N'Cuadrado Lizo 5/8', CAST(34.54 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(34.60 AS Decimal(19, 2)), 31)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (235, N'PL-0001', N'plancha liza 1/20', CAST(71.51 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(72.00 AS Decimal(19, 2)), 32)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (236, N'PL-0002', N'plancha liza 1/16', CAST(89.40 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(90.00 AS Decimal(19, 2)), 32)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (237, N'TC-0001', N'TUBO CUADRADO 1" x 0.09 mm.', CAST(13.86 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(13.90 AS Decimal(19, 2)), 33)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (238, N'TC-0002', N'TUBO CUADRADO 1" x 1.2 mm.', CAST(20.26 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(20.30 AS Decimal(19, 2)), 33)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (239, N'TC-0003', N'TUBO CUADRADO 1" x 1.5 mm.', CAST(25.31 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(25.40 AS Decimal(19, 2)), 33)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (240, N'TRN-0001', N'TUBO REDONDO NEGRO 1 1/2"x 2.00 mm.', CAST(43.18 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(43.20 AS Decimal(19, 2)), 34)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (241, N'TRN-0002', N'TUBO REDONDO NEGRO 2"x 2.00 mm.', CAST(53.87 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(53.90 AS Decimal(19, 2)), 34)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (242, N'RR-0001', N'RUBO RECTANGULAR 40 X 60 X 1.50 mm.', CAST(46.42 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(46.50 AS Decimal(19, 2)), 35)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (243, N'RR-0002', N'RUBO RECTANGULAR 40 X 60 X 1.8 mm.', CAST(60.45 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(60.50 AS Decimal(19, 2)), 35)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (244, N'FC-0001', N'fierro corrugado  1/2', CAST(26.22 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(26.30 AS Decimal(19, 2)), 36)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (245, N'TC-0004', N'TUBO CUADRADO 2x2x1.5 mm.', CAST(47.27 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(47.30 AS Decimal(19, 2)), 33)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (246, N'AB-0001', N'ABRAZADERA 3/4 X 1/2', CAST(0.07 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.15 AS Decimal(19, 2)), 37)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (247, N'TDPA-0001', N'TARUGO DE PALASTICO AZUL  3/8', CAST(0.02 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.10 AS Decimal(19, 2)), 38)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (248, N'BV-0001', N'BISAGRA VENTANA', CAST(0.38 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.60 AS Decimal(19, 2)), 39)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (249, N'B-0002', N'BISAGRA 1/2 X 4', CAST(1.15 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(2.50 AS Decimal(19, 2)), 40)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (250, N'B-0003', N'BISAGRA 5/8 X 6 X 3 ALAS', CAST(3.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(5.00 AS Decimal(19, 2)), 40)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (251, N'B-0004', N'BISAGRA  3/8 X 4', CAST(0.72 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.50 AS Decimal(19, 2)), 40)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (252, N'B-0005', N'BISAGRA DE 3/8 X 3', CAST(0.62 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.30 AS Decimal(19, 2)), 40)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (253, N'B-0006', N'BISAGRA DE 3" X 3" 2 CAJAS', CAST(2.00 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(3.00 AS Decimal(19, 2)), 40)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (254, N'ODC-0001', N'OREJA DE CANDADO', CAST(0.36 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(0.80 AS Decimal(19, 2)), 41)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (255, N'CM-0001', N'Cerrojo Mediano   2 DOC', CAST(0.92 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(2.00 AS Decimal(19, 2)), 42)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (256, N'CB-0002', N'Cerrojo  BEBE 2 DOC', CAST(0.71 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.50 AS Decimal(19, 2)), 43)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (257, N'CF-0003', N'Cerrojo  FAMILIAR 1 DOC', CAST(1.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(3.00 AS Decimal(19, 2)), 44)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (258, N'C-0004', N'CERROJO DE 1/2 X 4   1 DOC', CAST(1.92 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(3.50 AS Decimal(19, 2)), 45)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (259, N'MV-0001', N'MANIJA VENTANA', CAST(0.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 46)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (260, N'PÑ-0001', N'PIÑA DE 5/8 BAJA', CAST(0.40 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.00 AS Decimal(19, 2)), 47)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (261, N'S-0001', N'SPRAY', CAST(6.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(6.50 AS Decimal(19, 2)), 48)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (262, N'GV-0001', N'GRASA EP-2 VISTONY', CAST(8.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(8.50 AS Decimal(19, 2)), 49)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (263, N'WD-0001', N'WD-40', CAST(17.21 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(17.21 AS Decimal(19, 2)), 50)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (264, N'LN-0001', N'Lunas negras GRADO 10', CAST(1.50 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.50 AS Decimal(19, 2)), 51)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio_compra], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo], [itm_c_dprecio_venta], [itm_c_isf_iid]) VALUES (265, N'LB-0002', N'Lunas blancas', CAST(1.40 AS Decimal(19, 2)), 19, N'UNIDAD', 1, CAST(1.40 AS Decimal(19, 2)), 52)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM] OFF
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM_ALMACEN]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN](
	[itm_alm_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[itm_alm_c_iid_item] [int] NOT NULL,
	[itm_alm_c_iid_alm] [int] NOT NULL,
	[itm_alm_c_ecantidad] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_SIC_T_ITEM_ALMACEN] PRIMARY KEY CLUSTERED 
(
	[itm_alm_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA](
	[odc_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_c_vcodigo] [varchar](10) NOT NULL,
	[odc_c_zfecharegistro] [datetime] NOT NULL,
	[odc_c_ymoneda] [tinyint] NOT NULL,
	[odc_c_esubtotal] [decimal](18, 2) NOT NULL,
	[odc_c_etotal] [decimal](18, 2) NOT NULL,
	[odc_c_eigv] [decimal](18, 2) NOT NULL,
	[odc_c_eigvcal] [decimal](18, 2) NOT NULL,
	[odc_c_epercepcion] [decimal](18, 2) NOT NULL,
	[odc_c_epercepcioncal] [decimal](18, 2) NOT NULL,
	[odc_c_iestado] [int] NOT NULL,
	[odc_c_vdescmoneda] [varchar](100) NOT NULL,
	[odc_c_bactivo] [bit] NOT NULL,
	[odc_c_vdescestado] [varchar](100) NOT NULL,
	[odc_c_vdocprov_id] [varchar](11) NOT NULL,
	[odc_c_zfechaentrega_ini] [datetime] NOT NULL,
	[odc_c_zfechaentrega_fin] [datetime] NOT NULL,
	[odc_c_iid_usuario_creador] [varchar](10) NOT NULL,
	[odc_c_iid_usuario_mod] [varchar](10) NULL,
	[odc_c_zfecharmod] [datetime] NULL,
	[odc_c_vobservacion] [varchar](350) NOT NULL,
	[odc_c_clase_iid] [int] NOT NULL,
	[odc_c_clase_des] [nvarchar](100) NOT NULL,
	[odc_c_bpercepcion] [bit] NOT NULL,
	[odc_c_idireccion] [int] NOT NULL,
	[odc_c_vdireccion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SIC_T_ORDEN_DE_COMPRA] PRIMARY KEY CLUSTERED 
(
	[odc_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_VENTA]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_VENTA](
	[ven_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[ven_c_zfecha] [datetime] NOT NULL,
	[ven_c_ymoneda] [tinyint] NOT NULL,
	[ven_c_esubtotal] [decimal](18, 2) NOT NULL,
	[ven_c_etotal] [decimal](18, 2) NOT NULL,
	[ven_c_vdoccli_id] [varchar](11) NOT NULL,
	[ven_c_eigv] [decimal](18, 2) NOT NULL,
	[ven_c_eigvcal] [decimal](18, 2) NOT NULL,
	[ven_c_itipodoc] [int] NOT NULL,
	[ven_c_vdescmoneda] [varchar](100) NOT NULL,
	[ven_c_bactivo] [bit] NOT NULL,
	[ven_c_vdestipodoc] [varchar](100) NOT NULL,
	[ven_c_icentrocosto] [int] NOT NULL,
	[ven_c_iestado] [int] NOT NULL,
	[ven_c_vestado] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SIC_T_VENTA] PRIMARY KEY CLUSTERED 
(
	[ven_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_NOMB_COM]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_NOMB_COM]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_CLI_NOMB_COM](
	[nomb_com_c_iid] [int] NOT NULL,
	[cli_c_vdoc_id] [varchar](11) NOT NULL,
 CONSTRAINT [PK_SIC_T_CLI_NOMB_COM] PRIMARY KEY CLUSTERED 
(
	[cli_c_vdoc_id] ASC,
	[nomb_com_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_DIRECCION]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION](
	[cli_direc_c_iid] [int] NOT NULL,
	[cli_direc_c_vdirec] [varchar](200) NULL,
	[cli_direc_c_ctipo] [char](1) NULL,
	[dist_c_ccod_ubig] [char](6) NULL,
	[cli_direc_c_bactivo] [bit] NULL,
	[cli_c_vdoc_id] [varchar](11) NOT NULL,
	[cli_direc_c_czonarep] [char](1) NULL,
 CONSTRAINT [PK_SIC_T_CLI_DIRECCION] PRIMARY KEY CLUSTERED 
(
	[cli_c_vdoc_id] ASC,
	[cli_direc_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_CLI_CONTACTO]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO](
	[cli_contac_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[cli_contac_c_cdoc_id] [char](12) NULL,
	[cli_contac_c_vnomb] [varchar](50) NULL,
	[cli_contac_c_vape_pat] [varchar](50) NULL,
	[cli_contac_c_vape_mat] [varchar](50) NULL,
	[cli_contac_c_ctlf] [varchar](15) NULL,
	[cli_contac_c_ccel] [varchar](15) NULL,
	[cli_contac_c_vcorreo] [varchar](50) NULL,
	[cli_contac_c_dfec_cump] [date] NULL,
	[cli_contac_cargo_c_yid] [tinyint] NOT NULL,
	[cli_contac_c_vobserv] [varchar](50) NULL,
	[cli_contac_c_bactivo] [bit] NULL,
	[cli_c_vdoc_id] [varchar](11) NOT NULL,
 CONSTRAINT [PK_SIC_T_CLI_CONTACTO] PRIMARY KEY CLUSTERED 
(
	[cli_contac_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_DESHABILITAR_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_DESHABILITAR_CLIENTE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [Mantenimiento].[SIC_SP_DESHABILITAR_CLIENTE]
@cli_c_vdoc_id VARCHAR(11) 
AS

UPDATE Mantenimiento.SIC_T_CLIENTE SET cli_c_bactivo = 0
WHERE cli_c_vdoc_id = @cli_c_vdoc_id
	 
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_VERIFICAR_EXISTENCIA]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_VERIFICAR_EXISTENCIA]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_VERIFICAR_EXISTENCIA]
--	Procedimiento	: ADV_SP_CLIENTE_VERIFICAR_EXISTENCIA
--	Parámetros		:	@cli_c_vdoc_id
--	Descripción		: Este procedimiento verifica si existe el código de cliente
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:32 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11)
AS
SELECT COUNT(*) FROM SIC_T_CLIENTE
WHERE cli_c_vdoc_id=@cli_c_vdoc_id
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_CONTAR_RUC]    Script Date: 02/19/2014 10:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_CONTAR_RUC]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_CONTAR_RUC]
--	Procedimiento	: ADV_SP_CLIENTE_CONTAR_RUC
--	Parámetros		:	@cli_c_vdoc_id
--	Descripción		:	Este procedimiento verifica si existe un ruc 
--						y devuelve la cantidad de veces que existe
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:40 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11)
AS
SELECT COUNT(*)
FROM SIC_T_CLIENTE
WHERE cli_c_vdoc_id=@cli_c_vdoc_id
' 
END
GO
/****** Object:  View [Mantenimiento].[SIC_VW_CLIENTE_LISTA]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_VW_CLIENTE_LISTA]'))
EXEC dbo.sp_executesql @statement = N'/*	Procedimiento	: ADV_VW_CLIENTE_LISTA
	Parámetros		: -
	Descripción		: Esta vista genera el grupo de datos que se mostrará en el formulario de cliente
	Retorno			:	nomb_com_c_iid,
						cli_c_vdoc_id,
						nomb_com_c_vnomb, 
						cli_c_vraz_soc, 
						cli_c_bgrupo_ibk 
	Notas			: N/A
	Autor			: Lenny Arias Camacho
	Fecha y Hora	: 26/11/2012 06:33 p.m.*/
CREATE VIEW [Mantenimiento].[SIC_VW_CLIENTE_LISTA]
AS
SELECT     NC.nomb_com_c_iid, C.cli_c_vdoc_id, NC.nomb_com_c_vnomb, C.cli_c_vraz_soc
FROM         Mantenimiento.SIC_T_CLI_NOMB_COM AS CLC INNER JOIN
                      Mantenimiento.SIC_T_CLIENTE AS C ON CLC.cli_c_vdoc_id = C.cli_c_vdoc_id INNER JOIN
                      Mantenimiento.SIC_T_NOMB_COM AS NC ON CLC.nomb_com_c_iid = NC.nomb_com_c_iid
WHERE     (C.cli_c_bactivo = 1)
'
GO
--IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'Mantenimiento', N'VIEW',N'SIC_VW_CLIENTE_LISTA', NULL,NULL))
--EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
--Begin DesignProperties = 
--   Begin PaneConfigurations = 
--      Begin PaneConfiguration = 0
--         NumPanes = 4
--         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
--      End
--      Begin PaneConfiguration = 1
--         NumPanes = 3
--         Configuration = "(H (1 [50] 4 [25] 3))"
--      End
--      Begin PaneConfiguration = 2
--         NumPanes = 3
--         Configuration = "(H (1 [50] 2 [25] 3))"
--      End
--      Begin PaneConfiguration = 3
--         NumPanes = 3
--         Configuration = "(H (4 [30] 2 [40] 3))"
--      End
--      Begin PaneConfiguration = 4
--         NumPanes = 2
--         Configuration = "(H (1 [56] 3))"
--      End
--      Begin PaneConfiguration = 5
--         NumPanes = 2
--         Configuration = "(H (2 [66] 3))"
--      End
--      Begin PaneConfiguration = 6
--         NumPanes = 2
--         Configuration = "(H (4 [50] 3))"
--      End
--      Begin PaneConfiguration = 7
--         NumPanes = 1
--         Configuration = "(V (3))"
--      End
--      Begin PaneConfiguration = 8
--         NumPanes = 3
--         Configuration = "(H (1[56] 4[18] 2) )"
--      End
--      Begin PaneConfiguration = 9
--         NumPanes = 2
--         Configuration = "(H (1 [75] 4))"
--      End
--      Begin PaneConfiguration = 10
--         NumPanes = 2
--         Configuration = "(H (1[66] 2) )"
--      End
--      Begin PaneConfiguration = 11
--         NumPanes = 2
--         Configuration = "(H (4 [60] 2))"
--      End
--      Begin PaneConfiguration = 12
--         NumPanes = 1
--         Configuration = "(H (1) )"
--      End
--      Begin PaneConfiguration = 13
--         NumPanes = 1
--         Configuration = "(V (4))"
--      End
--      Begin PaneConfiguration = 14
--         NumPanes = 1
--         Configuration = "(V (2))"
--      End
--      ActivePaneConfig = 0
--   End
--   Begin DiagramPane = 
--      Begin Origin = 
--         Top = 0
--         Left = 0
--      End
--      Begin Tables = 
--         Begin Table = "CLC"
--            Begin Extent = 
--               Top = 6
--               Left = 38
--               Bottom = 95
--               Right = 236
--            End
--            DisplayFlags = 280
--            TopColumn = 0
--         End
--         Begin Table = "C"
--            Begin Extent = 
--               Top = 6
--               Left = 274
--               Bottom = 125
--               Right = 472
--            End
--            DisplayFlags = 280
--            TopColumn = 11
--         End
--         Begin Table = "NC"
--            Begin Extent = 
--               Top = 96
--               Left = 38
--               Bottom = 185
--               Right = 236
--            End
--            DisplayFlags = 280
--            TopColumn = 0
--         End
--      End
--   End
--   Begin SQLPane = 
--   End
--   Begin DataPane = 
--      Begin ParameterDefaults = ""
--      End
--   End
--   Begin CriteriaPane = 
--      Begin ColumnWidths = 11
--         Column = 1440
--         Alias = 900
--         Table = 1170
--         Output = 720
--         Append = 1400
--         NewValue = 1170
--         SortType = 1350
--         SortOrder = 1410
--         GroupBy = 1350
--         Filter = 1350
--         Or = 1350
--         Or = 1350
--         Or = 1350
--      End
--   End
--End
--' , @level0type=N'SCHEMA',@level0name=N'Mantenimiento', @level1type=N'VIEW',@level1name=N'SIC_VW_CLIENTE_LISTA'
--GO
--IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'Mantenimiento', N'VIEW',N'SIC_VW_CLIENTE_LISTA', NULL,NULL))
--EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Mantenimiento', @level1type=N'VIEW',@level1name=N'SIC_VW_CLIENTE_LISTA'
--GO
--/****** Object:  Table [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]    Script Date: 02/19/2014 10:27:56 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_PADDING ON
--GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA](
	[mve_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[mve_c_ioc_id] [int] NOT NULL,
	[mve_c_zfecharegistro] [datetime] NOT NULL,
	[mve_c_zguiafecha] [datetime] NULL,
	[mve_c_zfacturafecha] [datetime] NOT NULL,
	[mve_c_vguiacodigo] [varchar](10) NULL,
	[mve_c_vfacturacodigo] [varchar](10) NOT NULL,
	[mve_c_iidalmacen] [int] NOT NULL,
	[mve_c_bactivo] [bit] NOT NULL,
	[mve_c_iestado] [int] NOT NULL,
	[mve_c_vdesestado] [nvarchar](100) NOT NULL,
	[mve_c_vobservacion] [nvarchar](350) NOT NULL,
	[mve_c_bingresado] [bit] NOT NULL,
 CONSTRAINT [PK_SIC_T_MOVIMIENTO_ENTRADA] PRIMARY KEY CLUSTERED 
(
	[mve_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_NOMBRE_COMERCIAL_LISTAR]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_NOMBRE_COMERCIAL_LISTAR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [Mantenimiento].[SIC_SP_NOMBRE_COMERCIAL_LISTAR]
@CLI_C_VDOC_ID VARCHAR(11)

AS
SELECT 
NOMB.nomb_com_c_iid,
NOMB.nomb_com_c_vnomb
 FROM SIC_T_CLIENTE CLI 
INNER JOIN SIC_T_CLI_NOMB_COM CLI_NCOM
ON CLI.cli_c_vdoc_id = CLI_NCOM.cli_c_vdoc_id
INNER JOIN SIC_T_NOMB_COM NOMB
ON CLI_NCOM.nomb_com_c_iid = NOMB.nomb_com_c_iid
WHERE CLI.cli_c_vdoc_id = @CLI_C_VDOC_ID
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_CONTACTO_LIMPIAR]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_CONTACTO_LIMPIAR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_CONTACTO_LIMPIAR]
--	Procedimiento	: ADV_SP_CLIENTE_CONTACTO_LIMPIAR
--	Parámetros		:	@cli_c_vdoc_id
--	Descripción		:	Este procedimiento elimina la relacion entre el cliente y 
--						sus contactos. 
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:39 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11)
AS
DELETE FROM SIC_T_CLI_CONTACTO
WHERE cli_c_vdoc_id=@cli_c_vdoc_id
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_LISTAR]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_LISTAR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_LISTAR]
@CLI_C_VRAZ_SOC VARCHAR(200),
@CLI_C_VDOC_ID VARCHAR(11)
AS

SELECT
CLI.cli_c_vraz_soc,
CLI.cli_c_vpartida,
CLI.cli_c_vrubro,                                                                                                                                                                                            
CLI.cli_c_ctlf,
CLI.cli_c_dfec_aniv, 
CLI.cli_c_btipo_pers, 
CLI.colab_c_cdoc_id, 
CLI.cli_scor_c_cletra, 
CLI.cli_c_bactivo, 
CLI.cli_c_vdoc_id, 
CLI.zona_rep_c_yid, 
CLI.cli_c_dfecharegistra,    
CLI.cli_c_dfechaactualiza,
CLI.cli_c_dfec_const,
CLI.cli_c_bproveedor,
CLI.cli_c_bcliente,
CLI_DIREC.cli_direc_c_vdirec + '', ''+ DEP.depa_c_vnomb +'' - ''+PROV.prov_c_vnomb +'' - ''+DEP.depa_c_vnomb AS ''cli_direc_c_dfiscal''
FROM Mantenimiento.SIC_T_CLIENTE CLI INNER JOIN 
Mantenimiento.SIC_T_CLI_DIRECCION CLI_DIREC
ON CLI.cli_c_vdoc_id = CLI_DIREC.cli_c_vdoc_id 
INNER JOIN Mantenimiento.SIC_T_DISTRITO DIST
ON CLI_DIREC.dist_c_ccod_ubig = DIST.dist_c_ccod_ubig
INNER JOIN Mantenimiento.SIC_T_PROVINCIA PROV
ON DIST.prov_c_ccod = PROV.prov_c_ccod
INNER JOIN Mantenimiento.SIC_T_DEPARTAMENTO DEP
ON PROV.depa_c_ccod = DEP.depa_c_ccod 
WHERE CLI.cli_c_vraz_soc LIKE   ''%'' +@CLI_C_VRAZ_SOC  +''%''
AND (CLI.cli_c_vdoc_id LIKE ''%''+@CLI_C_VDOC_ID+''%'' OR @CLI_C_VDOC_ID = '''')
AND CLI.cli_c_bactivo = 1 -- ACTIVO
AND CLI_DIREC.cli_direc_c_ctipo = 1

' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_LIMPIAR]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_LIMPIAR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_LIMPIAR]
--	Procedimiento	: SIC_SP_CLIENTE_DIRECCION_LIMPIAR
--	Parámetros		:	@cli_c_vdoc_id
--	Descripción		:	Este procedimiento elimina la relacion entre el cliente y 
--						sus direcciones. 
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:37 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11)
AS
DELETE FROM SIC_T_CLI_DIRECCION
WHERE cli_c_vdoc_id=@cli_c_vdoc_id
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_GENERARIDDIRECCION]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_GENERARIDDIRECCION]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_DIRECCION_GENERARIDDIRECCION]
--	Procedimiento	: SIC_SP_CLIENTE_DIRECCION_GENERARIDDIRECCION
--	Parámetros		:	@cli_c_vdoc_id
--	Descripción		: Este procedimiento genera el código de dirección 
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:35 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11)
AS
SELECT COUNT(*) FROM SIC_T_CLI_DIRECCION
WHERE cli_c_vdoc_id=@cli_c_vdoc_id
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_NOMBRECOMERCIAL_LIMPIAR]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_NOMBRECOMERCIAL_LIMPIAR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_NOMBRECOMERCIAL_LIMPIAR]
--	Procedimiento	: ADV_SP_CLIENTE_NOMBRECOMERCIAL_LIMPIAR
--	Parámetros		:	@cli_c_vdoc_id
--	Descripción		:	Este procedimiento elimina la relacion entre el cliente y 
--						nombre comercial. 
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:37 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11)
AS
DELETE FROM SIC_T_CLI_NOMB_COM
WHERE cli_c_vdoc_id=@cli_c_vdoc_id
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_REGISTRAR]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_REGISTRAR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_REGISTRAR]
--	Procedimiento	: ADV_SP_CLIENTE_NOMBRE_REGISTRAR
--	Parámetros		:	@cli_c_vdoc_id
--						@nomb_com_c_iid
--	Descripción		: Este procedimiento registra la relacion entre
--						ruc de cliente y el codigo de nombre comercial				
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:27 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11),
@nomb_com_c_iid int
AS
INSERT INTO SIC_T_CLI_NOMB_COM
VALUES(@nomb_com_c_iid, @cli_c_vdoc_id)
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_ELIMINAR_RELACION]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_ELIMINAR_RELACION]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_ELIMINAR_RELACION]
--	Procedimiento	: SIC_SP_CLIENTE_NOMBRE_ELIMINAR_RELACION
--	Parámetros		:	@cli_c_vdoc_id
--						@nomb_com_c_iid
--	Descripción		: Este procedimiento elimina la relacion entre
--						ruc de cliente y el codigo de nombre comercial				
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:29 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11),
@nomb_com_c_iid int
AS
DELETE FROM SIC_T_CLI_NOMB_COM
WHERE cli_c_vdoc_id=@cli_c_vdoc_id AND
nomb_com_c_iid=@nomb_com_c_iid
' 
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_CONTAR]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_CONTAR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [Mantenimiento].[SIC_SP_CLIENTE_NOMBRE_CONTAR]
--	Procedimiento	: SIC_SP_CLIENTE_NOMBRE_CONTAR
--	Parámetros		:	@cli_c_vdoc_id
--						@nomb_com_c_iid
--	Descripción		: Este procedimiento cuenta la relacion entre
--						ruc de cliente y el codigo de nombre comercial para validar si existen
--	Retorno			:	- 
--	Notas			: N/A
--	Autor			: Lenny Arias Camacho
--	Fecha y Hora	: -
--	Modificaciones	: 17/12/2012 10:29 a.m. se agregó descripción.
@cli_c_vdoc_id VARCHAR(11),
@nomb_com_c_iid int
AS
SELECT COUNT(*) FROM SIC_T_CLI_NOMB_COM
WHERE cli_c_vdoc_id=@cli_c_vdoc_id AND
nomb_com_c_iid=@nomb_com_c_iid
' 
END
GO
/****** Object:  Table [Venta].[SIC_T_BOLETA]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Venta].[SIC_T_BOLETA](
	[bol_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[bol_c_zfecharegistro] [datetime] NOT NULL,
	[bol_c_serie] [varchar](3) NOT NULL,
	[bol_c_numero] [int] NOT NULL,
	[bol_c_iventa] [int] NOT NULL,
	[bol_c_eigv] [decimal](19, 2) NOT NULL,
	[bol_c_eigvcal] [decimal](19, 2) NOT NULL,
	[bol_c_esubtotal] [decimal](19, 2) NOT NULL,
	[bol_c_etotal] [decimal](19, 2) NOT NULL,
	[bol_c_imoneda] [int] NOT NULL,
	[bol_c_vdescmoneda] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SIC_T_BOLETA] PRIMARY KEY CLUSTERED 
(
	[bol_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_REINICIAR_CLIENTE]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_REINICIAR_CLIENTE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_REINICIAR_CLIENTE]
AS
delete from Mantenimiento.SIC_T_CLI_CONTACTO
delete from Mantenimiento.SIC_T_CLI_DIRECCION
delete Mantenimiento.SIC_T_CLI_NOMB_COM
delete MANTENIMIENTO.SIC_T_CLIENTE
delete Mantenimiento.SIC_T_NOMB_COM
delete Mantenimiento.SIC_T_CLI_RS_HISTORICO
' 
END
GO
/****** Object:  Table [Mantenimiento].[SIC_T_VENTA_DETALLE]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE](
	[ven_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[ven_c_iid] [int] NOT NULL,
	[ven_det_c_iitemid] [int] NOT NULL,
	[ven_det_c_ecantidad] [decimal](19, 2) NOT NULL,
	[ven_det_c_epreciounit] [decimal](19, 2) NOT NULL,
	[ven_det_c_epreciototal] [decimal](19, 2) NOT NULL,
	[ven_det_c_iidalmacen] [int] NOT NULL,
 CONSTRAINT [PK_SIC_T_VENTA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[ven_det_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET](
	[odc_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_c_iid] [int] NOT NULL,
	[odc_c_iitemid] [int] NOT NULL,
	[odc_c_ecantidad] [decimal](19, 2) NOT NULL,
	[odc_c_epreciounit] [decimal](19, 2) NOT NULL,
	[odc_c_epreciototal] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_SIC_T_ORDEN_DE_COMPRA_DET_1] PRIMARY KEY CLUSTERED 
(
	[odc_det_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
/****** Object:  Table [Venta].[SIC_T_FACTURA]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA]') AND type in (N'U'))
BEGIN
CREATE TABLE [Venta].[SIC_T_FACTURA](
	[fac_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[fac_c_zfecharegistro] [datetime] NOT NULL,
	[fac_c_serie] [varchar](3) NOT NULL,
	[fac_c_numero] [int] NOT NULL,
	[fac_c_iventa] [int] NOT NULL,
	[fac_c_eigv] [decimal](19, 2) NOT NULL,
	[fac_c_eigvcal] [decimal](19, 2) NOT NULL,
	[fac_c_esubtotal] [decimal](19, 2) NOT NULL,
	[fac_c_etotal] [decimal](19, 2) NOT NULL,
	[fac_c_imoneda] [int] NOT NULL,
	[fac_c_vdescmoneda] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SIC_T_FACTURA] PRIMARY KEY CLUSTERED 
(
	[fac_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]') AND type in (N'U'))
BEGIN
CREATE TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE](
	[mve_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[mve_c_iid] [int] NOT NULL,
	[mve_c_ecant_pedida] [decimal](19, 2) NOT NULL,
	[mve_c_ecant_recibida] [decimal](19, 2) NOT NULL,
	[mve_c_vdescripcion_item] [nvarchar](100) NOT NULL,
	[mve_c_iocdet_id] [int] NOT NULL,
 CONSTRAINT [PK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[mve_det_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
/****** Object:  Table [Venta].[SIC_T_FACTURA_DETALLE]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA_DETALLE]') AND type in (N'U'))
BEGIN
CREATE TABLE [Venta].[SIC_T_FACTURA_DETALLE](
	[fac_det_c_iid] [int] NOT NULL,
	[fac_c_iid] [int] NOT NULL,
	[fac_det_c_iitem] [int] NOT NULL,
	[fac_det_c_ecantidad] [decimal](19, 2) NOT NULL,
	[fac_det_c_epreciounit] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_SIC_T_FACTURA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[fac_det_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
/****** Object:  Table [Venta].[SIC_T_BOLETA_DETALLE]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA_DETALLE]') AND type in (N'U'))
BEGIN
CREATE TABLE [Venta].[SIC_T_BOLETA_DETALLE](
	[bol_det_c_iid] [int] NOT NULL,
	[bol_c_iid] [int] NOT NULL,
	[bol_det_c_iitem] [int] NOT NULL,
	[bol_det_c_ecantidad] [decimal](19, 2) NOT NULL,
	[bol_det_c_epreciounit] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_SIC_T_BOLETA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[bol_det_c_iid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)  
)  
END
GO
/****** Object:  StoredProcedure [Mantenimiento].[SIC_SP_REINICIAR_GENERAL]    Script Date: 02/19/2014 10:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Mantenimiento].[SIC_SP_REINICIAR_GENERAL]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [Mantenimiento].[SIC_SP_REINICIAR_GENERAL]
AS

delete from Mantenimiento.SIC_T_ITEM
delete from Mantenimiento.SIC_T_ITEM_ALMACEN
delete from Mantenimiento.SIC_T_VENTA_DETALLE
delete from Mantenimiento.SIC_T_VENTA
delete from Mantenimiento.SIC_T_ORDEN_DE_COMPRA_DET
delete from Mantenimiento.SIC_T_ORDEN_DE_COMPRA
delete from Mantenimiento.SIC_T_MOVIMIENTO_ENTRADA_DETALLE
delete from Mantenimiento.SIC_T_MOVIMIENTO_ENTRADA
delete from Mantenimiento.SIC_T_ITEM_FAMILIA
delete from Mantenimiento.SIC_T_ITEM_SUB_FAMILIA' 
END
GO
/****** Object:  ForeignKey [FK_SIC_T_MENU_SIC_T_MENU]    Script Date: 02/19/2014 10:27:52 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_MENU_SIC_T_MENU]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_MENU]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MENU_SIC_T_MENU] FOREIGN KEY([menu_c_iid_padre])
REFERENCES [Seguridad].[SIC_T_MENU] ([menu_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_MENU_SIC_T_MENU]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_MENU] CHECK CONSTRAINT [FK_SIC_T_MENU_SIC_T_MENU]
GO
/****** Object:  ForeignKey [FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]    Script Date: 02/19/2014 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]'))
ALTER TABLE [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO] FOREIGN KEY([zona_rep_c_yid])
REFERENCES [Mantenimiento].[SIC_T_ZONA_REPARTO] ([zona_rep_c_yid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR]'))
ALTER TABLE [Mantenimiento].[SIC_T_ZONA_REPARTO_LUGAR] CHECK CONSTRAINT [FK_SIC_T_ZONA_REPARTO_LUGAR_SIC_T_ZONA_REPARTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]'))
ALTER TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN] FOREIGN KEY([alm_cst_c_iid_almacen])
REFERENCES [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]'))
ALTER TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] CHECK CONSTRAINT [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_ALMACEN]
GO
/****** Object:  ForeignKey [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]'))
ALTER TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO] FOREIGN KEY([alm_cst_c_iid_centro_costo])
REFERENCES [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO] ([emp_cst_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[SIC_T_ALMACEN_CENTRO_COSTO]'))
ALTER TABLE [dbo].[SIC_T_ALMACEN_CENTRO_COSTO] CHECK CONSTRAINT [FK_SIC_T_ALMACEN_CENTRO_COSTO_SIC_T_EMP_CENTRO_COSTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_USUARIO_OPCION]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION] FOREIGN KEY([opc_c_iid])
REFERENCES [Seguridad].[SIC_T_OPCION] ([opc_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_USUARIO_OPCION] CHECK CONSTRAINT [FK_SIC_T_USUARIO_OPCION_SIC_T_OPCION]
GO
/****** Object:  ForeignKey [FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_USUARIO_OPCION]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO] FOREIGN KEY([usua_c_cdoc_id])
REFERENCES [Seguridad].[SIC_T_USUARIO] ([usua_c_cdoc_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_USUARIO_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_USUARIO_OPCION] CHECK CONSTRAINT [FK_SIC_T_USUARIO_OPCION_SIC_T_USUARIO]
GO
/****** Object:  ForeignKey [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[General].[FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]') AND parent_object_id = OBJECT_ID(N'[General].[SIC_T_PARAMETRO_DET]'))
ALTER TABLE [General].[SIC_T_PARAMETRO_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO] FOREIGN KEY([par_c_iid])
REFERENCES [General].[SIC_T_PARAMETRO] ([par_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[General].[FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]') AND parent_object_id = OBJECT_ID(N'[General].[SIC_T_PARAMETRO_DET]'))
ALTER TABLE [General].[SIC_T_PARAMETRO_DET] CHECK CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]
GO
/****** Object:  ForeignKey [FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_PROVINCIA]'))
ALTER TABLE [Mantenimiento].[SIC_T_PROVINCIA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO] FOREIGN KEY([depa_c_ccod])
REFERENCES [Mantenimiento].[SIC_T_DEPARTAMENTO] ([depa_c_ccod])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_PROVINCIA]'))
ALTER TABLE [Mantenimiento].[SIC_T_PROVINCIA] CHECK CONSTRAINT [FK_SIC_T_PROVINCIA_SIC_T_DEPARTAMENTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_OPCION]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION] FOREIGN KEY([opc_c_iid])
REFERENCES [Seguridad].[SIC_T_OPCION] ([opc_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_OPCION] CHECK CONSTRAINT [FK_SIC_T_PERFIL_OPCION_SIC_T_OPCION]
GO
/****** Object:  ForeignKey [FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_OPCION]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL] FOREIGN KEY([perf_c_yid])
REFERENCES [Seguridad].[SIC_T_PERFIL] ([perf_c_yid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_OPCION]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_OPCION] CHECK CONSTRAINT [FK_SIC_T_PERFIL_OPCION_SIC_T_PERFIL]
GO
/****** Object:  ForeignKey [FK_SIC_T_PERFIL_MENU_SIC_T_MENU]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_MENU_SIC_T_MENU]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_PERFIL_MENU_SIC_T_MENU] FOREIGN KEY([menu_c_iid])
REFERENCES [Seguridad].[SIC_T_MENU] ([menu_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_MENU_SIC_T_MENU]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] CHECK CONSTRAINT [FK_SIC_T_PERFIL_MENU_SIC_T_MENU]
GO
/****** Object:  ForeignKey [FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL] FOREIGN KEY([perf_c_yid])
REFERENCES [Seguridad].[SIC_T_PERFIL] ([perf_c_yid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Seguridad].[FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]') AND parent_object_id = OBJECT_ID(N'[Seguridad].[SIC_T_PERFIL_MENU]'))
ALTER TABLE [Seguridad].[SIC_T_PERFIL_MENU] CHECK CONSTRAINT [FK_SIC_T_PERFIL_MENU_SIC_T_PERFIL]
GO
/****** Object:  ForeignKey [FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA] FOREIGN KEY([isf_c_ifm_iid])
REFERENCES [Mantenimiento].[SIC_T_ITEM_FAMILIA] ([ifm_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] CHECK CONSTRAINT [FK_SIC_T_ITEM_SUB_FAMILIA_SIC_T_ITEM_FAMILIA]
GO
/****** Object:  ForeignKey [FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMP_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_EMP_DIRECCION]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO] FOREIGN KEY([emp_dir_c_iid_centrocosto])
REFERENCES [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO] ([emp_cst_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_EMP_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_EMP_DIRECCION] CHECK CONSTRAINT [FK_SIC_T_EMP_DIRECCION_SIC_T_EMP_CENTRO_COSTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]'))
ALTER TABLE [Mantenimiento].[SIC_T_COLABORADOR]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA] FOREIGN KEY([colab_area_c_yid])
REFERENCES [Mantenimiento].[SIC_T_COLAB_AREA] ([colab_area_c_yid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]'))
ALTER TABLE [Mantenimiento].[SIC_T_COLABORADOR] CHECK CONSTRAINT [FK_SIC_T_COLABORADOR_SIC_T_COLAB_AREA]
GO
/****** Object:  ForeignKey [FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]    Script Date: 02/19/2014 10:27:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]'))
ALTER TABLE [Mantenimiento].[SIC_T_COLABORADOR]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO] FOREIGN KEY([colab_cargo_c_yid])
REFERENCES [Mantenimiento].[SIC_T_COLAB_CARGO] ([colab_cargo_c_yid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_COLABORADOR]'))
ALTER TABLE [Mantenimiento].[SIC_T_COLABORADOR] CHECK CONSTRAINT [FK_SIC_T_COLABORADOR_SIC_T_COLAB_CARGO]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING] FOREIGN KEY([cli_scor_c_cletra])
REFERENCES [Mantenimiento].[SIC_T_CLI_SCORING] ([cli_scor_c_cletra])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] CHECK CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_CLI_SCORING]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_COLABORADOR] FOREIGN KEY([colab_c_cdoc_id])
REFERENCES [Mantenimiento].[SIC_T_COLABORADOR] ([colab_c_cdoc_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] CHECK CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_COLABORADOR]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO] FOREIGN KEY([zona_rep_c_yid])
REFERENCES [Mantenimiento].[SIC_T_ZONA_REPARTO] ([zona_rep_c_yid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLIENTE]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLIENTE] CHECK CONSTRAINT [FK_SIC_T_CLIENTE_SIC_T_ZONA_REPARTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_DISTRITO]'))
ALTER TABLE [Mantenimiento].[SIC_T_DISTRITO]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_DISTRITO_SIC_T_PROVINCIA] FOREIGN KEY([prov_c_ccod])
REFERENCES [Mantenimiento].[SIC_T_PROVINCIA] ([prov_c_ccod])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_DISTRITO]'))
ALTER TABLE [Mantenimiento].[SIC_T_DISTRITO] CHECK CONSTRAINT [FK_SIC_T_DISTRITO_SIC_T_PROVINCIA]
GO
/****** Object:  ForeignKey [FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1] FOREIGN KEY([itm_c_isf_iid])
REFERENCES [Mantenimiento].[SIC_T_ITEM_SUB_FAMILIA] ([isf_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM] CHECK CONSTRAINT [FK_SIC_T_ITEM_SIC_T_ITEM_SUB_FAMILIA1]
GO
/****** Object:  ForeignKey [FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN] FOREIGN KEY([itm_alm_c_iid_alm])
REFERENCES [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN] CHECK CONSTRAINT [FK_SIC_T_ITEM_ALMACEN_SIC_T_ALMACEN]
GO
/****** Object:  ForeignKey [FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM] FOREIGN KEY([itm_alm_c_iid_item])
REFERENCES [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ITEM_ALMACEN]'))
ALTER TABLE [Mantenimiento].[SIC_T_ITEM_ALMACEN] CHECK CONSTRAINT [FK_SIC_T_ITEM_ALMACEN_SIC_T_ITEM]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE] FOREIGN KEY([odc_c_vdocprov_id])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE] FOREIGN KEY([odc_c_clase_iid])
REFERENCES [Mantenimiento].[SIC_T_ODC_CLASE] ([odc_cla_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_CLASE]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO] FOREIGN KEY([odc_c_iestado])
REFERENCES [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_SIC_T_CLIENTE] FOREIGN KEY([ven_c_vdoccli_id])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] CHECK CONSTRAINT [FK_SIC_T_VENTA_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO] FOREIGN KEY([ven_c_icentrocosto])
REFERENCES [Mantenimiento].[SIC_T_EMP_CENTRO_COSTO] ([emp_cst_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] CHECK CONSTRAINT [FK_SIC_T_VENTA_SIC_T_EMP_CENTRO_COSTO]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_SIC_T_VEN_ESTADO] FOREIGN KEY([ven_c_iestado])
REFERENCES [Mantenimiento].[SIC_T_VEN_ESTADO] ([ven_est_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] CHECK CONSTRAINT [FK_SIC_T_VENTA_SIC_T_VEN_ESTADO]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_NOMB_COM]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_NOMB_COM]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE] FOREIGN KEY([cli_c_vdoc_id])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_NOMB_COM]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_NOMB_COM] CHECK CONSTRAINT [FK_SIC_T_CLI_NOMB_COM_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE] FOREIGN KEY([cli_c_vdoc_id])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION] CHECK CONSTRAINT [FK_SIC_T_CLI_DIRECCION_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO] FOREIGN KEY([dist_c_ccod_ubig])
REFERENCES [Mantenimiento].[SIC_T_DISTRITO] ([dist_c_ccod_ubig])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_DIRECCION]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_DIRECCION] CHECK CONSTRAINT [FK_SIC_T_CLI_DIRECCION_SIC_T_DISTRITO]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO] FOREIGN KEY([cli_contac_cargo_c_yid])
REFERENCES [Mantenimiento].[SIC_T_CLI_CONTAC_CARGO] ([cli_contac_cargo_c_yid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO] CHECK CONSTRAINT [FK_SIC_T_CLI_CONTACTO_SIC_T_CLI_CONTAC_CARGO]
GO
/****** Object:  ForeignKey [FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]    Script Date: 02/19/2014 10:27:55 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE] FOREIGN KEY([cli_c_vdoc_id])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_CLI_CONTACTO]'))
ALTER TABLE [Mantenimiento].[SIC_T_CLI_CONTACTO] CHECK CONSTRAINT [FK_SIC_T_CLI_CONTACTO_SIC_T_CLIENTE]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN] FOREIGN KEY([mve_c_iidalmacen])
REFERENCES [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO] FOREIGN KEY([mve_c_iestado])
REFERENCES [Mantenimiento].[SIC_T_MOV_ESTADO] ([mov_estado_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA] FOREIGN KEY([mve_c_ioc_id])
REFERENCES [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]
GO
/****** Object:  ForeignKey [FK_SIC_T_BOLETA_SIC_T_VENTA]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_BOLETA_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA]'))
ALTER TABLE [Venta].[SIC_T_BOLETA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_BOLETA_SIC_T_VENTA] FOREIGN KEY([bol_c_iventa])
REFERENCES [Mantenimiento].[SIC_T_VENTA] ([ven_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_BOLETA_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA]'))
ALTER TABLE [Venta].[SIC_T_BOLETA] CHECK CONSTRAINT [FK_SIC_T_BOLETA_SIC_T_VENTA]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN] FOREIGN KEY([ven_det_c_iidalmacen])
REFERENCES [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ALMACEN]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM] FOREIGN KEY([ven_det_c_iitemid])
REFERENCES [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]
GO
/****** Object:  ForeignKey [FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA] FOREIGN KEY([ven_c_iid])
REFERENCES [Mantenimiento].[SIC_T_VENTA] ([ven_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_VENTA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM] FOREIGN KEY([odc_c_iitemid])
REFERENCES [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]
GO
/****** Object:  ForeignKey [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA] FOREIGN KEY([odc_c_iid])
REFERENCES [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]'))
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]
GO
/****** Object:  ForeignKey [FK_SIC_T_FACTURA_SIC_T_VENTA]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_FACTURA_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA]'))
ALTER TABLE [Venta].[SIC_T_FACTURA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_FACTURA_SIC_T_VENTA] FOREIGN KEY([fac_c_iventa])
REFERENCES [Mantenimiento].[SIC_T_VENTA] ([ven_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_FACTURA_SIC_T_VENTA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA]'))
ALTER TABLE [Venta].[SIC_T_FACTURA] CHECK CONSTRAINT [FK_SIC_T_FACTURA_SIC_T_VENTA]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA] FOREIGN KEY([mve_c_iid])
REFERENCES [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]
GO
/****** Object:  ForeignKey [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET] FOREIGN KEY([mve_c_iocdet_id])
REFERENCES [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Mantenimiento].[FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]') AND parent_object_id = OBJECT_ID(N'[Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]'))
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]
GO
/****** Object:  ForeignKey [FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA_DETALLE]'))
ALTER TABLE [Venta].[SIC_T_FACTURA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA] FOREIGN KEY([fac_c_iid])
REFERENCES [Venta].[SIC_T_FACTURA] ([fac_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_FACTURA_DETALLE]'))
ALTER TABLE [Venta].[SIC_T_FACTURA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_FACTURA_DETALLE_SIC_T_FACTURA]
GO
/****** Object:  ForeignKey [FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]    Script Date: 02/19/2014 10:27:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA_DETALLE]'))
ALTER TABLE [Venta].[SIC_T_BOLETA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA] FOREIGN KEY([bol_c_iid])
REFERENCES [Venta].[SIC_T_BOLETA] ([bol_c_iid])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Venta].[FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]') AND parent_object_id = OBJECT_ID(N'[Venta].[SIC_T_BOLETA_DETALLE]'))
ALTER TABLE [Venta].[SIC_T_BOLETA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_BOLETA_DETALLE_SIC_T_BOLETA]
GO
