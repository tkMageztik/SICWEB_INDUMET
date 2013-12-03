-- ATENCION, ESTO VA A HACER UN DROP EN LAS TABLAS Y VOLVERLAS A INSERTAR 

USE [SICDBWEB]
GO
ALTER TABLE [General].[SIC_T_PARAMETRO_DET] DROP CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]
GO
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM]    Script Date: 02/12/2013 19:46:42 ******/
DROP TABLE [Mantenimiento].[SIC_T_ITEM]
GO
/****** Object:  Table [General].[SIC_T_PARAMETRO_DET]    Script Date: 02/12/2013 19:46:42 ******/
DROP TABLE [General].[SIC_T_PARAMETRO_DET]
GO
/****** Object:  Table [General].[SIC_T_PARAMETRO]    Script Date: 02/12/2013 19:46:42 ******/
DROP TABLE [General].[SIC_T_PARAMETRO]
GO
/****** Object:  Table [General].[SIC_T_PARAMETRO]    Script Date: 02/12/2013 19:46:42 ******/
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
/****** Object:  Table [General].[SIC_T_PARAMETRO_DET]    Script Date: 02/12/2013 19:46:42 ******/
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
/****** Object:  Table [Mantenimiento].[SIC_T_ITEM]    Script Date: 02/12/2013 19:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (2, N'DOCUMENTO DE IDENTIDAD', 1)
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] OFF
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] ON 

INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 7, N'KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 8, N'LITROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 1, N'DNI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 2, N'CARNE EXTRANJERIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 3, N'RUC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] OFF
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM] ON 

INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio], [par_c_idd], [par_det_c_idd], [itm_c_vpardes], [itm_c_bactivo]) VALUES (1, N'234', N'1', CAST(22.000 AS Decimal(18, 3)), NULL, 7, N'KG', 1)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio], [par_c_idd], [par_det_c_idd], [itm_c_vpardes], [itm_c_bactivo]) VALUES (2, N'1', N'2', CAST(2.000 AS Decimal(18, 3)), NULL, 7, N'KG', 0)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio], [par_c_idd], [par_det_c_idd], [itm_c_vpardes], [itm_c_bactivo]) VALUES (3, N'33', N'33', CAST(33.000 AS Decimal(18, 3)), NULL, 8, N'LITROS', NULL)
INSERT [Mantenimiento].[SIC_T_ITEM] ([itm_c_iid], [itm_c_ccodigo], [itm_c_vdescripcion], [itm_c_dprecio], [par_c_idd], [par_det_c_idd], [itm_c_vpardes], [itm_c_bactivo]) VALUES (4, N'11', N'11', CAST(22.000 AS Decimal(18, 3)), NULL, 8, N'8', 1)
SET IDENTITY_INSERT [Mantenimiento].[SIC_T_ITEM] OFF
ALTER TABLE [General].[SIC_T_PARAMETRO_DET]  WITH CHECK ADD  CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO] FOREIGN KEY([par_c_iid])
REFERENCES [General].[SIC_T_PARAMETRO] ([par_c_iid])
GO
ALTER TABLE [General].[SIC_T_PARAMETRO_DET] CHECK CONSTRAINT [FK_SIC_T_PARAMETRO_DET_SIC_T_PARAMETRO]
GO
