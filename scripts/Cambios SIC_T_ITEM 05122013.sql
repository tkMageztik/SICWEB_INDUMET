-- Este script contiene tres partes, 
-- la primera modifica la tabla desde la versiona anterior a la nueva.
-- la segunda es el script para crear la tabla
-- la tercera son los datos de la tabla

-- Actualizar la tabla SIC_T_ITEM de la versiona nterior
use SICDBWEB_DES
go

alter table Mantenimiento.SIC_T_ITEM
	drop column par_c_idd 
go

alter table Mantenimiento.SIC_T_ITEM
	add unique(itm_c_ccodigo)
go	

alter table Mantenimiento.SIC_T_ITEM
	alter column par_det_c_idd tinyint
go

alter table Mantenimiento.SIC_T_ITEM
	alter column itm_c_vdescripcion nvarchar(250)
go

alter table Mantenimiento.SIC_T_ITEM
	alter column itm_c_dprecio decimal(17,4)
go

sp_RENAME 'Mantenimiento.SIC_T_ITEM.par_det_c_idd', 'itm_c_yumedida' , 'COLUMN'


-- Script de la tabla
use SICDBWEB_DES
go

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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[itm_c_ccodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

