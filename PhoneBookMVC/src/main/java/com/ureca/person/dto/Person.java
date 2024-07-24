package com.ureca.person.dto;

public class Person {
	private int no;
    private String name;
    private int age;
    private String job;
    private int phonenumber;

    
    public Person() {
		// TODO Auto-generated constructor stub
	}

	public Person(int no, String name, int age, String job, int phonenumber) {
		super();
		this.no = no;
		this.name = name;
		this.age = age;
		this.job = job;
		this.phonenumber = phonenumber;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	
	public int getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(int phonenumber) {
		this.phonenumber = phonenumber;
	}

	@Override
	public String toString() {
		return "Person [no=" + no + ", name=" + name + ", age=" + age + ", job=" + job + ",phonenumber=" + phonenumber + "]";
	}
    
    
}
