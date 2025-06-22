package com.example.demo.service;

import com.example.demo.entity.TodoItem;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.ArrayList;

@Service
public class TodoListService {
  public ModelAndView init() {
    List<TodoItem> items = new ArrayList<>();
    items.add(new TodoItem(1, "買い物に行く", 0));
    items.add(new TodoItem(2, "課題を提出", 1));

    ModelAndView mv = new ModelAndView("todoList");
    mv.addObject("items", items);
    return mv;
  }
}