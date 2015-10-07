package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamRecord;
import com.springapp.mvc.pojo.exam.ExamResult;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

/**
 * Created by Phuthikorn_T on 18-Sep-15.
 */
@Service
public class QueryExamRecordDomain extends HibernateUtil{

    public void saveExamRecord(ExamRecord examRecord){
//        beginTransaction();
        getSession().save(examRecord);
//        commitTransaction();
    }

    public ExamRecord getExamRecordById(Integer id){
        Criteria criteria = getSession().createCriteria(ExamRecord.class);
        criteria.add(Restrictions.eq("id", id));
        return (ExamRecord)criteria.uniqueResult();
    }

    public Boolean isPreTest(ExamRecord examRecord){
        Criteria criteria = getSession().createCriteria(ExamRecord.class);
        criteria.add(Restrictions.eq("paper",examRecord.getPaper()));
        criteria.add(Restrictions.eq("user",examRecord.getUser()));
//        criteria.add(Restrictions.eq("isPreTest"),true);
        return criteria.list().isEmpty();
    }

}
