//---------------------------------------------------------------------------------------------------------------
//Creado: Jonnathan De La Barra			Fecha: 19/09/2012
//Descripción: Se creó para la implementación de los Enums.
//Modificado: Lenny Arias Camacho 		Fecha Modificación: 28/11/2012
//Descripción de la modificación: Se agrego estados de contrato
//Modificado: Nombre y Apellido 		Fecha Modificación:
//Descripción de la modificación:
//---------------------------------------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIC.Data
{
    public enum Calificacion
    {
        POSITIVO,
        REGULAR,
        NEGATIVO
    }
    public enum TipoConcepto
    {
        PROPIETARIO,
        ADMINISTRADOR,
        TODOS
    }

    public enum Rubro
    {
        NINGUNO,
        COMIDA,
        SERVICIOS,
        TRANSPORTE,
        ADMINISTRACION,
        ENTRETENIMIENTO,
        SEGURIDAD
    }

    public enum Estado
    {
        INACTIVO,
        ACTIVO
    }

    public enum TipoNotaCredito
    {
        TOTAL,
        PARCIAL
    }

    public enum CriterioCredito
    {
        DOCUMENTOS_PRESENTADOS = 1,
        INFORMACION_CENTRAL_DE_RIESGOS = 2,
        REFERENCIAS_BANCARIAS = 3,
        REFERENCIAS_COMERCIALES = 4,
        REFERENCIAS_EN_REAL_PLAZA = 5,
    }


    public enum Empresa
    {
        /*  INMOBILIARIA_MILENIA_SA = Convert.ToInt64(20499141051),
          REAL_PLAZA_SRL = Convert.ToInt64(20511315922),
          CENTRO_COMERCIAL_ESTACION_CENTRAL_SA =  20535505684,
          INTERSEGURO_COMPAÑIA_DE_SEGUROS_SA = 20382748566,
          INTERPROPERTIES_PERU = 20535505684*/
    }

    public enum TipoCalendario
    {
    }

    public enum TipoDirecCliente
    {
        FISCAL = 1,
        SUCURSAL = 2,
        FACTURACION = 3
    }

    public enum TipoRotulos
    {
        TIPO_LOCAL,
        RUBRO,
        SUB_RUBRO
    }

    public enum cargoAdministracion
    {

        SUBGERENTE_CORPORATIVO_DE_ADMINISTRACION_Y_FINANZAS = 18,
        GERENTE_CORPORATIVO_DE_ADMINISTRACION_Y_FINANZAS = 32
    }

    public enum CargoCobranzas
    {
        JEFE_DE_COBRANZAS = 79,
        ANALISTA_CREDITOS_Y_COBRANZAS = 80

    }
    public enum CargoComercial
    {
        EJECUTIVO_COMERCIAL = 33
    }

    public enum Area
    {
        ADMINISTRACION = 2,
        COMERCIAL = 3,
        COBRANZAS = 6
    }




    public enum ValorTabla
    {
        TipoCuentaContable = 1,
        NivelCuentaContable = 2,
        NaturalezaCuentaContable = 3,
        EstadosDocumentoPorCobrar = 4,
        TipoRelacionCuentaConcepto = 5,
        DireccionamientoCentroCosto = 6,
        TipoCalendario = 7
    }

    public enum TipoOperacion
    {
        Ninguna,
        Busqueda,
        Creacion,
        Modificacion,
        Eliminacion,
        Listar,
        Exportacion
    }

    public enum TipoBusqueda
    {

        porCuentaContable,
        porCentroCosto
    }

    public enum DocumentoPersona
    {
        DNI = 1,
        CARNE_EXTRANJERIA = 2,
        RUC = 3
    }


    public enum TipoMoneda
    {
        SOL = 1,
        DOLAR = 2
    }
    public enum TipoAccion
    {
        Ninguna,
        Agregar,
        Eliminar
    }

    public enum TipoMensaje
    {
        NoEncontrado,
        Invalido,
        Existoso,
        Error
    }
    public enum TipoCargaMasiva
    {
        MANUAL,
        BTL
    }

    public enum TipoFacturacion
    {
        AUTOMATICA,
        MANUAL,
        BTL,
        ESPECIAL,
        REGULARIZACION,
        TODAS = 99
    }

    public enum TipoPersona
    {
        NATURAL,
        JURIDICA
    }

    public enum EstadosContrato
    {
        TODOS,
        PROPUESTA_DE_CONTRATO,
        IMPLEMENTACION,
        VIGENTE,
        VENCIDO,
        REMODELACION,
        RESUELTO,
        EN_NEGOCIACION,
        EN_PROCESO_DE_RENOVACION,
        RENOVADO,
        NO_OPERA,
        MODIFICADO
    }

    public enum AccionContrato
    {
        NUEVO,
        MODIFICACION,
        RENOVACION,
        CONSULTA
    }

    public enum EstadosFactura
    {
        EMITIDO = 1,
        IMPRESO = 2,
        REIMPRESO = 3,
        DEVUELTO = 4,
        ANULADO = 5, CON_NOTA_DE_CREDITO_ANULACION_TOTAL = 6,
        CON_NOTA_DE_CREDITO_ANULACION_PARCIAL = 7,
        CANCELADO = 8
    }

    public enum EstadosBoletaVenta
    {
        EMITIDO = 9,
        IMPRESO = 10,
        REIMPRESO = 11,
        DEVUELTO = 12,
        ANULADO = 13,
        CON_NOTA_DE_CREDITO_ANULACION_TOTAL = 14,
        CON_NOTA_DE_CREDITO_ANULACION_PARCIAL = 15,
        CANCELADO = 16
    }

    public enum TipoDocumentoPago
    {
        FACTURA = 2,
        BOLETA_DE_VENTA = 4,
        NOTA_DE_CREDITO = 8

    }

    public enum Concepto
    {
        RENTA_FIJA = 1,
        RENTA_VARIABLE = 2,
        GASTO_COMUN_FIJO = 3,
        GASTO_COMUN_VARIABLE = 4,
        GASTO_DE_PROMOCION_FIJO = 5,
        GASTO_DE_PROMOCION_VARIABLE = 6,
        REVISION_DE_PROYECTOS = 7,
        DERECHO_DE_LLAVE = 8,
        INGRESO_MARKETING_REAL_PLAZA = 9,
        RADIO_REAL_PLAZA = 10,
        ELECTRICIDAD = 11,
        AGUA = 12,
        ARBITRIOS = 13,
        PENALIDADES = 14,
        INGRESOS_CONTRATO_ANCRO_REAL_PLAZA = 15,
        INGRESOS_CONTRATO_ANCRO_PROPIETARIO = 16,
        FEE_DE_DESARROLLO_Y_CONSTRUCCION = 17,
        GASTOS_ADMINISTRATIVOS = 18,
        INGRESOS_PARKING = 19,
        MANTENIMIENTO_TRAVOLATORS = 20,
        SERVICIO_DE_HABILITACION = 21,
        SERVICIO_DE_ADMINISTRACION = 22,
        INGRESOS_ADMINISTRATIVOS = 23,
        VENTA_DE_MATERIAL_RECICLADO = 24,
        OTROS_INGRESOS = 25,
        INGRESOS_MORATORIOS_REAL_PLAZA = 26,
        INGRESOS_MORATORIOS_PROPIETARIO = 27,
        CONCEPTO_POR_DEFINIR = 28,
    }

    public enum EstadosNotaCredito
    {
        EMITIDO = 17,
        IMPRESO = 18,
        REIMPRESO = 19,
        DEVUELTO = 20,
        ANULADO = 21,
        CANCELADO = 22
    }
    public enum EstadosLocal
    {
        NO_HABILITADO = 1,
        ARRENDADO = 2,
        VACANCY = 3,
        TODOS = 99
    }


    public class FiltroReporteVentas
    {
        public Int16 OpcionReporte { get; set; }
        public Int32? CodigoInmueble { get; set; }
        public string CodigoLocal { get; set; }
        public DateTime? FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
    }

    public class Llaves
    {
        public const string CodInmueble = "inm_c_vcod";
        public const string CodCatInmueble = "inm_categ_c_yid";
        public const string CodAdministador = "admi_c_cdoc_id";
        public const string CodPropietario = "prop_c_cdoc_id";
        public const string CodUbigeo = "dist_c_ccod_ubig";
        public const string CodDuenio = "dueno_c_sid";
    }

    public enum EstadosEvaluacionCredito
    {
        NINGUNO,
        REGISTRADA,
        MODIFICADA,
        EN_PROCESO_DE_APROBACION_CREDITOS,
        EN_PROCESO_DE_APROBACION_FINANZAS,
        APROBADO_CREDITOS,
        APROBADO_FINANZAS,
        DESAPROBADO_CREDITOS,
        DESAPROBADO_FINANZAS
    }

    public enum TipoParametro
    {
        UNIDAD_DE_MEDIDA = 1,
    }

    public enum DESTINATARIOSCORREO
    {
        DESTINATARIO_CORREO_APROBACION = 1,
        DESTINATARIO_CORREO_DESAPROBACION = 2,
        DESTINATARIO_CORREO_SUBGAF = 3,
        DESTINATARIO_CORREO_MODIFICACION = 4,
        DESTINATARIO_CORREO_CREDITOS = 5
    }

}

