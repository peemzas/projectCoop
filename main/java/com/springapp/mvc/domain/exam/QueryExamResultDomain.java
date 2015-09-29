package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamResult;
import com.springapp.mvc.util.HibernateUtil;
import org.springframework.stereotype.Service;

/**
 * Created by PTang_000 on 29-Sep-15.
 */
@Service
public class QueryExamResultDomain extends HibernateUtil{
    public void saveExamResult(ExamResult examResult){
        getSession().save(examResult);
    }
}
