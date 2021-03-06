USE [SICDBWEB_DES]
GO
/****** Object:  Table [General].[SIC_T_PARAMETRO]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [General].[SIC_T_PARAMETRO](
	[par_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[par_c_vdesc] [varchar](100) NULL,
	[par_c_bactivo] [bit] NULL,
 CONSTRAINT [PK_SIC_T_PARAMETRO] PRIMARY KEY CLUSTERED 
(
	[par_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [General].[SIC_T_PARAMETRO_DET]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ALMACEN]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_ALMACEN](
	[alm_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[alm_c_bactivo] [bit] NULL,
	[alm_c_vdes] [varchar](50) NULL,
 CONSTRAINT [PK_SIC_T_ALMACEN] PRIMARY KEY CLUSTERED 
(
	[alm_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_IGV]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_IGV](
	[igv_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[igv_c_eigv] [decimal](17, 4) NULL,
	[igv_c_dinicio] [datetime] NULL,
	[igv_c_dfin] [datetime] NULL,
 CONSTRAINT [PK_SIC_T_IGV] PRIMARY KEY CLUSTERED 
(
	[igv_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_ITEM](
	[itm_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[itm_c_ccodigo] [nvarchar](100) NULL,
	[itm_c_vdescripcion] [nvarchar](100) NULL,
	[itm_c_dprecio] [decimal](18, 3) NULL,
	[itm_c_yumedida] [tinyint] NULL,
	[itm_c_vpardes] [nvarchar](100) NULL,
	[itm_c_bactivo] [bit] NULL,
 CONSTRAINT [PK_SIC_T_ITEM] PRIMARY KEY CLUSTERED 
(
	[itm_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOV_ESTADO]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_MOV_ESTADO](
	[mov_estado_iid] [int] IDENTITY(1,1) NOT NULL,
	[mov_estado_vdescrpcion] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_MOV_ESTADO] PRIMARY KEY CLUSTERED 
(
	[mov_estado_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA](
	[mve_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[mve_c_ioc_id] [int] NULL,
	[mve_c_vguiaserie] [varchar](10) NULL,
	[mve_c_vfacturaserie] [varchar](10) NULL,
	[mve_c_vfacturanumero] [varchar](10) NULL,
	[mve_c_vguianumero] [nvarchar](10) NULL,
	[mve_c_dguiafecha] [datetime] NULL,
	[mve_c_iidalmacen] [int] NULL,
	[mve_c_vdoc_id_prov] [varchar](11) NULL,
	[mve_c_bactivo] [bit] NULL,
	[mve_c_dfecha] [datetime] NULL,
	[mve_c_iestado] [int] NULL,
	[mve_c_vdesestado] [nvarchar](100) NULL,
 CONSTRAINT [PK_SIC_T_MOVIMIENTO_ENTRADA] PRIMARY KEY CLUSTERED 
(
	[mve_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE](
	[mve_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[mve_c_iid] [int] NULL,
	[mve_c_ecant_pedida] [decimal](17, 4) NULL,
	[mve_c_ecant_recibida] [decimal](17, 4) NULL,
	[mve_c_vdescripcion_item] [nvarchar](100) NULL,
	[mve_c_iid_det] [nchar](10) NULL,
	[mve_c_iocdet_id] [int] NULL,
 CONSTRAINT [PK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[mve_det_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA](
	[mvs_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[mvs_c_dfecha] [datetime] NULL,
	[mvs_c_ialmacen] [int] NULL,
	[mvs_c_valmacen_des] [varchar](100) NULL,
	[mvs_c_itipodoc] [int] NULL,
	[mvs_c_vtipodoc] [varchar](100) NULL,
	[mvs_c_vinmueble] [varchar](100) NULL,
	[msv_c_icentrocosto] [int] NULL,
	[msv_c_vcentrocosto_des] [varchar](100) NULL,
	[mvs_c_bactivo] [bit] NULL,
 CONSTRAINT [PK_SIC_T_MOVIMIENTO_SALIDA] PRIMARY KEY CLUSTERED 
(
	[mvs_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA_DETALLE]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA_DETALLE](
	[mvs_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[mvs_c_iid] [int] NULL,
	[mvs_det_c_iitemid] [int] NULL,
	[mvs_det_ecantidad] [decimal](17, 4) NULL,
	[mvs_det_dprecio] [decimal](17, 4) NULL,
 CONSTRAINT [PK_SIC_T_MOVIMIENTO_SALIDA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[mvs_det_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mantenimiento].[SIC_T_ODC_ESTADO]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_ODC_ESTADO](
	[odc_estado_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_estado_vdescripcion] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_ODC_ESTADO] PRIMARY KEY CLUSTERED 
(
	[odc_estado_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA](
	[odc_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_c_zfecha] [datetime] NULL,
	[odc_c_ymoneda] [tinyint] NULL,
	[ocd_c_ycondiciones] [tinyint] NULL,
	[ocd_c_esubtotal] [decimal](17, 4) NULL,
	[ocd_c_etotal] [decimal](17, 4) NULL,
	[ocd_c_eigv] [decimal](17, 4) NULL,
	[ocd_c_eigvcal] [decimal](17, 4) NULL,
	[ocd_c_epercepcion] [decimal](17, 4) NULL,
	[ocd_c_epercepcioncal] [decimal](17, 4) NULL,
	[ocd_c_iestado] [int] NULL,
	[ocd_c_vdescmoneda] [varchar](100) NULL,
	[ocd_c_bactivo] [bit] NULL,
	[ocd_c_vdescestado] [varchar](100) NULL,
	[ocd_c_vdocprov_id] [varchar](11) NULL,
 CONSTRAINT [PK_SIC_T_ORDEN_DE_COMPRA] PRIMARY KEY CLUSTERED 
(
	[odc_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET](
	[odc_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_c_iid] [int] NOT NULL,
	[ocd_c_iitemid] [int] NOT NULL,
	[ocd_c_ecantidad] [decimal](17, 4) NULL,
	[ocd_c_eprecio] [decimal](17, 4) NULL,
 CONSTRAINT [PK_SIC_T_ORDEN_DE_COMPRA_DET_1] PRIMARY KEY CLUSTERED 
(
	[odc_det_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mantenimiento].[SIC_T_TASA_CAMBIO]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_TASA_CAMBIO](
	[tsc_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[tsc_c_ecompra] [decimal](17, 4) NULL,
	[tsc_c_eventa] [decimal](17, 4) NULL,
	[tsc_c_dinicio] [datetime] NULL,
	[tsc_c_dfin] [datetime] NULL,
 CONSTRAINT [PK_SIC_T_TASA_CAMBIO] PRIMARY KEY CLUSTERED 
(
	[tsc_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mantenimiento].[SIC_T_VENTA]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_VENTA](
	[ven_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[ven_c_zfecha] [datetime] NULL,
	[ven_c_ymoneda] [tinyint] NULL,
	[ven_c_ycondiciones] [tinyint] NULL,
	[ven_c_dsubtotal] [decimal](17, 4) NULL,
	[ven_c_dtotal] [decimal](17, 4) NULL,
	[ven_c_vdoccli_id] [varchar](11) NULL,
	[ven_c_digv] [decimal](17, 4) NULL,
	[ven_c_digvcal] [decimal](17, 4) NULL,
	[ven_c_dpercepcion] [decimal](17, 4) NULL,
	[ven_c_dpercepcioncal] [decimal](17, 4) NULL,
	[ven_c_itipodoc] [int] NULL,
	[ven_c_vdescmoneda] [varchar](100) NULL,
	[ven_c_bactivo] [bit] NULL,
	[ven_c_vdestipodoc] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_VENTA] PRIMARY KEY CLUSTERED 
(
	[ven_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_VENTA_DETALLE]    Script Date: 17/01/2014 10:56:05 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE](
	[ven_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[ven_c_iid] [int] NOT NULL,
	[ven_det_c_iitemid] [int] NOT NULL,
	[ven_det_c_ecantidad] [decimal](17, 4) NULL,
	[ven_det_c_eprecio] [decimal](17, 4) NULL,
 CONSTRAINT [PK_SIC_T_VENTA_DETALLE] PRIMARY KEY CLUSTERED 
(
	[ven_det_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] ON 

INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (1, N'UNIDAD DE MEDIDA', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (2, N'DOCUMENTO DE IDENTIDAD', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (3, N'IGV', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (4, N'PERCEPCION', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (5, N'MONEDA', 1)
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (6, N'DOCUMENTO VENTA', 1)
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] OFF
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] ON 

INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 7, N'KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 8, N'LITROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ALMACEN] ON 

INSERT [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid], [alm_c_bactivo], [alm_c_vdes]) VALUES (1, 1, N'ALMACEN PRINCIPAL')
INSERT [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid], [alm_c_bactivo], [alm_c_vdes]) VALUES (3, 1, N'ALMACEN PRINCIPAL')
INSERT [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid], [alm_c_bactivo], [alm_c_vdes]) VALUES (7, 1, N'ALMACEN PRINCIPAL')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ALMACEN] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM] ON 

INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo]) VALUES (1, N'1234', N'tste', CAST(20.000 AS Decimal(18, 3)), 7, N'7', 0)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo]) VALUES (2, N'22', N'22', CAST(66.000 AS Decimal(18, 3)), 7, N'KG', 1)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio], [itm_c_yumedida], [itm_c_vpardes], [itm_c_bactivo]) VALUES (3, N'FDAS', N'FDAS', CAST(22.000 AS Decimal(18, 3)), 8, N'LITROS', 1)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] ON 

INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] ([mov_estado_iid], [mov_estado_vdescrpcion]) VALUES (1, N'REGISTRADO')
INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] ([mov_estado_iid], [mov_estado_vdescrpcion]) VALUES (2, N'POR REGULARZAR')
INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] ([mov_estado_iid], [mov_estado_vdescrpcion]) VALUES (3, N'CERRADO')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_MOV_ESTADO] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ON 

INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid], [mve_c_ioc_id], [mve_c_vguiaserie], [mve_c_vfacturaserie], [mve_c_vfacturanumero], [mve_c_vguianumero], [mve_c_dguiafecha], [mve_c_iidalmacen], [mve_c_vdoc_id_prov], [mve_c_bactivo], [mve_c_dfecha], [mve_c_iestado], [mve_c_vdesestado]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A2AB012277D6 AS DateTime), NULL, NULL)
INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid], [mve_c_ioc_id], [mve_c_vguiaserie], [mve_c_vfacturaserie], [mve_c_vfacturanumero], [mve_c_vguianumero], [mve_c_dguiafecha], [mve_c_iidalmacen], [mve_c_vdoc_id_prov], [mve_c_bactivo], [mve_c_dfecha], [mve_c_iestado], [mve_c_vdesestado]) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A2AB01677CE2 AS DateTime), NULL, NULL)
INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid], [mve_c_ioc_id], [mve_c_vguiaserie], [mve_c_vfacturaserie], [mve_c_vfacturanumero], [mve_c_vguianumero], [mve_c_dguiafecha], [mve_c_iidalmacen], [mve_c_vdoc_id_prov], [mve_c_bactivo], [mve_c_dfecha], [mve_c_iestado], [mve_c_vdesestado]) VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(0x0000A2AB01677E48 AS DateTime), NULL, NULL)
INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid], [mve_c_ioc_id], [mve_c_vguiaserie], [mve_c_vfacturaserie], [mve_c_vfacturanumero], [mve_c_vguianumero], [mve_c_dguiafecha], [mve_c_iidalmacen], [mve_c_vdoc_id_prov], [mve_c_bactivo], [mve_c_dfecha], [mve_c_iestado], [mve_c_vdesestado]) VALUES (4, NULL, N'11', N'11', N'11', N'11', CAST(0x0000A35B00000000 AS DateTime), NULL, NULL, 1, CAST(0x0000A2AC017F3195 AS DateTime), NULL, NULL)
INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid], [mve_c_ioc_id], [mve_c_vguiaserie], [mve_c_vfacturaserie], [mve_c_vfacturanumero], [mve_c_vguianumero], [mve_c_dguiafecha], [mve_c_iidalmacen], [mve_c_vdoc_id_prov], [mve_c_bactivo], [mve_c_dfecha], [mve_c_iestado], [mve_c_vdesestado]) VALUES (6, 7, N'22', N'222', N'222', N'222', CAST(0x0000A2B500000000 AS DateTime), 3, NULL, 1, CAST(0x0000A2AD000FAC59 AS DateTime), NULL, NULL)
INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid], [mve_c_ioc_id], [mve_c_vguiaserie], [mve_c_vfacturaserie], [mve_c_vfacturanumero], [mve_c_vguianumero], [mve_c_dguiafecha], [mve_c_iidalmacen], [mve_c_vdoc_id_prov], [mve_c_bactivo], [mve_c_dfecha], [mve_c_iestado], [mve_c_vdesestado]) VALUES (10, 7, N'w', N'w', N'w', N'w', CAST(0x0000A2B500000000 AS DateTime), 7, NULL, 1, CAST(0x0000A2AD002B9676 AS DateTime), 3, N'CERRADO')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] ON 

INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] ([mve_det_c_iid], [mve_c_iid], [mve_c_ecant_pedida], [mve_c_ecant_recibida], [mve_c_vdescripcion_item], [mve_c_iid_det], [mve_c_iocdet_id]) VALUES (2, 10, CAST(1.0000 AS Decimal(17, 4)), CAST(11.0000 AS Decimal(17, 4)), N'22', NULL, 10)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ON 

INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (1, N'PLANEADA')
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (2, N'ABIERTA')
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (3, N'CERRADA')
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (4, N'VENCIDA')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ON 

INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid], [odc_c_zfecha], [odc_c_ymoneda], [ocd_c_ycondiciones], [ocd_c_esubtotal], [ocd_c_etotal], [ocd_c_eigv], [ocd_c_eigvcal], [ocd_c_epercepcion], [ocd_c_epercepcioncal], [ocd_c_iestado], [ocd_c_vdescmoneda], [ocd_c_bactivo], [ocd_c_vdescestado], [ocd_c_vdocprov_id]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid], [odc_c_zfecha], [odc_c_ymoneda], [ocd_c_ycondiciones], [ocd_c_esubtotal], [ocd_c_etotal], [ocd_c_eigv], [ocd_c_eigvcal], [ocd_c_epercepcion], [ocd_c_epercepcioncal], [ocd_c_iestado], [ocd_c_vdescmoneda], [ocd_c_bactivo], [ocd_c_vdescestado], [ocd_c_vdocprov_id]) VALUES (2, CAST(0x0000A29400000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid], [odc_c_zfecha], [odc_c_ymoneda], [ocd_c_ycondiciones], [ocd_c_esubtotal], [ocd_c_etotal], [ocd_c_eigv], [ocd_c_eigvcal], [ocd_c_epercepcion], [ocd_c_epercepcioncal], [ocd_c_iestado], [ocd_c_vdescmoneda], [ocd_c_bactivo], [ocd_c_vdescestado], [ocd_c_vdocprov_id]) VALUES (4, CAST(0x0000A28C00000000 AS DateTime), 12, NULL, CAST(88.0000 AS Decimal(17, 4)), CAST(103.8400 AS Decimal(17, 4)), CAST(0.1800 AS Decimal(17, 4)), CAST(15.8400 AS Decimal(17, 4)), CAST(0.0200 AS Decimal(17, 4)), CAST(0.0000 AS Decimal(17, 4)), 3, N'SOLES', 1, NULL, NULL)
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid], [odc_c_zfecha], [odc_c_ymoneda], [ocd_c_ycondiciones], [ocd_c_esubtotal], [ocd_c_etotal], [ocd_c_eigv], [ocd_c_eigvcal], [ocd_c_epercepcion], [ocd_c_epercepcioncal], [ocd_c_iestado], [ocd_c_vdescmoneda], [ocd_c_bactivo], [ocd_c_vdescestado], [ocd_c_vdocprov_id]) VALUES (5, CAST(0x0000A2BC00000000 AS DateTime), 15, NULL, CAST(510.4000 AS Decimal(17, 4)), CAST(617.5840 AS Decimal(17, 4)), CAST(0.1900 AS Decimal(17, 4)), CAST(96.9760 AS Decimal(17, 4)), CAST(0.0200 AS Decimal(17, 4)), CAST(10.2080 AS Decimal(17, 4)), 1, N'DOLARES', 1, N'PLANEADA', N'12345543266')
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid], [odc_c_zfecha], [odc_c_ymoneda], [ocd_c_ycondiciones], [ocd_c_esubtotal], [ocd_c_etotal], [ocd_c_eigv], [ocd_c_eigvcal], [ocd_c_epercepcion], [ocd_c_epercepcioncal], [ocd_c_iestado], [ocd_c_vdescmoneda], [ocd_c_bactivo], [ocd_c_vdescestado], [ocd_c_vdocprov_id]) VALUES (6, CAST(0x0000A29400000000 AS DateTime), 12, NULL, CAST(154.0000 AS Decimal(17, 4)), CAST(181.7200 AS Decimal(17, 4)), CAST(0.1800 AS Decimal(17, 4)), CAST(27.7200 AS Decimal(17, 4)), CAST(0.0200 AS Decimal(17, 4)), CAST(0.0000 AS Decimal(17, 4)), 3, N'SOLES', 1, N'PLANEADA', NULL)
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid], [odc_c_zfecha], [odc_c_ymoneda], [ocd_c_ycondiciones], [ocd_c_esubtotal], [ocd_c_etotal], [ocd_c_eigv], [ocd_c_eigvcal], [ocd_c_epercepcion], [ocd_c_epercepcioncal], [ocd_c_iestado], [ocd_c_vdescmoneda], [ocd_c_bactivo], [ocd_c_vdescestado], [ocd_c_vdocprov_id]) VALUES (7, CAST(0x0000A29400000000 AS DateTime), 15, NULL, CAST(167.2000 AS Decimal(17, 4)), CAST(198.9680 AS Decimal(17, 4)), CAST(0.1900 AS Decimal(17, 4)), CAST(31.7680 AS Decimal(17, 4)), CAST(0.0200 AS Decimal(17, 4)), CAST(0.0000 AS Decimal(17, 4)), 1, N'DOLARES', 1, N'PLANEADA', N'12345543266')
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid], [odc_c_zfecha], [odc_c_ymoneda], [ocd_c_ycondiciones], [ocd_c_esubtotal], [ocd_c_etotal], [ocd_c_eigv], [ocd_c_eigvcal], [ocd_c_epercepcion], [ocd_c_epercepcioncal], [ocd_c_iestado], [ocd_c_vdescmoneda], [ocd_c_bactivo], [ocd_c_vdescestado], [ocd_c_vdocprov_id]) VALUES (8, CAST(0x0000A2AA00000000 AS DateTime), 12, NULL, CAST(286.0000 AS Decimal(17, 4)), CAST(340.3400 AS Decimal(17, 4)), CAST(0.1900 AS Decimal(17, 4)), CAST(54.3400 AS Decimal(17, 4)), CAST(0.0200 AS Decimal(17, 4)), CAST(0.0000 AS Decimal(17, 4)), 1, N'SOLES', 0, N'PLANEADA', N'12345543266')
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ON 

INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (1, 1, 2, CAST(1.0000 AS Decimal(17, 4)), CAST(66.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (2, 2, 2, CAST(1.0000 AS Decimal(17, 4)), CAST(66.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (3, 2, 3, CAST(1.0000 AS Decimal(17, 4)), CAST(22.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (4, 4, 2, CAST(1.0000 AS Decimal(17, 4)), CAST(66.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (5, 4, 3, CAST(1.0000 AS Decimal(17, 4)), CAST(22.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (7, 5, 3, CAST(23.2000 AS Decimal(17, 4)), CAST(510.4000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (8, 6, 2, CAST(1.0000 AS Decimal(17, 4)), CAST(66.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (10, 7, 2, CAST(2.2000 AS Decimal(17, 4)), CAST(145.2000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (11, 8, 2, CAST(4.0000 AS Decimal(17, 4)), CAST(264.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (16, 8, 3, CAST(1.0000 AS Decimal(17, 4)), CAST(22.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid], [odc_c_iid], [ocd_c_iitemid], [ocd_c_ecantidad], [ocd_c_eprecio]) VALUES (17, 7, 3, CAST(1.0000 AS Decimal(17, 4)), CAST(22.0000 AS Decimal(17, 4)))
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_VENTA] ON 

INSERT [Mantenimiento].[SIC_T_VENTA] ([ven_c_iid], [ven_c_zfecha], [ven_c_ymoneda], [ven_c_ycondiciones], [ven_c_dsubtotal], [ven_c_dtotal], [ven_c_vdoccli_id], [ven_c_digv], [ven_c_digvcal], [ven_c_dpercepcion], [ven_c_dpercepcioncal], [ven_c_itipodoc], [ven_c_vdescmoneda], [ven_c_bactivo], [ven_c_vdestipodoc]) VALUES (3, CAST(0x0000A2BD00000000 AS DateTime), 12, NULL, CAST(270.6000 AS Decimal(17, 4)), CAST(322.0140 AS Decimal(17, 4)), N'12345543266', CAST(0.1900 AS Decimal(17, 4)), CAST(51.4140 AS Decimal(17, 4)), CAST(0.0200 AS Decimal(17, 4)), CAST(0.0000 AS Decimal(17, 4)), NULL, N'SOLES', 1, NULL)
INSERT [Mantenimiento].[SIC_T_VENTA] ([ven_c_iid], [ven_c_zfecha], [ven_c_ymoneda], [ven_c_ycondiciones], [ven_c_dsubtotal], [ven_c_dtotal], [ven_c_vdoccli_id], [ven_c_digv], [ven_c_digvcal], [ven_c_dpercepcion], [ven_c_dpercepcioncal], [ven_c_itipodoc], [ven_c_vdescmoneda], [ven_c_bactivo], [ven_c_vdestipodoc]) VALUES (4, CAST(0x0000A2B400000000 AS DateTime), 12, NULL, CAST(66.0000 AS Decimal(17, 4)), CAST(78.5400 AS Decimal(17, 4)), N'12345543266', CAST(0.1900 AS Decimal(17, 4)), CAST(12.5400 AS Decimal(17, 4)), CAST(0.0200 AS Decimal(17, 4)), CAST(0.0000 AS Decimal(17, 4)), NULL, N'SOLES', 1, NULL)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_VENTA] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_VENTA_DETALLE] ON 

INSERT [Mantenimiento].[SIC_T_VENTA_DETALLE] ([ven_det_c_iid], [ven_c_iid], [ven_det_c_iitemid], [ven_det_c_ecantidad], [ven_det_c_eprecio]) VALUES (1, 3, 2, CAST(3.1000 AS Decimal(17, 4)), CAST(204.6000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_VENTA_DETALLE] ([ven_det_c_iid], [ven_c_iid], [ven_det_c_iitemid], [ven_det_c_ecantidad], [ven_det_c_eprecio]) VALUES (2, 3, 3, CAST(3.0000 AS Decimal(17, 4)), CAST(66.0000 AS Decimal(17, 4)))
INSERT [Mantenimiento].[SIC_T_VENTA_DETALLE] ([ven_det_c_iid], [ven_c_iid], [ven_det_c_iitemid], [ven_det_c_ecantidad], [ven_det_c_eprecio]) VALUES (3, 4, 2, CAST(1.0000 AS Decimal(17, 4)), CAST(66.0000 AS Decimal(17, 4)))
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_VENTA_DETALLE] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SIC_T_IT__28CD5C006EF57B66]    Script Date: 17/01/2014 10:56:05 a.m. ******/
ALTER TABLE [Mantenimiento].[SIC_T_ITEM] ADD UNIQUE NONCLUSTERED 
(
	[itm_c_ccodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [General].[SIC_T_PARAMETRO_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO] FOREIGN KEY([par_c_iid])
REFERENCES [General].[SIC_T_PARAMETRO] ([par_c_iid])
GO
ALTER TABLE [General].[SIC_T_PARAMETRO_DET] CHECK CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN] FOREIGN KEY([mve_c_iidalmacen])
REFERENCES [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ALMACEN]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_CLIENTE] FOREIGN KEY([mve_c_vdoc_id_prov])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_CLIENTE]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO] FOREIGN KEY([mve_c_iestado])
REFERENCES [Mantenimiento].[SIC_T_MOV_ESTADO] ([mov_estado_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_MOV_ESTADO]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA] FOREIGN KEY([mve_c_ioc_id])
REFERENCES [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_SIC_T_ORDEN_DE_COMPRA]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA] FOREIGN KEY([mve_c_iid])
REFERENCES [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET] FOREIGN KEY([mve_c_iocdet_id])
REFERENCES [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_SALIDA_SIC_T_ALMACEN] FOREIGN KEY([mvs_c_ialmacen])
REFERENCES [Mantenimiento].[SIC_T_ALMACEN] ([alm_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_SALIDA_SIC_T_ALMACEN]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_SALIDA_DETALLE_SIC_T_ITEM] FOREIGN KEY([mvs_c_iid])
REFERENCES [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_SALIDA_DETALLE_SIC_T_ITEM]
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_MOVIMIENTO_SALIDA_DETALLE_SIC_T_MOVIMIENTO_SALIDA] FOREIGN KEY([mvs_c_iid])
REFERENCES [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA] ([mvs_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_SALIDA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_MOVIMIENTO_SALIDA_DETALLE_SIC_T_MOVIMIENTO_SALIDA]
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE] FOREIGN KEY([ocd_c_vdocprov_id])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO] FOREIGN KEY([ocd_c_iestado])
REFERENCES [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM] FOREIGN KEY([ocd_c_iitemid])
REFERENCES [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA] FOREIGN KEY([odc_c_iid])
REFERENCES [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]
GO
ALTER TABLE [Mantenimiento].[SIC_T_VENTA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_SIC_T_CLIENTE] FOREIGN KEY([ven_c_vdoccli_id])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
ALTER TABLE [Mantenimiento].[SIC_T_VENTA] CHECK CONSTRAINT [FK_SIC_T_VENTA_SIC_T_CLIENTE]
GO
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM] FOREIGN KEY([ven_det_c_iitemid])
REFERENCES [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_ITEM]
GO
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA] FOREIGN KEY([ven_c_iid])
REFERENCES [Mantenimiento].[SIC_T_VENTA] ([ven_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_VENTA_DETALLE] CHECK CONSTRAINT [FK_SIC_T_VENTA_DETALLE_SIC_T_VENTA]
GO
