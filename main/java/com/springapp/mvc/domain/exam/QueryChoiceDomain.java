package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Choice;
import com.springapp.mvc.pojo.exam.Question;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Phuthikorn_T on 8/11/2015.
 */
@Service
public class QueryChoiceDomain extends HibernateUtil {
    @Autowired
    QueryBooDomain queryBooDomain;

    @Autowired
    QueryStatusDomain queryStatusDomain;

    public void insertAllChoice(Question question,List<String> description, int correctChoice) {

        List<Choice> choiceList = new ArrayList<Choice>();
        for (int i = 0; i < description.size(); i++) {
            Choice choice = new Choice();

            choice.setDescription(description.get(i));
            choice.setQuestion(question);

            System.out.println(choice.getId());
            System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
            choice.setStatus(queryStatusDomain.getReadyStatus());

            if (i+1 == correctChoice) { // choice correction range 1~4
                choice.setCorrection(queryBooDomain.getTrue());
            }else{
                choice.setCorrection(queryBooDomain.getFalse());
            }

            choiceList.add(choice);
        }

        beginTransaction();
        for (Choice c : choiceList){
            getSession().save(c);
        }
        commitTransaction();


    }

    public List<Choice> getChoiceListByQuestionId(Integer questionId){
        Criteria criteria = getSession().createCriteria(Choice.class);

        criteria.createAlias("question","quest");

        criteria.add(Restrictions.eq("quest.id", questionId));


        return (List<Choice>) criteria.list();
    }
}
