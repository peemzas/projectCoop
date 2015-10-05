package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.ExamMarkingRecord;
import com.springapp.mvc.util.HibernateUtil;
import org.springframework.stereotype.Service;

/**
 * Created by PTang_000 on 05-Oct-15.
 */
@Service
public class QueryMarkingRecord extends HibernateUtil{
    public void saveMarkingRecord(ExamMarkingRecord markingRecord){
        getSession().save(markingRecord);
    }


}
