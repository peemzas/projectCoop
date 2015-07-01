package com.springapp.mvc.pojo.exam;

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
    @Column(name="CATEGORY_ID")
    private  Integer id;

    @Column(name="CATEGORY_NAME")
    private String name;

    @ManyToOne
    @JoinColumn(name="CATEGORY_CREATEBY")
    private Category createBy;

    @OneToMany(mappedBy = "categoryId")
    private Set<SubCategory> subCategories;


    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", createBy='" + createBy + '\'' +
                '}';
    }

    public Set<SubCategory> getSubCategories() {
        return subCategories;
    }

    public void setSubCategories(Set<SubCategory> subCategories) {
        this.subCategories = subCategories;
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

    public Category getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Category createBy) {
        this.createBy = createBy;
    }
}
