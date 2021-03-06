-- ATENCION, ESTO VA A HACER UN DROP EN LAS TABLAS Y VOLVERLAS A INSERTAR 

USE [SICDBWEB_DES]

CREATE TABLE [Mantenimiento].[SIC_T_ITEM](
	[itm_c_iid] [int] IDENTITY(1,1) NOT NULL,
	[itm_c_ccodigo] [nvarchar](100) NULL,
	[itm_c_vdescripcion] [nvarchar](100) NULL,
	[itm_c_dprecio] [decimal](18, 3) NULL,
	[par_c_idd] [int] NULL,
	[par_det_c_idd] [int] NULL,
	[itm_c_vpardes] [nvarchar](100) NULL,
	[itm_c_bactivo] [bit] NULL,
 CONSTRAINT [PK_SIC_T_ITEM] PRIMARY KEY CLUSTERED 
(
	[itm_c_iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] ON 

INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (1, N'UNIDAD DE MEDIDA', 1)
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] OFF

SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] ON 

INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 7, N'KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 8, N'LITROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] OFF
