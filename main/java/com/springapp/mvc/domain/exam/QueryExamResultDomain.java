package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.Position;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.ExamRecord;
import com.springapp.mvc.pojo.exam.ExamResult;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
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

        Criterion criterion1 = Restrictions.eq("result.status", queryStatusDomain.getMarkedStatus());
        Criterion criterion2 = Restrictions.eq("result.status", queryStatusDomain.getMarkConfirmedStatus());

        criteria.add(Restrictions.or(criterion1, criterion2));
        criteria.add(Restrictions.eq("record.user", user));
        criteria.add(Restrictions.isNull("record.preTestRecord"));

        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return criteria.list();
    }
    /**
     * Created by JobzPC on 7/10/2558.
     */
    public List<ExamResult> getAllExamResult(List<Integer> userId,String code,Position posiId) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" select");
        stringBuilder.append(" tep.code,tep.name,tu.thFname,tp.posiName,(preRES.objectiveScore + preRES.subjectiveScore) as Pretest, ");
        stringBuilder.append(" (postRES.objectiveScore + postRES.subjectiveScore) as Postest,tep.maxScore,");
        stringBuilder.append(" (select thFname from User where userId = tep.createBy) as createbyts ,ts.description  ");
        stringBuilder.append(" from ExamRecord preREC,ExamResult preRES,ExamRecord postREC,ExamResult postRES,ExamPaper tep,User tu,Position tp,ExamResult ters,Status ts   ");
        stringBuilder.append(" where preREC.id =preRES.examRecord and postREC.id =  postRES.examRecord and preREC.id = postREC.preTestRecord and tep.id=postREC.paper and    ");
        stringBuilder.append(" tu.userId = preREC.user and tp.posiId=tep.position and ters.examRecord=preREC.id and ts.id = ters.status     ")  ;

        if (!(code.equals(""))) {
            stringBuilder.append(" and   tep.code =  '" + code + "' ");
        }
        if (posiId != null) {
            stringBuilder.append(" and   tp.posiId =  '" + posiId.getPosiId() + "' ");
        }

        if (userId.size()!=0){
            stringBuilder.append(" and tep.createBy in (");
            for (int i =0 ; i< userId.size();i++){
                stringBuilder.append(" '" + userId.get(i) + "' ");
                if(i != userId.size()-1){
                    stringBuilder.append(" , ");
                }

            }
            stringBuilder.append(" )");
        }
//        Criteria criteria = getSession().createCriteria(ExamResult.class,"ex");
//        criteria.add(Restrictions)
        Session session = (Session) HibernateUtil.getSession();
        Query query = session.createQuery(stringBuilder.toString());


        List<ExamResult> empList = query.list();
        return empList;
    }

    public void updateExamResult(ExamResult examResult) {
        getSession().merge(examResult);
    }

}
