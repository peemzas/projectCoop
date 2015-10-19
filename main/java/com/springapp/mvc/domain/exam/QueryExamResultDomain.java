package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.ExamRecord;
import com.springapp.mvc.pojo.exam.ExamResult;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PTang_000 on 29-Sep-15.
 */
@Service
public class QueryExamResultDomain extends HibernateUtil {

    @Autowired
    QueryStatusDomain queryStatusDomain;

    public void saveExamResult(ExamResult examResult) {
        getSession().save(examResult);
    }

    public ExamResult getExamResultById(Integer id) {
        Criteria criteria = getSession().createCriteria(ExamResult.class);
        criteria.add(Restrictions.eq("id", id));
        return (ExamResult) criteria.uniqueResult();
    }

    public ExamResult getExamResultByExamRecord(ExamRecord examRecord) {
        Criteria criteria = getSession().createCriteria(ExamResult.class);
        criteria.add(Restrictions.eq("examRecord", examRecord));
        return (ExamResult) criteria.uniqueResult();
    }

    public List<ExamResult> getUserConfirmedResult(User user) {
        Criteria criteria = getSession().createCriteria(ExamResult.class, "result");
        criteria.createAlias("result.examRecord", "record");

        Criterion criterion1 = Restrictions.eq("result.status",queryStatusDomain.getMarkedStatus());
        Criterion criterion2 = Restrictions.eq("result.status", queryStatusDomain.getMarkConfirmedStatus());

        criteria.add(Restrictions.or(criterion1, criterion2));
        criteria.add(Restrictions.eq("record.user", user));
        criteria.add(Restrictions.isNull("record.preTestRecord"));

        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return criteria.list();
    }

    public void updateExamResult(ExamResult examResult) {
        getSession().merge(examResult);
    }

}
