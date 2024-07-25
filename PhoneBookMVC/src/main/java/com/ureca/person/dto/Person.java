package com.ureca.person.dto;

public class Person {
	private int no;
    private String name;
    private int age;
    private String job;
    private long phonenumber;
    private int bookmark;

    
    public Person() {
		// TODO Auto-generated constructor stub
	}

	public Person(int no, String name, int age, String job, long phonenumber, int bookmark) {
		super();
		this.no = no;
		this.name = name;
		this.age = age;
		this.job = job;
		this.phonenumber = phonenumber;
		this.bookmark= bookmark;
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
	
	public long getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(long phonenumber) {
		this.phonenumber = phonenumber;
	}
	
	public int getBookmark() {
		return bookmark;
	}

	public void setBookmark(int bookmark) {
		this.bookmark = bookmark;
	}


	@Override
	public String toString() {
		return "Person [no=" + no + ", name=" + name + ", age=" + age + ", job=" + job + ",phonenumber=" + phonenumber  + ",bookmark=" + bookmark + "]";
	}
    
    
}
