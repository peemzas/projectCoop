package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamPaper;
import com.springapp.mvc.pojo.exam.PaperQuestion;
import com.springapp.mvc.pojo.exam.Question;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

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
        HibernateUtil.beginTransaction();
        Criteria criteria = getSession().createCriteria(ExamPaper.class);
        criteria.add(Restrictions.eq("code", code));
        ExamPaper examPaper = (ExamPaper) criteria.list().get(0);

        return examPaper;
    }

    public List<ExamPaper> getAllPapers(){
        HibernateUtil.beginTransaction();
        Criteria criteria = getSession().createCriteria(ExamPaper.class);
        List<ExamPaper> papers = criteria.list();
        HibernateUtil.commitTransaction();
        closeSession();

        return papers;
    }

    public void deletePaper(List<Integer> paperId){
        HibernateUtil.beginTransaction();
        for(Integer i: paperId){
            ExamPaper examPaper = getPaperById(paperId.get(i));
            getSession().delete(examPaper);
            HibernateUtil.commitTransaction();
        }
        HibernateUtil.commitTransaction();
    }

    public void updatePaper(ExamPaper updateExampaper, List<Integer>updateQIds, List<Float> updateScores){

    }
}
