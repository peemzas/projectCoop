package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Service
public class QueryCategoryDomain extends HibernateUtil {

    public void insertCategory(Category category){

        HibernateUtil.beginTransaction();
        getSession().save(category);
        HibernateUtil.commitTransaction();
        closeSession();
    }



//    public boolean checkDuplicateName(String name) {
//        Criteria criteria = getSession().createCriteria(Category.class);
//        criteria.add(Restrictions.eq("name", name));
//        boolean result = criteria.list().isEmpty();
//        return result;
//    }

    public Category getCategoryByName(String name){
        Criteria criteria = getSession().createCriteria(Category.class);
        criteria.add(Restrictions.eq("name", name));
        Category resultCategory = (Category)criteria.list().get(0);

        return resultCategory;
    }

    public List<Map> getListCategories(){

        Criteria criteria = getSession().createCriteria(Category.class);
        criteria.addOrder(Order.asc("id"));
        criteria.setProjection(Projections.projectionList().add(Projections.property("name"), "name").add(Projections.property("id"),"id"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map> categories = criteria.list();
        return categories;
    }

//    public Category getCategoryById(Integer id){
//        Criteria criteria = getSession().createCriteria(Category.class);
//        criteria.add(Restrictions.eq("id",id));
//
//        return (Category)criteria.list().get(0);
//    }
}

