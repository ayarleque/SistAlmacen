/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Oficina
 */
public class redimArray {
    public static int[] resizeArray(int resize, int[] a) {

        int[] b = new int[resize];

        /* 1ºArg: Array origen,
         * 2ºArg: Por donde comienza a copiar en el origen
         * 3ºArg: Array destino
         * 4ºArg: Por donde comienza a copiar en el destino
         * 5ºArg: Numero de elementos que copiara del origen
         */
        System.arraycopy(a, 0, b, 0, a.length);

        return b;
    }
    
    public static String[] resizeArrayStr(int resize, String[] a) {

        String[] b = new String[resize];

        /* 1ºArg: Array origen,
         * 2ºArg: Por donde comienza a copiar en el origen
         * 3ºArg: Array destino
         * 4ºArg: Por donde comienza a copiar en el destino
         * 5ºArg: Numero de elementos que copiara del origen
         */
        System.arraycopy(a, 0, b, 0, a.length);

        return b;
    }

}
