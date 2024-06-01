package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import common.ConnectJDBC;
import dao.PersonDAO;
import model.Person;

public class PersonDAOImpl implements PersonDAO {

	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	private Scanner scanner = new Scanner(System.in);

	@Override
	public List<Person> showAll() {

		List<Person> list = new ArrayList<>();
		StringBuilder sqlQuery = new StringBuilder();
		Person person = null;
		
		sqlQuery.append(" SELECT ");
		sqlQuery.append(" ID ");
		sqlQuery.append(" ,Name ");
		sqlQuery.append(" FROM Person ");
		try {
			connection = ConnectJDBC.getConnection();
			preparedStatement = connection.prepareStatement(sqlQuery.toString());
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				person = new Person(resultSet.getString("ID"), resultSet.getString("Name"));
				list.add(person);
			}
			return list;
		} catch (Exception e) {
			System.out.println("ERROR");
			return null;
		} finally {
			try {
				ConnectJDBC.close(resultSet, preparedStatement, connection);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
