package ru.sergeirodionov.todolist.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by SergeiRodionov.ru on 07.08.2015.
 */

@Entity
@Table(name = "Todo")
public class Todo implements Serializable {


    private static final long serialVersionUID = 8616227436464089403L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "createDate", nullable = false, updatable = false)
    private Date createDate;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "status")
    private Status status;

    @Column(name = "fire")
    private boolean fire;

    @Column(name = "todoText", length = 1000, columnDefinition = "text")
    private String todoText;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public boolean isFire() {
        return fire;
    }

    public void setFire(boolean fire) {
        this.fire = fire;
    }

    public String getTodoText() {
        return todoText;
    }

    public void setTodoText(String todoText) {
        this.todoText = todoText;
    }

    public boolean isNew() {
        return (this.id == null);
    }

    @Transient
    private Boolean removeFromDB = false;

    public Boolean getRemoveFromDB() {
        return removeFromDB;
    }

    public void setRemoveFromDB(Boolean removeFromDB) {
        this.removeFromDB = removeFromDB;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "id=" + id +
                ", createDate=" + createDate +
                ", status=" + status +
                ", fire=" + fire +
                ", todoText='" + todoText + '\'' +
                '}' + isNew();
    }
}
