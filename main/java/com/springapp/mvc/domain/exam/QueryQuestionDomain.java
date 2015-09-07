package com.springapp.mvc.domain.exam;

import com.springapp.mvc.pojo.exam.Choice;
import com.springapp.mvc.pojo.exam.Question;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by Phuthikorn_T on 8/11/2015.
 */
@Service
public class QueryQuestionDomain extends HibernateUtil {

    @Autowired
    QueryChoiceDomain queryChoiceDomain;
    @Autowired
    QuerySubCategoryDomain querySubCategoryDomain;
    @Autowired
    QueryStatusDomain queryStatusDomain;


    
    private static final Logger logger = Logger.getLogger(QueryQuestionDomain.class.getName());
    public void insertQuestion(Question question, List<String> cDesc, Integer correctChoice) {

        beginTransaction();
        getSession().save(question);

        commitTransaction();
//        getSession().flush();

        if (question.getQuestionType().getId() == 1) {
            queryChoiceDomain.insertAllChoice(question, cDesc, correctChoice);
        }

        closeSession();
    }

    public List<Question> getAllQuestion() {
        Criteria criteria = getSession().createCriteria(Question.class, "q");

        criteria.createAlias("q.createBy","createBy");
//        criteria.createAlias("q.subCategory.category","category");
        criteria.createAlias("q.subCategory","subCategory");
        criteria.createAlias("subCategory.category","category");
        criteria.createAlias("q.questionType","questionType");
        criteria.createAlias("q.status","status");
        criteria.createAlias("q.difficultyLevel","difficulty");
//        criteria.createAlias("","");

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("createBy.userName"),"createByEmpId");
        projectionList.add(Projections.property("q.id"),"id");
        projectionList.add(Projections.property("q.description"),"description");
        projectionList.add(Projections.property("q.score"),"score");
        projectionList.add(Projections.property("q.createDate"),"createDate");
        projectionList.add(Projections.property("difficulty.description"),"difficultyDesc");
        projectionList.add(Projections.property("category.name"),"categoryName");
        projectionList.add(Projections.property("subCategory.name"),"subCategoryName");
        projectionList.add(Projections.property("questionType.description"),"questionTypeDesc");
        projectionList.add(Projections.property("status.id"),"statusId");
//        projectionList.add(Projections.property(""),"");

        criteria.setProjection(projectionList);


        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();

        return questions;
    }

    public List<Question> getAllReadyQuestion() {
        Criteria criteria = getSession().createCriteria(Question.class, "q");
        criteria.add(Restrictions.eq("status",queryStatusDomain.getReadyStatus()));

        criteria.createAlias("q.createBy","createBy");
//        criteria.createAlias("q.subCategory.category","category");
        criteria.createAlias("q.subCategory","subCategory");
        criteria.createAlias("subCategory.category","category");
        criteria.createAlias("q.questionType","questionType");
        criteria.createAlias("q.status","status");
        criteria.createAlias("q.difficultyLevel","difficulty");
//        criteria.createAlias("","");

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("createBy.userName"),"createByEmpId");
        projectionList.add(Projections.property("q.id"),"id");
        projectionList.add(Projections.property("q.description"),"description");
        projectionList.add(Projections.property("q.score"),"score");
        projectionList.add(Projections.property("q.createDate"),"createDate");
        projectionList.add(Projections.property("difficulty.description"),"difficultyDesc");
        projectionList.add(Projections.property("category.name"),"categoryName");
        projectionList.add(Projections.property("subCategory.name"),"subCategoryName");
        projectionList.add(Projections.property("questionType.description"), "questionTypeDesc");
        projectionList.add(Projections.property("status.id"), "statusId");
//        projectionList.add(Projections.property(""),"");

        criteria.setProjection(projectionList);


        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();

        return questions;
    }

    public Question getQuestionById(Integer id){
        Criteria criteria = getSession().createCriteria(Question.class);
        criteria.add(Restrictions.eq("id",id));
        return (Question)criteria.list().get(0);
    }

    public void deleteQuestion(Integer id){
        Question question = getQuestionById(id);
        beginTransaction();
        getSession().delete(question);
        commitTransaction();
    }

    public List<Question> searchQuestionQuery(Integer categoryId, Integer subCategoryId,
                                              String createByUsername, Integer questionId,
                                              String questionDesc, Date createDateFrom,
                                              Date createDateTo, Float scoreFrom,
                                              Float scoreTo, Integer statusId){

        Criteria criteria = getSession().createCriteria(Question.class);




        return criteria.list();
    }

    public void mergeQuestion(Question question){
        beginTransaction();
        getSession().merge(question);
        commitTransaction();
        closeSession();
    }


//    Add by Mr.Wanchana Himself
//    public List<Question> generalQuestionSearch(ArraarrayEmpNameToQuery){
//
//        for(int i = 0; i < arrayEmpNameToQuery.getLength(); i++){
//
//        }
//    }

    public List<Question> getAllQuestionDetail(){

        Criteria criteria = getSession().createCriteria(Question.class);
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("id"), "id")
                .add(Projections.property("choices"), "choices")
                .add(Projections.property("description"), "description")
                .add(Projections.property("createDate"), "createDate")
                .add(Projections.property("difficultyLevel"), "difficultyLevel")
                .add(Projections.property("subCategory"), "subCategory")
                .add(Projections.property("questionType"), "questionType")
                .add(Projections.property("createBy"), "createBy")
                .add(Projections.property("status"), "status")
                .add(Projections.property("examPapers"), "examPapers")
                .add(Projections.property("score"), "score"));

        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();
        logger.info(questions.toString());
        return questions;
    }

    public List<User> getUserIdByName(List empName){

        String queryStatement = "select userId from User where thFname in(:empName)";
        Query query = getSession().createQuery(queryStatement);
        query.setParameterList("empName", empName);
        List<User> userIds = query.list();
        logger.info(userIds.toString());

        return userIds;
    }

    public List<Question> generalSearchQuestion(List<User> empId){


        String queryStatement = "select id, description, score from Question where createBy.userId in(:empId)";
        Query query = getSession().createQuery(queryStatement);
        query.setParameterList("empId" ,empId);
        List<Question> questions = query.list();
        logger.info(">" +questions.toString());

        return questions;
    }
}
