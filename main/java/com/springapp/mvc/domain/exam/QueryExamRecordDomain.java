package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamRecord;
import com.springapp.mvc.util.HibernateUtil;
import org.springframework.stereotype.Service;

/**
 * Created by Phuthikorn_T on 18-Sep-15.
 */
@Service
public class QueryExamRecordDomain extends HibernateUtil{

    public void saveExamRecord(ExamRecord examRecord){
//        beginTransaction();
        getSession().save(examRecord);
//        commitTransaction();
    }

}
