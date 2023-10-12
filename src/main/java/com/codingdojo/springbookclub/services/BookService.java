package com.codingdojo.springbookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.springbookclub.models.Book;
import com.codingdojo.springbookclub.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepo;
	
	//find all
	public List<Book> allBook(){
		return bookRepo.findAll();
	}
	//find one
	public Book oneBook(Long id){
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	//create
	public Book createBook(Book newBook) {
		return bookRepo.save(newBook);
	}
	//update
	public Book updateBook(Book oneBook) {
		return bookRepo.save(oneBook);
	}
	//delete
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
}
