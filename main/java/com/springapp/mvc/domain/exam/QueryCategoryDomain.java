package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Service
public class QueryCategoryDomain extends HibernateUtil{

    public List insertCategory(Category category){

        beginTransaction();
        getSession().save(category);
        commitTransaction();

        closeSession();

        return new ArrayList();
    }
}
