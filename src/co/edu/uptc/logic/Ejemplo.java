package co.edu.uptc.logic;

import net.sf.clipsrules.jni.Environment;
public class Ejemplo {
	private Environment clips;
	
	public Ejemplo() {
		clips = new Environment();
        clips.load("./resources/test.clp");
        clips.run();
	}
	public static void main(String[] args) {
		Ejemplo ejm= new Ejemplo();
		ejm.clips.run();
		
	}

}

