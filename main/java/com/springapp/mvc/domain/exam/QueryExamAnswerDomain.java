package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamAnswerRecord;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

/**
 * Created by Phuthikorn_T on 18-Sep-15.
 */
@Service
public class QueryExamAnswerDomain extends HibernateUtil{

    public void saveExamAnswer(ExamAnswerRecord examAnswerRecord){
//        beginTransaction();
        getSession().save(examAnswerRecord);
//        commitTransaction();
    }

    public ExamAnswerRecord getExamAnswerRecordById(Integer id){
        Criteria criteria = getSession().createCriteria(ExamAnswerRecord.class);
        criteria.add(Restrictions.eq("id",id));
        return (ExamAnswerRecord)criteria.uniqueResult();
    }

}
