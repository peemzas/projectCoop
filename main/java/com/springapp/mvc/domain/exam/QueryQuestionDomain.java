package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Choice;
import com.springapp.mvc.pojo.exam.Question;
import com.springapp.mvc.util.HibernateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Phuthikorn_T on 8/11/2015.
 */
@Service
public class QueryQuestionDomain extends HibernateUtil{

    @Autowired
    QueryChoiceDomain queryChoiceDomain;

    public void insertQuestion(Question question,List<String> cDesc,Integer correctChoice){

        beginTransaction();
        getSession().save(question);

        commitTransaction();
//        getSession().flush();

        System.out.println(question.getDescription());
        System.out.println("=============================================================================");
        System.out.println(question.getId());



        queryChoiceDomain.insertAllChoice(question, cDesc, correctChoice);

        closeSession();
    }

}
