﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIC.EntityLayer;
using SIC.DataLayer;

namespace SIC.BusinessLayer
{
    public class MovimientoEntradaBL
    {
        public List<SIC_T_MOVIMIENTO_ENTRADA> ObtenerMovimientosEntrada()
        {
            return new MovimientoEntradaDA().ObtenerMovimientoEntrada();
        }

        public List<SIC_T_MOV_ESTADO> ObtenerMovimientoEstados()
        {
            return new MovimientoEntradaDA().ObtenerMovimientoEstados();
        }

        public bool InsertarMovimientoEntrada(SIC_T_MOVIMIENTO_ENTRADA _pSIC_T_MOVIMIENTO_ENTRADA)
        {
            return new MovimientoEntradaDA().InsertarMovimientoEntrada(_pSIC_T_MOVIMIENTO_ENTRADA);
        }

        public SIC_T_MOVIMIENTO_ENTRADA ObtenerMovimientoEntradaPorId(int id)
        {
            return new MovimientoEntradaDA().ObtenerMovimientoEntradaPorId(id);
        }

        public bool ModificarMovimientoEntrada(SIC_T_MOVIMIENTO_ENTRADA _pSIC_T_MOVIMIENTO_ENTRADA)
        {
            return new MovimientoEntradaDA().ModificarMovimientoEntrada(_pSIC_T_MOVIMIENTO_ENTRADA);
        }
    }
}
