package ru.sergeirodionov.todolist.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.sergeirodionov.todolist.model.Status;
import ru.sergeirodionov.todolist.model.Todo;
import ru.sergeirodionov.todolist.service.TodoService;

/**
 * Created by SergeiRodionov.ru on 07.08.2015.
 */

@Controller
public class TodoController {

    @Autowired
    TodoValidator todoValidator;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(todoValidator);
    }


    private final Logger logger = LoggerFactory.getLogger(TodoController.class);

    @Autowired
    private TodoService todoService;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        logger.debug("index()");
        return "redirect:/todo";
    }

    //list to do
    @RequestMapping(value = {"/todo"}, method = {RequestMethod.GET})
    public String showAllTodos(Model model) {
        return "todo/index";
    }


    @RequestMapping(value = {"/todo/list.json"},
            method = {RequestMethod.GET},
            headers = {"accept=application/json"},
            produces = {"application/json; charset=UTF-8"})
    public
    @ResponseBody
    String listAllTodo(@RequestParam(value = "t", required = false) String searchText,
                       Model model) {
        logger.debug("show todo list");
        if (searchText == null) return todoService.findAllTodo("");
        else return todoService.findAllTodo(searchText);
    }


    // show update to do form
    @RequestMapping(value = "/todo/{id}/edit", method = RequestMethod.GET)
    public String showUpdateTodoForm(@PathVariable("id") int todoId, Model model) {

        logger.debug("show form edit todo id:" + todoId);

        Todo todo = todoService.getTodoById(todoId);
        model.addAttribute("todoForm", todo);

        return "todo/edit";
    }

    // show add to do form
    @RequestMapping(value = "/todo/add", method = RequestMethod.GET)
    public String showAddTodoForm(Model model) {

        logger.debug("showAddTodoForm()");
        Todo todo = new Todo();
        todo.setStatus(Status.tasks);

        model.addAttribute("todoForm", todo);

        return "todo/edit";
    }


    // save or update to do
    @RequestMapping(value = "/todo", method = RequestMethod.POST)
    public String saveOrUpdateTodo(@ModelAttribute("todoForm") @Validated Todo todo,
                                   BindingResult result, Model model, final RedirectAttributes redirectAttributes) {

        logger.debug("saveOrUpdateTodo : {}", todo);


        if (result.hasErrors()) {
            return "todo/edit";
        } else {
            redirectAttributes.addFlashAttribute("css", "success");

            if (todo.getRemoveFromDB() && todo.getStatus() == Status.remove) {
                redirectAttributes.addFlashAttribute("msg", "Todo removed from DB successfully!");
                todoService.deleteTodo(todo);

            } else {

                if (todo.isNew()) {
                    redirectAttributes.addFlashAttribute("msg", "Todo added successfully!");
                } else {
                    redirectAttributes.addFlashAttribute("msg", "Todo updated successfully!");
                }

                todoService.saveOrUpdateTodo(todo);
            }
            // POST/REDIRECT/GET
            return "redirect:/todo/";

            // POST/FORWARD/GET
            // return "user/list";
        }
    }

}
