package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Status;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

/**
 * Created by Phuthikorn_T on 8/11/2015.
 */
@Service
public class QueryStatusDomain extends HibernateUtil{

    public Status getReadyStatus(){
        Criteria criteria = getSession().createCriteria(Status.class);
        criteria.add(Restrictions.eq("id", 3));

        Status result = (Status)criteria.list().get(0);
        System.out.println(result.getDescription());

        return result;
    }

    public Status getDeletedStatus(){
        Criteria criteria = getSession().createCriteria(Status.class);
        criteria.add(Restrictions.eq("id", 4));
        return (Status)criteria.list().get(0);
    }

    public Status getOpenStatus(){
        Criteria criteria = getSession().createCriteria(Status.class);
        criteria.add(Restrictions.eq("id", 1));
        return (Status)criteria.list().get(0);
    }

    public Status getCloseStatus(){
        Criteria criteria = getSession().createCriteria(Status.class);
        criteria.add(Restrictions.eq("id", 2));
        return (Status)criteria.list().get(0);
    }

    public Status getStatusById(Integer id){
        Criteria criteria = getSession().createCriteria(Status.class);
        criteria.add(Restrictions.eq("id", id));
        return (Status)criteria.list().get(0);
    }
}
