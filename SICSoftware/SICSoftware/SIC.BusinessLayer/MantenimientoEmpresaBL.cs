using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;
using SIC.Data;
using SIC.BusinessLayer.Validacion;

namespace SIC.BusinessLayer
{
    /// <summary>
    /// Provee los metodos para realizar el mantenimiento de los datos de la empresa.
    /// </summary>
    public class MantenimientoEmpresaBL
    {
        /// <summary>
        /// Lista las direcciones de la empresa.
        /// </summary>
        /// <returns></returns>
        public List<SIC_T_EMP_DIRECCION> ListarDireccionEmpresa()
        {
            return new EmpresaDA().ListarDireccionEmpresa();
        }

        /// <summary>
        /// Obtiene una dirección de la empresa por id
        /// </summary>
        /// <param name="id"><c>int</c> id de la dirección.</param>
        /// <returns>Objeto empresa o <c>null</c> si es que no lo encuentra</returns>
        public SIC_T_EMP_DIRECCION ObtenerDireccionEmpresa(int id)
        {
            return new EmpresaDA().ObtenerDireccionEmpresa(id);
        }

        /// <summary>
        /// Obtiene un objeto con los datos de la empresa.
        /// </summary>
        /// <returns></returns>
        public SIC_T_EMPRESA ObtenerDatosEmpresa()
        {
            return new EmpresaDA().ObtenerDatosEmpresa();
        }

        /// <summary>
        /// Comprueba los datos del objeto dirección y retorna un objecto <c>ResultadoValidacion</c>
        /// que representa el resutlado de la validación.
        /// </summary>
        /// <param name="direccion">Dirección que se comprobará.</param>
        /// <returns>Objecto <c>ResultadoValidacion</c>.</returns>
        public ResultadoValidacion ValidarDireccionEmpresa(SIC_T_EMP_DIRECCION direccion)
        {
            if(direccion == null)
            {
                throw new ArgumentException("El campo dirección no puede ser nulo");
            }
            else if (direccion.emp_dir_c_vdireccion == null || direccion.emp_dir_c_vdireccion.Trim().Length == 0)
            {
                return new ResultadoValidacion(false, "Debe ingresar la descripción de la dirección");
            }
            else if (direccion.emp_dir_c_iid_centrocosto == -1)
            {
                return new ResultadoValidacion(false, "Debe seleccionar un centro de costo");
            }
            else if (direccion.emp_dir_c_itipodirec == -1)
            {
                return new ResultadoValidacion(false, "Debe seleccionar un tipo de dirección");
            }
            else if (direccion.emp_dir_c_ccod_ubig == null || direccion.emp_dir_c_ccod_ubig.Length != 6)
            {
                return new ResultadoValidacion(false, "Debe seleccionar departamento, provincia y distrito para determinar el ubigeo.");
            }
            else
            {
                return new ResultadoValidacion(true, null);
            }
        }

        /// <summary>
        /// Comprueba que los datos del objeto Centro de Costo y retorna un objeto
        /// <c>ResultadoValidacion</c> que representa el estado de la validación.
        /// </summary>
        /// <param name="centroCosto">Centro de costo que se comprobará</param>
        /// <returns>Objecto <c>ResultadoValidacion</c>.</returns>
        public ResultadoValidacion ValidarCentroCosto(SIC_T_EMP_CENTRO_COSTO centroCosto)
        {
            int num;
            if (centroCosto == null)
            {
                throw new ArgumentException("El parametro centroCosto no debe ser nulo.");
            }
            else if (centroCosto.emp_cst_c_vdesc == null || centroCosto.emp_cst_c_vdesc.Trim().Length == 0)
            {
                return new ResultadoValidacion(false, "Debe ingresar el nombre del centro de costo.");
            }
            else if (centroCosto.emp_cst_c_vserieboleta == null || centroCosto.emp_cst_c_vserieboleta.Trim().Length == 0)
            {
                return new ResultadoValidacion(false, "Debe ingresar el la serie de la boleta.");
            }
            else if( !(int.TryParse(centroCosto.emp_cst_c_vserieboleta.Trim(), out num) && num > 0) )
            {
                return new ResultadoValidacion(false, "La serie de la boleta debe un numero entero positivo.");
            }
            else if (centroCosto.emp_cst_c_vseriefactura == null || centroCosto.emp_cst_c_vseriefactura.Trim().Length == 0)
            {
                return new ResultadoValidacion(false, "Debe ingresar el la serie de la factura.");
            }
            else if (!(int.TryParse(centroCosto.emp_cst_c_vseriefactura.Trim(), out num) && num > 0))
            {
                return new ResultadoValidacion(false, "La serie de la factura debe un numero entero positivo.");
            }
            else
            {
                return new ResultadoValidacion(true, null);
            }
        }

        public void IngresarDireccion(SIC_T_EMP_DIRECCION direccion)
        {
            if (!ValidarDireccionEmpresa(direccion).EsValido)
            {
                throw new ArgumentException("El parametro direccion no es válido para el ingreso.");
            }
            new EmpresaDA().IngresarDireccion(direccion);
        }

        public void ModificarDireccion(SIC_T_EMP_DIRECCION direccion)
        {
            if (!ValidarDireccionEmpresa(direccion).EsValido)
            {
                throw new ArgumentException("El parametro direccion no es válido para la modificación.");
            }
            new EmpresaDA().ModificarDireccion(direccion);
        }

        public void IngresarCentroCosto(SIC_T_EMP_CENTRO_COSTO centroCosto)
        {
            if (!ValidarCentroCosto(centroCosto).EsValido)
            {
                throw new ArgumentException("El parametro centro costo no es válido para el ingreso.");
            }
            new CentroCostoDA().IngresarCentroCosto(centroCosto);
        }

        public void ModificarCentroCosto(SIC_T_EMP_CENTRO_COSTO centroCosto)
        {
            if (!ValidarCentroCosto(centroCosto).EsValido)
            {
                throw new ArgumentException("El parametro centro costo no es válido para el ingreso.");
            }
            new CentroCostoDA().ModificarCentroCosto(centroCosto);
        }

        /// <summary>
        /// Obtiene la lista de departamentos.
        /// </summary>
        /// <returns></returns>
        public List<SIC_T_DEPARTAMENTO> ListarDepatamentos()
        {
            return new UbigeoDA().ListarDepatamentos();
        }

        /// <summary>
        /// Obtiene la lista de provincias pertenencientes al departamento.
        /// </summary>
        /// <param name="_pstrdepa_c_ccod"></param>
        /// <returns></returns>
        public List<SIC_T_PROVINCIA> ListarProvincias(string _pstrdepa_c_ccod)
        {
            return new UbigeoDA().ListarProvincias(_pstrdepa_c_ccod);
        }

        /// <summary>
        /// Obtiene la lista de distritos pertenecientes al departamento.
        /// </summary>
        /// <param name="_pstrprov_c_ccod"></param>
        /// <returns></returns>
        public List<SIC_T_DISTRITO> ListarDistritos(string _pstrprov_c_ccod)
        {
            return new UbigeoDA().ListarDistritos(_pstrprov_c_ccod);
        }

        public List<SIC_T_PARAMETRO_DET> ListarTipoDireccion()
        {
            return new ParametroDA().ListarParametros((int)TipoParametro.TIPO_DIRECCION);
        }
    }
}
