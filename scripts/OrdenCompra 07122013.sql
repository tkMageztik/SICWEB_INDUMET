USE [SICDBWEB_DES]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ODC_ESTADO]    Script Date: 07/12/2013 5:38:02 ******/
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
/****** Object:  Table [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]    Script Date: 07/12/2013 5:38:02 ******/
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
	[ocd_c_dsubtotal] [decimal](17, 4) NULL,
	[ocd_c_dtotal] [decimal](17, 4) NULL,
	[ocd_c_vdocprov_id] [nvarchar](20) NULL,
	[ocd_c_digv] [decimal](17, 4) NULL,
	[ocd_c_digvcal] [decimal](17, 4) NULL,
	[ocd_c_dpercepcion] [decimal](17, 4) NULL,
	[ocd_c_dpercepcioncal] [decimal](17, 4) NULL,
	[ocd_c_iestado] [int] NULL,
	[ocd_c_vdescmoneda] [varchar](100) NULL,
	[ocd_c_bactivo] [bit] NULL,
	[ocd_c_vdescestado] [varchar](100) NULL,
 CONSTRAINT [PK_SIC_T_ORDEN_DE_COMPRA] PRIMARY KEY CLUSTERED 
(
	[odc_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]    Script Date: 07/12/2013 5:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET](
	[odc_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_c_iid] [int] NOT NULL,
	[ocd_c_iitemid] [int] NOT NULL,
	[ocd_c_icantidad] [int] NULL,
	[ocd_c_dprecio] [decimal](17, 4) NULL,
 CONSTRAINT [PK_SIC_T_ORDEN_DE_COMPRA_DET] PRIMARY KEY CLUSTERED 
(
	[odc_det_c_iid] ASC,
	[odc_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] ON 

GO
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (3, N'IGV', 1)
GO
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (4, N'PERCEPCION', 1)
GO
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (5, N'MONEDA', 1)
GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] OFF
GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] ON 

GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (3, 9, N'IGV', N'0.18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (4, 11, N'PERCEPCION', N'0.02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (4, 16, N'MINIMO PARA CALCULO', N'500.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (5, 12, N'SOLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (5, 15, N'DOLARES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] OFF
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM] ON 


GO
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (1, N'PLANEADA')
GO
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (2, N'ABIERTA')
GO
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (3, N'CERRADA')
GO
INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid], [odc_estado_vdescripcion]) VALUES (4, N'VENCIDA')
GO
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ODC_ESTADO] OFF
GO

SET ANSI_PADDING ON

GO

/****** Object:  Table [Mantenimiento].[SIC_T_PROVEEDOR]    Script Date: 09/12/2013 1:51:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mantenimiento].[SIC_T_PROVEEDOR](
	[pro_c_vdoc_id] [nvarchar](20) NOT NULL,
	[pro_c_vraz_soc] [nvarchar](200) NULL,
 CONSTRAINT [PK_SIC_T_PROVEEDOR] PRIMARY KEY CLUSTERED 
(
	[pro_c_vdoc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_PROVEEDOR] FOREIGN KEY([ocd_c_vdocprov_id])
REFERENCES [Mantenimiento].[SIC_T_PROVEEDOR] ([pro_c_vdoc_id])
GO

/****** Object:  Index [UQ__SIC_T_IT__28CD5C006EF57B66]    Script Date: 07/12/2013 5:38:02 ******/

ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO] FOREIGN KEY([ocd_c_iestado])
REFERENCES [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_PROVEEDOR] FOREIGN KEY([ocd_c_vdocprov_id])
REFERENCES [Mantenimiento].[SIC_T_PROVEEDOR] ([pro_c_vdoc_id])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_PROVEEDOR]
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
