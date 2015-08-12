package ru.sergeirodionov.todolist.service;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.sergeirodionov.todolist.dao.TodoDao;
import ru.sergeirodionov.todolist.model.Todo;

import java.io.IOException;
import java.io.StringWriter;

/**
 * Created by SergeiRodionov.ru on 07.08.2015.
 */
@Service("todoService")
@Transactional
public class TodoServiceImpl implements TodoService {

    @Autowired
    private TodoDao dao;

    // convert to JSON data
    public String findAllTodo(String text) {

        StringWriter writer = new StringWriter();

        ObjectMapper mapper = new ObjectMapper();
        try {
            mapper.writeValue(writer, dao.findAllTodo(text));
        } catch (JsonGenerationException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return writer.getBuffer().toString();
    }


    public void saveOrUpdateTodo(Todo todo) {
        dao.saveOrUpdateTodo(todo);
    }

    public void deleteTodo(Todo todo) {
        dao.deleteTodo(todo);
    }

    public Todo getTodoById(Integer todoId) {
        return dao.getTodoById(todoId);
    }
}
