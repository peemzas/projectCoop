package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.SubCategory;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

/**
 * Created by Phuthikorn_T on 8/7/2015.
 */
@Service
public class QuerySubCategoryDomain extends HibernateUtil {

    public void insertSubCategory(SubCategory subCategory){


        System.out.println(subCategory.getName());
        System.out.println(subCategory.getCategory());
        System.out.println(subCategory.getCreateBy());
        System.out.println(subCategory.getId());

        beginTransaction();
        getSession().save(subCategory);
        commitTransaction();

        closeSession();
    }
    public boolean checkSubCategoryDuplication(SubCategory subCategory){
        Criteria criteria = getSession().createCriteria(SubCategory.class);
        criteria.add(Restrictions.eq("name",subCategory.getName()));
        criteria.add(Restrictions.eq("category",subCategory.getCategory()));

        boolean result = criteria.list().isEmpty();
        closeSession();

        return result;
    }

}
