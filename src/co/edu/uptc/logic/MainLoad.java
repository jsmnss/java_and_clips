package co.edu.uptc.logic;

import java.util.Scanner;

import jess.*;

public class MainLoad {
    public static void main(String args[]) throws JessException {
        boolean repeat = true;
        Scanner sc = new Scanner(System.in);
        while (repeat) {
            System.out.println("Ingrese los hechos separados por ( , )");
            String data = sc.nextLine().trim();
            String vec[] = data.split(",");
            data = "(assert".trim();
            for (String dat : vec) {
                data += "(" + dat.trim() + ")";
            }
            data += ")";
            System.out.println(getResult(data.trim()));
        }
    }

    static String getResult(String data) {
        try {
            Rete r = new Rete();
            r.batch("./Resources/prueba.clp");
            // r.store("llenar la solicitud", new Value(1, RU.INTEGER));
            // r.store("LEVEL", new Value(1, RU.INTEGER));
            Value vlessonn = r.eval(data.toString());
            data = "(run)";
            vlessonn = (r.eval(data));
            return vlessonn.stringValue(r.getGlobalContext());
        } catch (JessException ex) {
            System.err.println(ex);
            return "Error...................";
        }

    }
}
