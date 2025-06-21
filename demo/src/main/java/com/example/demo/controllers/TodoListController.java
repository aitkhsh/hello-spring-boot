package com.example.demo.controller;

import com.example.demo.service.TodoListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TodoListController {

    // TodoListServiceクラスをインスタンス（オブジェクト化）している。
    @Autowired
    private TodoListService todoListService;

    @GetMapping("/todolist")
    public ModelAndView showTodoList() {
        return todoListService.init();
    }
}
