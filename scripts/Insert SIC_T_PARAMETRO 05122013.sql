USE [SICDBWEB_DES]
GO

SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] ON 

GO
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (1, N'UNIDAD DE MEDIDA', 1)
GO
INSERT [General].[SIC_T_PARAMETRO] ([par_c_iid], [par_c_vdesc], [par_c_bactivo]) VALUES (2, N'DOCUMENTO DE IDENTIDAD', 1)
GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO] OFF
GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] ON 

GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 4, N'KG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (1, 5, N'LITROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 1, N'DNI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 2, N'CARNE EXTRANJERIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [General].[SIC_T_PARAMETRO_DET] ([par_c_iid], [par_det_c_iid], [par_det_c_vdesc], [par_det_c_vcampo_1], [par_det_c_vcampo_desc_1], [par_det_c_vcampo_2], [par_det_c_vcampo_desc_2], [par_det_c_vcampo_3], [par_det_c_vcampo_desc_3], [par_det_c_vcampo_4], [par_det_c_vcampo_desc_4], [par_det_c_vcampo_5], [par_det_c_vcampo_desc_5], [par_det_c_vobs]) VALUES (2, 3, N'RUC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [General].[SIC_T_PARAMETRO_DET] OFF
GO
