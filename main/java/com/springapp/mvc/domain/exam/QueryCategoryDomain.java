package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.util.BeanUtils;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Service
public class QueryCategoryDomain extends HibernateUtil {

    public static final Logger logger = Logger.getLogger(Category.class.getName());

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

    public Category getCategoryById(String id){
        Criteria criteria = getSession().createCriteria(Category.class);
        criteria.add(Restrictions.eq("id", id));
        List<Category> categories = criteria.list();

        if (categories.isEmpty())
        {
            return null;
        }else {
            return categories.get(0);
        }
//        Category resultCategory = (Category)criteria.list().get(0);
//        return resultCategory;
    }

    //------------Add by Mr.Wanchana
    public List<Category> getListCategories(){

        Criteria criteria = getSession().createCriteria(Category.class);
        criteria.addOrder(Order.asc("id"));
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("name"), "name")
                .add(Projections.property("id"), "id"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Category> categories = criteria.list();

        return categories;
    }

    public void deleteCategory(String categoryId){

        Criteria criteria = getSession().createCriteria(Category.class);
        criteria.add(Restrictions.eq("id", categoryId));
        Category category = (Category) criteria.uniqueResult();

        HibernateUtil.beginTransaction();
        getSession().delete(category);
        HibernateUtil.commitTransaction();
    }

    public void editCategory(Category category){

        logger.info(category.getId()+"---------------------------"+category);
        HibernateUtil.beginTransaction();

        getSession().update(category);
//        Category category = new Category();

//        if((id != oldId) && (name != oldName)){
//            String updateQueryStatement = "update Category set id = :id, name = :name where id = :oldId";
//            Query query = getSession().createQuery(updateQueryStatement);
//            query.setParameter("id", id);
//            query.setParameter("name", name);
//            query.setParameter("oldId", oldId);
//            HibernateUtil.commitTransaction();
//        }
//        else if(id != oldId){
//            String updateQueryStatement = "update Category set id = :id where id = :oldId";
//            Query query = getSession().createQuery(updateQueryStatement);
//            query.setParameter("id", id);
//            query.setParameter("oldId", oldId);
//            HibernateUtil.commitTransaction();
//        }
//        else if(name != oldName){
//            String updateQueryStatement = "update Category set name = :name, name = :name where id = :oldId";
//            Query query = getSession().createQuery(updateQueryStatement);
//            query.setParameter("name", name);
//            query.setParameter("oldId", oldId);
//            HibernateUtil.commitTransaction();
//        }
//        else{
//            HibernateUtil.commitTransaction();
//        }
        HibernateUtil.commitTransaction();
    }

    public List<Category> searchCategory(String  categoryId, String categoryName){

//        categoryId.toLowerCase();
//        categoryName.toLowerCase();

        logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+categoryId.toLowerCase()+" "+categoryName.toLowerCase());

//        if(categoryId != null && categoryName != null){
//            String queryStatement = "from Category where lower(name) like : categoryName and lower(id) like : categoryId";
//            Query query = getSession().createQuery(queryStatement);
//            query.setParameter("categoryName", "%" + categoryName + "%");
//            query.setParameter("categoryId", "%" + categoryId + "%");
//            List<Category> categories = query.list();
//            return categories;
//        }

        if(categoryId == ""){
// in case sensitive
//            String queryStatement = "from Category where name like :categoryName";
            String queryStatement = "from Category where lower(name) like :categoryName";
            Query query = getSession().createQuery(queryStatement);
            query.setParameter("categoryName", "%" + categoryName + "%");
            List<Category> categories = query.list();

            return categories;
        }
        else if(categoryName == ""){

            String queryStatement = "from Category where lower(id) like :categoryId";
            Query query = getSession().createQuery(queryStatement);
            query.setParameter("categoryId", "%" + categoryId + "%");
            List<Category> categories = query.list();

            return categories;
        }
        else {
            String queryStatement = "from Category where lower(id) like :categoryId and lower(name) like :categoryName order by id";
            Query query = getSession().createQuery(queryStatement);
            query.setParameter("categoryId", "%" + categoryId + "%");
            query.setParameter("categoryName", "%" + categoryName + "%");
            List<Category> categories = query.list();

            return categories;
        }
        //criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
    }
}

