package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.QuestionType;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

/**
 * Created by Phuthikorn_T on 8/11/2015.
 */
@Service
public class QueryQuestionTypeDomain extends HibernateUtil{

    public QuestionType getQuestionTypeById(Integer id){
        Criteria criteria = getSession().createCriteria(QuestionType.class);
        criteria.add(Restrictions.eq("id", id));
        return (QuestionType)criteria.list().get(0);
    }
}
