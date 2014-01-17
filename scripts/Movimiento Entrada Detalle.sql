USE [SICDBWEB_DES]
GO

CREATE TABLE [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA_DETALLE](
	[mve_det_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[mve_c_iid] [int] NULL,
	[mve_c_ecant_pedida] [decimal](17, 4) NULL,
	[mve_c_ecant_recibida] [decimal](17, 4) NULL,
	[mve_c_vdescripcion_item] [nvarchar](100) NULL,
	[mve_c_iid_det] [nchar](10) NULL,
	[mve_c_iocdet_id] [int] NULL,
 CONSTRAINT [PK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE] PRIMARY KEY CLUSTERED ( [mve_det_c_iid] ASC ),
 CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_MOVIMIENTO_ENTRADA] FOREIGN KEY([mve_c_iid]) REFERENCES [Mantenimiento].[SIC_T_MOVIMIENTO_ENTRADA] ([mve_c_iid]),
 CONSTRAINT [FK_SIC_T_MOVIMIENTO_ENTRADA_DETALLE_SIC_T_ORDEN_DE_COMPRA_DET] FOREIGN KEY([mve_c_iocdet_id]) REFERENCES [Mantenimiento].[SIC_T_ORDEN_DE_COMPRA_DET] ([odc_det_c_iid]),
) ON [PRIMARY]



