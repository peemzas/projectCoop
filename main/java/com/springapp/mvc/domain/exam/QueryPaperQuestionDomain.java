package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamPaper;
import com.springapp.mvc.pojo.exam.PaperQuestion;
import com.springapp.mvc.pojo.exam.Question;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

/**
 * Created by PTang_000 on 06-Oct-15.
 */
@Service
public class QueryPaperQuestionDomain extends HibernateUtil{

    public PaperQuestion getPaperQuestion(ExamPaper examPaper,Question question){
        Criteria criteria = getSession().createCriteria(PaperQuestion.class);
        criteria.add(Restrictions.eq("pk.examPaper",examPaper));
        criteria.add(Restrictions.eq("pk.question",question));

        return (PaperQuestion)criteria.uniqueResult();
    }
}
