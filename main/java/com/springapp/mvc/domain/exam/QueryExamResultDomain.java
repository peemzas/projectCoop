package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamRecord;
import com.springapp.mvc.pojo.exam.ExamResult;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

/**
 * Created by PTang_000 on 29-Sep-15.
 */
@Service
public class QueryExamResultDomain extends HibernateUtil{

    public void saveExamResult(ExamResult examResult){
        getSession().save(examResult);
    }
    public ExamResult getExamResultById(Integer id){
        Criteria criteria = getSession().createCriteria(ExamResult.class);
        criteria.add(Restrictions.eq("id", id));
        return (ExamResult)criteria.uniqueResult();
    }
    public ExamResult getExamResultByExamRecord(ExamRecord examRecord){
        Criteria criteria = getSession().createCriteria(ExamResult.class);
        criteria.add(Restrictions.eq("examRecord",examRecord));
        return (ExamResult)criteria.uniqueResult();
    }

    public void updateExamResult(ExamResult examResult){
        getSession().update(examResult);
    }

}
