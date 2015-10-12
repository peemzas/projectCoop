package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.Position;
import com.springapp.mvc.pojo.exam.ExamPaper;
import com.springapp.mvc.pojo.exam.SubCategory;
import com.springapp.mvc.util.HibernateUtil;
import org.apache.poi.util.SystemOutLogger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.springapp.mvc.util.HibernateUtil.closeSession;
import static com.springapp.mvc.util.HibernateUtil.getSession;

/**
 * Created by JobzPC on 7/10/2558.
 */
@Service
public class QueryExamRecordSearchDomain extends HibernateUtil{
    public List<ExamPaper> getQueryExamRecordSearch(String code, Position position) {
        Criteria criteria = getSession().createCriteria(ExamPaper.class,"ep");
        if (code != "") {
            criteria.add(Restrictions.like("ep.code","%"+code+"%"));
        }
        if (position != null) {
            criteria.add(Restrictions.eq("position", position));
        }
        return criteria.list();
    }

}
