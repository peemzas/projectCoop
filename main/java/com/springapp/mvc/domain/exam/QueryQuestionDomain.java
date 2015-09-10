package com.springapp.mvc.domain.exam;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.pojo.exam.Choice;
import com.springapp.mvc.pojo.exam.Question;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.*;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
    @Autowired
    QueryCategoryDomain queryCategoryDomain;
    @Autowired
    QueryUserDomain queryUserDomain;


    
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
        projectionList.add(Projections.property("status.id"), "statusId");
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
        criteria.addOrder(Order.asc("q.id"));
        criteria.setProjection(projectionList);


        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();

        return questions;
    }

    public Question getQuestionById(Integer id){
        Criteria criteria = getSession().createCriteria(Question.class);
        criteria.add(Restrictions.eq("id", id));
        return (Question)criteria.list().get(0);
    }

    public void deleteQuestion(Integer id){
        Question question = getQuestionById(id);
        beginTransaction();
        getSession().delete(question);
        commitTransaction();
    }

    public List<Question> searchQuestionQuery(String categoryId, String subCategoryName,
                                              String createById, String questionId,
                                              String questionDesc, String createDateFrom,
                                              String createDateTo, String scoreFrom,
                                              String scoreTo, String statusId){

        Criteria criteria = getSession().createCriteria(Question.class, "q");
        criteria.createAlias("q.subCategory","subCategory");
        criteria.createAlias("q.createBy","createBy");
        if (categoryId != null){
            Category category = queryCategoryDomain.getCategoryById(categoryId);
            criteria.add(Restrictions.eq("subCategory.category",category));
            if (subCategoryName != null){
                criteria.add(Restrictions.eq("subCategory",querySubCategoryDomain.getSubCategoryByNameAndCategory(subCategoryName,category)));
            }
        }
        if (createById != null && createById.trim().length()!=0){
            try{
                User user = queryUserDomain.getUserById(Integer.parseInt(createById));
                criteria.add(Restrictions.eq("q.createBy",user));
            }catch (NumberFormatException ne){
                System.out.println("error in parsing createBy");
                ne.printStackTrace();
            }
        }
        if (questionId != null && questionId.trim().length()!=0){
            try{
                criteria.add(Restrictions.eq("q.id", Integer.parseInt(questionId)));
            }catch (Exception e){
                System.out.println("error in parsing questiopnId from String to Integer");
                e.printStackTrace();
            }

        }
        if (questionDesc != null && questionDesc.trim().length()!=0){
            criteria.add(Restrictions.like("q.description", "%" + questionDesc + "%"));
        }
        DateFormat format = new SimpleDateFormat("dd/MM/yyyy");

        if (createDateFrom != null && createDateFrom.trim().length()!=0) {
            Date dateFrom = null;
            try {
                dateFrom = format.parse(createDateFrom);
                System.out.println("DATEFROM");
                System.out.println(dateFrom);
                System.out.println("HOORAYYY");
                criteria.add(Restrictions.ge("q.createDate",dateFrom));
            }catch (Exception e){
                e.printStackTrace();
                System.out.println(e);
            }

        }
        if (createDateTo != null && createDateTo.trim().length()!=0) {
            Date dateTo = null;
            try {
                dateTo = format.parse(createDateTo);
                System.out.println("DATE TO");
                System.out.println(dateTo);
                System.out.println("HOORAHHH");
                System.out.println("");
                Disjunction disjunction = Restrictions.disjunction();
                disjunction.add(Restrictions.le("q.createDate", dateTo));
                disjunction.add(Restrictions.eq("q.createDate", dateTo));
                criteria.add(disjunction);
            }catch (Exception e){
                e.printStackTrace();
                System.out.println(e);
            }
        }
        if (scoreFrom != null && scoreFrom.trim().length()!=0){
            criteria.add(Restrictions.ge("q.score", Float.parseFloat(scoreFrom)));
        }
        if (scoreTo != null && scoreTo.trim().length()!=0){
            criteria.add(Restrictions.le("q.score",Float.parseFloat(scoreTo)));
        }

        criteria.addOrder(Order.asc("q.id"));
        return criteria.list();
    }

    public void mergeQuestion(Question question){
        beginTransaction();
        getSession().merge(question);
        commitTransaction();
        closeSession();
    }


//    Add by Mr.Wanchana

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
        criteria.addOrder(Order.asc("id"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();
        logger.info(questions.toString());
        return questions;
    }
//
//    public List<User> getUserIdByNames(List empName){
//
//        String queryStatement = "select userId from User where thFname in(:empName)";
//        Query query = getSession().createQuery(queryStatement);
//        query.setParameterList("empName", empName);
//        List<User> userIds = query.list();
//        logger.info(userIds.toString());
//
//        return userIds;
//    }


    public List<User> getUserIdByName(List empName){

        String queryStatement = "select userId from User where thFname in(:empName)";
        Query query = getSession().createQuery(queryStatement);
        query.setParameterList("empName", empName);
        List<User> userIds = query.list();
        logger.info(userIds.toString());

        return userIds;
    }

//    public List<Question> generalSearchQuestion(List<User> empIds, String catId, String subId, String empName){
//
////        String queryStatement = "select id, description, score from Question where createBy.userId in(:empId)";
////        Query query = getSession().createQuery(queryStatement);
////        query.setParameterList("empId" ,empId);
////        List<Question> questions = query.list();
////        logger.info(">" +questions.toString());
////
////        return questions;
//        if((empIds != null) && (catId != "") && (subId != null) && (empName != null)){
//            String queryStatement = "select id, description, score from Question where createBy.userId in(:empIds)" +
//                                    "and category.id =: catId";

//    public String getUserIdBuName(String name){
//
//        String queryStatement = "select userId from User where thFname =:name";
//        Query query = getSession().createQuery(queryStatement);
//        query.setParameter("name", name);
//        String userId = query.toString();
//
//        return userId;
//    }

//    public List<Question> generalSearchQuestion(List<User> empIds, String subId){
//
//        String queryStatement = "select id, description, score from Question where createBy.userId in(:empId)";
//        Query query = getSession().createQuery(queryStatement);
//        query.setParameterList("empId" ,empId);
//        List<Question> questions = query.list();
//        logger.info(">" +questions.toString());
//
//        return questions;
//        if((empIds != null) && (subId != null)){
//            String queryStatement = "select id, description, score from Question where createBy.userId in(:empIds)" +
//                                    "and subCategory.id =: subId";

//            Query query = getSession().createQuery(queryStatement);
//            query.setParameterList("empIds" ,empIds);
//            List<Question> questions = query.list();
//            logger.info(">" +questions.toString());
//
//            return questions;
//        }

//        return null;

//    }
}
