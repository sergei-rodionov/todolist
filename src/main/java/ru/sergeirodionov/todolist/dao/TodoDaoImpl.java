package ru.sergeirodionov.todolist.dao;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.sergeirodionov.todolist.model.Todo;

import java.util.List;

/**
 * Created by SergeiRodionov.ru on 07.08.2015.
 */
@Repository
public class TodoDaoImpl implements TodoDao {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public List<Todo> findAllTodo(String text) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Todo.class);
        if (text.trim().length() > 2) {
            Criterion likeText = Restrictions.like("todoText", "%" + text + "%");
            criteria.add(likeText);
        }
        criteria.addOrder(Order.desc("createDate"));
        return (List<Todo>) criteria.list();
    }

    public void saveOrUpdateTodo(Todo todo) {
        if (todo.getCreateDate() == null) todo.setCreateDate(new java.util.Date());
        sessionFactory.getCurrentSession().saveOrUpdate(todo);
    }

    public void deleteTodo(Todo todo) {
        sessionFactory.getCurrentSession().delete(todo);
    }

    public Todo getTodoById(Integer todoId) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Todo.class);
        Criterion idx = Restrictions.idEq(todoId);
        criteria.add(idx);
        criteria.setMaxResults(1);
        return (Todo) criteria.uniqueResult();
    }
}
