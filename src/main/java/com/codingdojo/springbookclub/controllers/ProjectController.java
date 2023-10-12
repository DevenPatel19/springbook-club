package com.codingdojo.springbookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.springbookclub.models.Book;
import com.codingdojo.springbookclub.services.BookService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ProjectController {

	
	@Autowired
	private BookService bookService;
	
	@GetMapping("/dashboard")
	public String projectDashboard(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
		return "redirect:/";
		}
		List<Book> allBook = bookService.allBook();
		model.addAttribute("allBook", allBook);
		return "findAllBook.jsp";
	}
	
	@GetMapping("/books/new")
	public String renderCreateBookForm(@ModelAttribute("newBook")Book newBook, HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
			}
		return "createBook.jsp";
	}
	
	@PostMapping("/books/new")
	public String processCreateBook(
			@Valid @ModelAttribute("newBook") Book newBook,
			BindingResult result,  HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
			}
		if(result.hasErrors()) {
//			System.out.println(result.getAllErrors());
			return "createBook.jsp";
		} else {
			bookService.createBook(newBook);
			return "redirect:/dashboard";
		}
	}
	//details page path variable method, get details from service and model model to page
	@GetMapping("/books/{id}")
	public String bookDetailsPage(
			@PathVariable("id")Long id, Model model, HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
			}
		Book oneBook = bookService.oneBook(id);
		model.addAttribute("oneBook", oneBook);
		return "findOneBook.jsp";
	}
	
	@DeleteMapping("/books/{id}")
	public String deleteBookById(
			@PathVariable("id") Long id,
			HttpSession session
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
			}
		
		bookService.deleteBook(id);
		return "redirect:/dashboard";
		
	}
	
	@GetMapping("/books/{id}/edit")
	public String renderEditBookForm(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
			}
		Book oneBook = bookService.oneBook(id);
		model.addAttribute("oneBook", oneBook);
		return "updateBook.jsp";
	}
	
	@PutMapping("/books/{id}/edit")
	public String processEditBook(
			@Valid @ModelAttribute("oneBook") Book oneBook,
			BindingResult result) {
		if(result.hasErrors()) {
			return "updateBook.jsp";
		} else {
			bookService.updateBook(oneBook);
			return "redirect:/books/"+oneBook.getId();
		}
	}
}
