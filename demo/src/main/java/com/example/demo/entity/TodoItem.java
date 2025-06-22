package com.example.demo.entity;

public class TodoItem {
  private int id;
  private String task;
  private int state;

    // コンストラクタ
  public TodoItem(int id, String task, int state) {
    this.id = id;
    this.task = task;
    this.state = state;
  }

  // Getter
  public int getId() {
    return id;
  }

  public String getTask() {
    return task;
  }

  public int getState() {
    return state;
  }
}