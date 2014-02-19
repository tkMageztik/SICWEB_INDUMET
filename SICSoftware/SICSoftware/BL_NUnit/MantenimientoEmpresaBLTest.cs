using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using SIC.EntityLayer;
using SIC.BusinessLayer;

namespace BL_NUnit
{
    [TestFixture]
    public class MantenimientoEmpresaBLTest
    {
        [Test]
        public void PruebValidarCentroCosto()
        {
            MantenimientoEmpresaBL _emp = new MantenimientoEmpresaBL();
            SIC_T_EMP_CENTRO_COSTO ccosto = new SIC_T_EMP_CENTRO_COSTO();

            ccosto.emp_cst_c_vdesc = "";
            ccosto.emp_cst_c_vserieboleta = "";
            ccosto.emp_cst_c_vseriefactura = "";            
            Assert.IsFalse(_emp.ValidarCentroCosto(ccosto).EsValido, "Se valido el centro de costo de manera incorrecta");

            ccosto.emp_cst_c_vdesc = "test";
            ccosto.emp_cst_c_vserieboleta = "-1";
            ccosto.emp_cst_c_vseriefactura = "asd";
            Assert.IsFalse(_emp.ValidarCentroCosto(ccosto).EsValido, "Se valido el centro de costo de manera incorrecta");

            ccosto.emp_cst_c_vdesc = "";
            ccosto.emp_cst_c_vserieboleta = "1";
            ccosto.emp_cst_c_vseriefactura = "-1";
            Assert.IsFalse(_emp.ValidarCentroCosto(ccosto).EsValido, "Se valido el centro de costo de manera incorrecta");

            ccosto.emp_cst_c_vdesc = "";
            ccosto.emp_cst_c_vserieboleta = "";
            ccosto.emp_cst_c_vseriefactura = "1";
            Assert.IsFalse(_emp.ValidarCentroCosto(ccosto).EsValido, "Se valido el centro de costo de manera incorrecta");

            // Correcto
            ccosto.emp_cst_c_vdesc = "test";
            ccosto.emp_cst_c_vserieboleta = "10"; 
            ccosto.emp_cst_c_vseriefactura = "10";           
            Assert.IsTrue(_emp.ValidarCentroCosto(ccosto).EsValido, _emp.ValidarCentroCosto(ccosto).Mensaje);
        }

        [Test]
        public void PruebaValidarDireccionEmpresa()
        {
            MantenimientoEmpresaBL _emp = new MantenimientoEmpresaBL();
            SIC_T_EMP_DIRECCION dir = new SIC_T_EMP_DIRECCION();

            dir.emp_dir_c_iid_centrocosto = -1;
            dir.emp_dir_c_vdireccion = "";
            dir.emp_dir_c_itipodirec = -1;
            dir.emp_dir_c_ccod_ubig = "";
            Assert.IsFalse(_emp.ValidarDireccionEmpresa(dir).EsValido, "Se valido el centro de costo de manera incorrecta");

            dir.emp_dir_c_iid_centrocosto = 1;
            dir.emp_dir_c_vdireccion = "";
            dir.emp_dir_c_itipodirec = -1;
            dir.emp_dir_c_ccod_ubig = "";
            Assert.IsFalse(_emp.ValidarDireccionEmpresa(dir).EsValido, "Se valido el centro de costo de manera incorrecta");

            dir.emp_dir_c_iid_centrocosto = -1;
            dir.emp_dir_c_vdireccion = "Test";
            dir.emp_dir_c_itipodirec = -1;
            dir.emp_dir_c_ccod_ubig = "";
            Assert.IsFalse(_emp.ValidarDireccionEmpresa(dir).EsValido, "Se valido el centro de costo de manera incorrecta");

            dir.emp_dir_c_iid_centrocosto = -1;
            dir.emp_dir_c_vdireccion = "";
            dir.emp_dir_c_itipodirec = 1;
            dir.emp_dir_c_ccod_ubig = "Test";
            Assert.IsFalse(_emp.ValidarDireccionEmpresa(dir).EsValido, "Se valido el centro de costo de manera incorrecta");

            dir.emp_dir_c_iid_centrocosto = -1;
            dir.emp_dir_c_vdireccion = "";
            dir.emp_dir_c_itipodirec = 1;
            dir.emp_dir_c_ccod_ubig = "1020568";
            Assert.IsFalse(_emp.ValidarDireccionEmpresa(dir).EsValido, "Se valido el centro de costo de manera incorrecta");

            dir.emp_dir_c_iid_centrocosto = -1;
            dir.emp_dir_c_vdireccion = "";
            dir.emp_dir_c_itipodirec = 1;
            dir.emp_dir_c_ccod_ubig = "102056";
            Assert.IsFalse(_emp.ValidarDireccionEmpresa(dir).EsValido, "Se valido el centro de costo de manera incorrecta");

            // Correcto
            dir.emp_dir_c_iid_centrocosto = 1;
            dir.emp_dir_c_vdireccion = "Direccion";
            dir.emp_dir_c_itipodirec = 1;
            dir.emp_dir_c_ccod_ubig = "102056";
            Assert.IsTrue(_emp.ValidarDireccionEmpresa(dir).EsValido, _emp.ValidarDireccionEmpresa(dir).Mensaje);
        }
    }
}
