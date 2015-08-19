package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.pojo.exam.SubCategory;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.*;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Phuthikorn_T on 8/7/2015.
 */

@Service
public class QuerySubCategoryDomain extends HibernateUtil {


    public void insertSubCategory(SubCategory subCategory){

        beginTransaction();
        getSession().save(subCategory);
        commitTransaction();
        closeSession();
    }
    public boolean checkSubCategoryDuplication(SubCategory subCategory){
        Criteria criteria = getSession().createCriteria(SubCategory.class);
        criteria.add(Restrictions.eq("name", subCategory.getName()));
        criteria.add(Restrictions.eq("category", subCategory.getCategory()));
        boolean result = criteria.list().isEmpty();
        closeSession();

        return result;
    }

    public List<SubCategory> getListSubCategories(){
        Criteria criteria = getSession().createCriteria(SubCategory.class, "subCategory");
        criteria.createAlias("subCategory.category", "category");
        criteria.addOrder(Order.asc("id"));
        ProjectionList projection = Projections.projectionList();

        projection.add(Projections.property("category.id"),"id");
        projection.add(Projections.property("category.name"), "name");
        projection.add(Projections.property("subCategory.id"), "subId");
        projection.add(Projections.property("subCategory.name"), "subName");

        criteria.setProjection(projection);
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);


        List<SubCategory> subCategories = criteria.list();
        return subCategories;
    }
    
    public SubCategory getSubCategoryByNameAndCategory(String name,Category category){
        Criteria criteria = getSession().createCriteria(SubCategory.class, "subCategory");
        criteria.createAlias("subCategory.category", "category");

        ProjectionList projection = Projections.projectionList();
        projection.add(Projections.property("subCategory.name"));
        projection.add(Projections.property("category.id"));
        projection.add(Projections.property("category.name"));

        criteria.setProjection(projection);
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);

        criteria.add(Restrictions.eq("name",name));
        criteria.add(Restrictions.eq("category", category));

        List<SubCategory> subCategories = criteria.list();
        return (SubCategory)subCategories.get(0);
    }


    public void deleteSubCategory(Integer subCategoryId){

        Criteria criteria = getSession().createCriteria(SubCategory.class);
        criteria.add(Restrictions.eq("id", subCategoryId));
//        SubCategory subCategory = (SubCategory) criteria;

//        SubCategory sc = new SubCategory();
//        sc.setId(subCategoryId);
//        getSession().delete(sc);

        HibernateUtil.beginTransaction();
        SubCategory sc = new SubCategory();
        sc.setId(subCategoryId);
        getSession().delete(sc);
        HibernateUtil.commitTransaction();
    }

}

