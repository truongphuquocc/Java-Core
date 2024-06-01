package view;

import common.ConnectJDBC;

public class main {
	
	/**
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		ConnectJDBC.getConnection();
		System.out.println("END");
	}
}
