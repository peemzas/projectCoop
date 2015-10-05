package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamPaper;
import com.springapp.mvc.pojo.exam.PaperQuestion;
import com.springapp.mvc.pojo.exam.Question;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import sun.security.krb5.Config;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.security.auth.login.AppConfigurationEntry;
import javax.security.auth.login.Configuration;
import java.awt.print.Paper;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Phuthikorn_T on 8/11/2015.
 */
@Service
public class QueryPaperDomain extends HibernateUtil {

    public ExamPaper getPaperById(Integer paperId) {
        Criteria criteria = getSession().createCriteria(ExamPaper.class);
        criteria.add(Restrictions.eq("id", paperId));

        return (ExamPaper) criteria.uniqueResult();
    }

//    Add By Mr.Wanchana
    public void createPaper(ExamPaper examPaper, List<Integer> qIds, List<Float> newScores){
        HibernateUtil.beginTransaction();
        getSession().save(examPaper);
        HibernateUtil.commitTransaction();
        closeSession();
        ExamPaper examP = new ExamPaper();
        String code = examPaper.getCode();
        examP = getExamPaperByCode(code);
        createPaperQuestion(examP, qIds, newScores);
    }

    public void createPaperQuestion(ExamPaper examPaper, List<Integer> qIds, List<Float> newScores){
        HibernateUtil.beginTransaction();
        QueryQuestionDomain queryQuestionDomain = new QueryQuestionDomain();
        for(int i = 0; i < qIds.size(); i++){
            PaperQuestion paperQuestion = new PaperQuestion();
            paperQuestion.setExamPaper(examPaper);
            paperQuestion.setQuestion(queryQuestionDomain.getQuestionById(qIds.get(i)));
            paperQuestion.setScore(newScores.get(i));
            getSession().save(paperQuestion);
        }
        HibernateUtil.commitTransaction();
        closeSession();
    }

    public static ExamPaper getExamPaperByCode(String code){
        Criteria criteria = getSession().createCriteria(ExamPaper.class);
        criteria.add(Restrictions.eq("code", code));
        ExamPaper examPaper = (ExamPaper) criteria.list().get(0);

        return examPaper;
    }

    public List<ExamPaper> getAllPapers(){
        Criteria criteria = getSession().createCriteria(ExamPaper.class);
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("id"), "id")
                .add(Projections.property("name"), "name")
                .add(Projections.property("createDate"), "createDate")
                .add(Projections.property("createBy"), "createBy")
                .add(Projections.property("maxScore"), "maxScore")
                .add(Projections.property("code"), "code")
                .add(Projections.property("updateDate"), "updateDate")
                .add(Projections.property("updateBy"), "updateBy")
                .add(Projections.property("timeLimit"), "timeLimit")
                .add(Projections.property("position"), "position")
                .add(Projections.property("paperStatus"), "paperStatus"));
        criteria.addOrder(Order.asc("id"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<ExamPaper> papers = criteria.list();

        return papers;
    }

    public void deletePaper(ExamPaper examPaper, int paperId){
//        for(Integer i: paperId){
//            ExamPaper examPaper = getPaperById(paperId.get(i));
//            getSession().delete(examPaper);
//            HibernateUtil.commitTransaction();
//        }
        HibernateUtil.beginTransaction();
        deletePaperQuestionByPaperId(examPaper);
        getSession().delete(examPaper);
        HibernateUtil.commitTransaction();
    }

    public void deletePaperQuestionByPaperId(ExamPaper examPaper){

        Criteria criteria = getSession().createCriteria(PaperQuestion.class);
        criteria.add(Restrictions.eq("pk.examPaper", examPaper));
        PaperQuestion paperQuestion = (PaperQuestion) criteria.list().get(0);
//        String statment = "delete from PaperQuestion where PaperQuestion.pk =: examPaper";
//        Query query = getSession().createQuery(statment);
        getSession().delete(paperQuestion);
    }
//    public void updatePaper(ExamPaper updateExampaper, List<Integer>updateQIds, List<Float> updateScores){
//
//    }
    public void updatePaperStatus(ExamPaper examPaper){

        HibernateUtil.beginTransaction();
        getSession().merge(examPaper);
        HibernateUtil.commitTransaction();
        HibernateUtil.closeSession();
    }
}
