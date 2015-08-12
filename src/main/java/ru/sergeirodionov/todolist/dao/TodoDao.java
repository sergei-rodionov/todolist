package ru.sergeirodionov.todolist.dao;

import ru.sergeirodionov.todolist.model.Todo;

import java.util.List;

/**
 * Created by SergeiRodionov.ru on 07.08.2015.
 */
public interface TodoDao {
    public List<Todo> findAllTodo(String text);

    public void saveOrUpdateTodo(Todo todo);

    public void deleteTodo(Todo todo);

    public Todo getTodoById(Integer todoId);

}
