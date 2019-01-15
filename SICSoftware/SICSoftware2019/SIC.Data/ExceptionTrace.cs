using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace SIC.Data
{
    public static class ExceptionTrace
    {
        // ========================Constructor Estático========================

        /// <summary>
        /// Inicializa los miembros estaticos de la clase <see cref="ExceptionLoggerCompact"/>. 
        /// </summary>
        static ExceptionTrace()
        {
            MostrarTipoExcepcion = true;
            MostrarMensaje = true;
            MostrarStackTrace = true;
            MostrarAyuda = true;
            MostrarExcepcionesInternas = true;
            MostrarDivision = true;
        }

        // ========================Atributos Estáticos=========================

        /// <summary>
        /// Obtiene o establece si se mostrará el tipo de excepción en el Log.
        /// </summary>
        public static bool MostrarTipoExcepcion { get; set; }

        /// <summary>
        /// Obtiene o establece si se mostrará el mensaje de la excepción en el Log.
        /// </summary>
        public static bool MostrarMensaje { get; set; }

        /// <summary>
        /// Obtiene o establece si se mostrará el StackTrace en el Log.
        /// </summary>
        public static bool MostrarStackTrace { get; set; }

        /// <summary>
        /// Obtiene o establece si se muestra las excepciones internas.
        /// </summary>
        public static bool MostrarExcepcionesInternas { get; set; }

        /// <summary>
        /// Obtiene o establece si se muestra los mensajes de ayuda de programador.
        /// </summary>
        public static bool MostrarAyuda { get; set; }

        /// <summary>
        /// Obtiene o establece si se muestra una división entre los mensajes.
        /// </summary>
        public static bool MostrarDivision { get; set; }


        // ========================Metodos Estáticos=========================       

        /// <summary>
        /// Agrega un elemento al Log de excepciones. Se registra la excepción y sus excepciones internas.
        /// </summary>
        /// <param name="exceptionLog">Excepción que se ingresará al Log.</param>
        public static void Write(Exception exceptionLog)
        {
            Write(exceptionLog, 0, null);
        }

        /// <summary>
        /// Agrega un elemento al Log de excepciones.
        /// </summary>
        /// <param name="exceptionLog">Excepción que se ingresará al Log.</param>
        /// <param name="ayuda">Ayuda extra de programador.</param>
        public static void Write(Exception exceptionLog, params string[] ayuda)
        {
            Write(exceptionLog, 0, ayuda);
        }

        /// <summary>
        /// Agrega un elemento al Log de excepciones. Dependiendo de que valores se encuentran en las
        /// propiedades estaticas, se mostrarán los datos.
        /// </summary>
        /// <param name="exceptionLog">Excepción que se ingresará al Log.</param>
        /// <param name="nivel">Nivel interno de excepción.</param>
        /// <param name="ayuda">Ayuda extra de programador.</param>
        private static void Write(Exception exceptionLog, int nivel, string[] ayuda)
        {
            // Empezamos por agregar 1 al nivel.
            int innerLevel = nivel + 1;
            if (innerLevel == 1)
            {
                // En caso que sea 1, se coloca una división con el caracter '=' 
                Trace.WriteLineIf(MostrarDivision, "=====================================================");
                Trace.WriteLine(DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss"), "Fecha");
            }
            else
            {
                // En caso que sea cualquier otro, se coloca una división con el caracter '-'
                Trace.WriteLineIf(MostrarDivision, "-----------------------------------------------------");
                Trace.WriteLine(nivel, "Excepcion Interna");
            }

            Trace.WriteLineIf(MostrarTipoExcepcion, exceptionLog.GetType().ToString(), "Excepción del tipo");
            Trace.WriteLineIf(MostrarMensaje, exceptionLog.Message, "Mensaje");
            Trace.WriteLineIf(MostrarStackTrace, exceptionLog.StackTrace, "StackTrace");

            if (MostrarAyuda && ayuda != null && ayuda.Length > 0)
            {
                Trace.Indent();
                foreach (string value in ayuda)
                {
                    Trace.WriteLine(value, "Información útil");
                }

                Trace.Unindent();
            }

            // Si existe una excepción interna y el flag MostrarExcepcionesInternas es TRUE, 
            // se llama recursivamente a esta función para que muestre los datos de la
            // excepción interna.
            if (MostrarExcepcionesInternas && exceptionLog.InnerException != null)
            {
                Write(exceptionLog.InnerException, innerLevel, null);
            }

            if (nivel == 0)
            {
                Trace.Flush();
            }
        }
    }
}
