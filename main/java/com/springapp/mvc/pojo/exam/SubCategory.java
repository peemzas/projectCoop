package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by Phuthikorn_T on 6/30/2015.
 */

@Entity
@Table(name="TDCS_SUB_CATEGORIES")
public class SubCategory implements Serializable {

    @Id
    @Column(name="SUB_CATEGORY_ID")
    private Integer id;

    @Column(name="SUB_CATEGORY_NAME")
    private String name;

    @ManyToOne
    @JoinColumn(name="CATEGORY_ID")
    private Category categoryId;

    @ManyToOne
    @JoinColumn(name="SUB_CATEGORY_CREATEBY")
    private User createBy;

    @OneToMany
    private Set<Question> question;


    @Override
    public String toString() {
        return "SubCategory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", categoryId=" + categoryId +
                ", createBy=" + createBy +
                '}';
    }

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

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    public Set<Question> getQuestion() {
        return question;
    }

    public void setQuestion(Set<Question> question) {
        this.question = question;
    }
}
