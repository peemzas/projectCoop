package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.pojo.exam.SubCategory;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
<<<<<<< HEAD
import org.hibernate.transform.Transformers;
=======
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> CreateQuestionModal Controller Complete!!!!
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

    public List<Map> getListSubCategories(){
        Criteria criteria = getSession().createCriteria(SubCategory.class);
        criteria.setProjection(Projections.projectionList().add(Projections.property("name"), "name").add(Projections.property("id"),"id"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map> subcategories = criteria.list();
        return subcategories;
    }
    
    public SubCategory getSubCategoryByNameAndCategory(String name,Category category){
        Criteria criteria = getSession().createCriteria(SubCategory.class);
        criteria.add(Restrictions.eq("name",name));
        criteria.add(Restrictions.eq("category", category));

        return (SubCategory)criteria.list().get(0);
    }


}
