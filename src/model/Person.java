package model;

public class Person {
	
	private String id;
	private String name;
	
	public String getId() { return id; }
	
	public void setId(String id) { this.id = id; }
	
	public String getName() { return name; }
	
	public void setName(String name) { this.name = name; }
	
	public Person(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public Person() {}

	@Override
	public String toString() {
		return String.format("ID: %s, Name: %s", id, name);
	}
}
