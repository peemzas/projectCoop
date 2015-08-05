package com.springapp.mvc.pojo.exam;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Phuthikorn_T on 7/13/2015.
 */
@Entity
@Table(name = "TDCS_STATUS")
public class Status {

    @Id
    @Column(name = "STATUS_ID")
    private Integer id;

    @Column(name = "STATUS_NAME")
    private String name;

    @Column(name = "STATUS_DESCRIPTION")
    private String description;

//    @OneToMany(mappedBy = "status")
//    private Set<SubCategory> subCategories;

    @OneToMany(mappedBy = "status")
    private Set<Question> questions;

    @OneToMany(mappedBy = "status")
    private Set<Choice> choices;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Set<Choice> getChoices() {
        return choices;
    }

    public void setChoices(Set<Choice> choices) {
        this.choices = choices;
    }
}
