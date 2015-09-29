package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamAnswerRecord;
import com.springapp.mvc.util.HibernateUtil;
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
}
