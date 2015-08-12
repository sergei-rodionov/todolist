package ru.sergeirodionov.todolist.service;

import ru.sergeirodionov.todolist.model.Todo;

/**
 * Created by SergeiRodionov.ru on 07.08.2015.
 */
public interface TodoService {


    public String findAllTodo(String text);

    public void saveOrUpdateTodo(Todo todo);

    public void deleteTodo(Todo todo);

    public Todo getTodoById(Integer todoId);
}
