package com.ureca.person.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ureca.person.dto.Person;
import com.ureca.person.model.dao.PersonDAO;

@Service
public class PersonServiceImpl implements PersonService {

	@Autowired
	PersonDAO dao;
	
	@Override
	public int add(Person person) throws SQLException {
		return dao.insert(person);
	}

	@Override
	public int edit(Person person) throws SQLException {
		return dao.update(person);
	}

	@Override
	public int remove(int no) throws SQLException {
		return dao.delete(no);
	}

	@Override
	public Person read(int no) throws SQLException {
		return dao.select(no);
	}

	@Override
	public List<Person> readAll() throws SQLException {
		return dao.selectAll();
	}
	
	 @Override
	    public List<Person> getFavoritePersons() throws SQLException {
	        List<Person> allPersons = readAll(); // 전체 목록을 가져오는 기존 메서드
	        return allPersons.stream()
	                         .filter(person -> person.getBookmark() == 1)
	                         .collect(Collectors.toList());
	    }

}
