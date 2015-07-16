package com.springapp.mvc.pojo.exam;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by Phuthikorn_T on 6/30/2015.
 */


@Entity
@Table(name="TDCS_DIFFICULTIES")
public class Difficulty implements Serializable {

    @Id
    @Column(name = "DIFFICULTY_LEVEL")
    private Integer level;

    @Column(name = "DIFFICULTY_DESCRIPTION")
    private String description;

    @OneToMany(mappedBy = "difficultyLevel")
    private Set<Question> questions;


    @Override
    public String toString() {
        return "Difficulty{" +
                "description='" + description + '\'' +
                ", level=" + level +
                '}';
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
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
