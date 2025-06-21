package com.example.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class TodoListService {
  public ModelAndView init() {
    return new ModelAndView("todoList");
  }
}