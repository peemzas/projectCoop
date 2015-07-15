package com.springapp.mvc.pojo.exam;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by Phuthikorn_T on 7/1/2015.
 */
@Entity
@Table(name="BOOLEAN")
public class Boo implements Serializable {

    @Id
    @Column(name="BOOLEAN_VALUE")
    private Integer value;

    @Column
    private String description;

    @OneToMany(mappedBy = "correction")
    private Set<Choice> choices;





    public boolean getBoolean(){
        if(value == 1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public String toString() {
        return "Boo{" +
                "value=" + value +
                ", description='" + description + '\'' +
                '}';
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Choice> getChoices() {
        return choices;
    }

    public void setChoices(Set<Choice> choices) {
        this.choices = choices;
    }
}
