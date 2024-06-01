package controller;

import java.util.List;
import java.util.Scanner;

import dao.PersonDAO;
import dao.impl.PersonDAOImpl;
import model.Person;

public class Controller {

	private static Scanner scanner = new Scanner(System.in);
	private static PersonDAO personDAO = new PersonDAOImpl();

	/**
	 * 
	 */
	public static void menuMain() {
		try {
			do {
				System.out.println("1. Hiển thị tất cả: ");
				System.out.println("Vui lòng chọn chức năng!");
				String choice = scanner.nextLine();
				switch (choice) {
				case "1":
					showInformation(personDAO.showAll());
					break;
				default:
					break;
				}
			} while (true);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param list
	 */
	private static void showInformation(List<Person> list) {
		if (list == null || list.size() <= 0) {
			System.out.println("danh sách trống");
		}else {
			for (Person obj : list) {
				System.out.println(obj.toString());
			}
		}
	}
}
