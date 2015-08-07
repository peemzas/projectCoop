package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Service
public class QueryCategoryDomain extends HibernateUtil {

    public void insertCategory(Category category){

        beginTransaction();
        getSession().save(category);
        commitTransaction();

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
        criteria.add(Restrictions.eq("name",name));
        Category resultCategory = (Category)criteria.list().get(0);

        return resultCategory;
    }

}

