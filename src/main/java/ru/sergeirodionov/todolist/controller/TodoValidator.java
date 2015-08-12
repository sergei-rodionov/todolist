package ru.sergeirodionov.todolist.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import ru.sergeirodionov.todolist.model.Todo;


/**
 * Created by SergeiRodionov.ru on 12.08.2015.
 */

@Component
public class TodoValidator implements Validator {

    public boolean supports(Class<?> clazz) {
        return Todo.class.equals(clazz);
    }

    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "todoText", "NotEmpty.todoForm.todoText");
        Todo todo = (Todo) o;
        if (errors.getErrorCount() == 0 && todo.getTodoText().trim().length() < 1) {
            errors.rejectValue("todoText", "NoText.todoForm.todoText");
        }
    }
}
