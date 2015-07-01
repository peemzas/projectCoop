package com.springapp.mvc.pojo.exam;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Set;

/**
 * Created by Phuthikorn_T on 6/30/2015.
 */

@Entity
@Table(name="TDCS_QUESTION_TYPE")
public class QuestionType implements Serializable {

    @Id
    @Column(name="QUESTION_TYPE_ID")
    private Integer id;

    @Column(name="QUESTION_TYPE_DESCRIPTION")
    private String description;

    @OneToMany
    private Set<Question> questions;


    @Override
    public String toString() {
        return "QuestionType{" +
                "description='" + description + '\'' +
                ", id=" + id +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }
}
