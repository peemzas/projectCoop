package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by Phuthikorn_T 6/30/2015.
 */

@Entity
@Table(name="TDCS_CATEGORIES")
public class Category implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_CATEGORY_ID_SEQ_GEN")
    @SequenceGenerator(name = "TDCS_CATEGORY_ID_SEQ_GEN", sequenceName = "TDCS_CATEGORY_SEQ")
    @Column(name="CATEGORY_ID")
    private  Integer id;

    @Column(name="CATEGORY_NAME",unique = true)
    private String name;



    @ManyToOne
    @JoinColumn(name="CATEGORY_CREATE_BY")
    private User createBy;

    @OneToMany(mappedBy = "categoryId")
    private Set<SubCategory> subCategories;


    @Override
    public String toString() {
        return "Category{" +
                "createBy=" + createBy +
                ", name='" + name + '\'' +
                ", id=" + id +
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

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    public Set<SubCategory> getSubCategories() {
        return subCategories;
    }

    public void setSubCategories(Set<SubCategory> subCategories) {
        this.subCategories = subCategories;
    }
}
