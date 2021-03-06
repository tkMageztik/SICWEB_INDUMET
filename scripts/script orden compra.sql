USE [SICDBWEB_DES]
GO

CREATE TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA](
	[odc_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_c_zfecha] [datetime] NULL,
	[odc_c_ymoneda] [tinyint] NULL,
	[odc_c_ycondiciones] [tinyint] NULL,
	[odc_c_esubtotal] [decimal](17, 4) NULL,
	[odc_c_etotal] [decimal](17, 4) NULL,
	[odc_c_eigv] [decimal](17, 4) NULL,
	[odc_c_eigvcal] [decimal](17, 4) NULL,
	[odc_c_epercepcion] [decimal](17, 4) NULL,
	[odc_c_epercepcioncal] [decimal](17, 4) NULL,
	[odc_c_iestado] [int] NULL,
	[odc_c_vdescmoneda] [varchar](100) NULL,
	[odc_c_bactivo] [bit] NULL,
	[odc_c_vdescestado] [varchar](100) NULL,
	[odc_c_vdocprov_id] [varchar](11) NULL,
 CONSTRAINT [PK_SIC_T_ORDEN_DE_COMPRA] PRIMARY KEY CLUSTERED 
(
	[odc_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET](
	[odc_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[odc_c_iid] [int] NOT NULL,
	[odc_c_iitemid] [int] NOT NULL,
	[odc_c_ecantidad] [decimal](17, 4) NULL,
	[odc_c_eprecio] [decimal](17, 4) NULL,
 CONSTRAINT [PK_SIC_T_ORDEN_DE_COMPRA_DET_1] PRIMARY KEY CLUSTERED 
(
	[odc_det_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE] FOREIGN KEY([odc_c_vdocprov_id])
REFERENCES [Mantenimiento].[SIC_T_CLIENTE] ([cli_c_vdoc_id])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_CLIENTE]
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO] FOREIGN KEY([odc_c_iestado])
REFERENCES [Mantenimiento].[SIC_T_ODC_ESTADO] ([odc_estado_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_SIC_T_ODC_ESTADO]
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM] FOREIGN KEY([odc_c_iitemid])
REFERENCES [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ITEM]
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA] FOREIGN KEY([odc_c_iid])
REFERENCES [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA] ([odc_c_iid])
GO
ALTER TABLE [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] CHECK CONSTRAINT [FK_SIC_T_ORDEN_DE_COMPRA_DET_SIC_T_ORDEN_DE_COMPRA]
GO
