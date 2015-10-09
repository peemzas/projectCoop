package com.springapp.mvc.domain.exam;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.*;
import com.springapp.mvc.util.DateUtil;
import com.springapp.mvc.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.*;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
    @Autowired


    
    private static final Logger logger = Logger.getLogger(QueryQuestionDomain.class.getName());
    public void insertQuestion(Question question, List<String> cDesc, Integer correctChoice) {

        beginTransaction();
        getSession().save(question);

//        getSession().flush();

        if (question.getQuestionType().getId() == 1) {
            queryChoiceDomain.insertAllChoice(question, cDesc, correctChoice);
        }
        commitTransaction();

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
        return (Question)criteria.uniqueResult();
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
        criteria.createAlias("q.createBy", "createBy");
        criteria.createAlias("q.status", "status");
        criteria.createAlias("q.difficultyLevel","difficulty");
        criteria.addOrder(Order.asc("subCategory.category")).addOrder(Order.asc("subCategory")).addOrder(Order.asc("id")).addOrder(Order.asc("difficulty.level"));
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
                Criterion createByCriterion = Restrictions.eq("q.createBy",user);
                Criterion updateByCriterion = Restrictions.eq("q.createBy",user);
                criteria.add(Restrictions.or(createByCriterion,updateByCriterion));

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
                Criterion createDateCriterion = Restrictions.ge("q.createDate",dateFrom);
                Criterion updateDateCriterion = Restrictions.ge("q.updateDate",dateFrom);
                criteria.add(Restrictions.or(createDateCriterion,updateDateCriterion));

            }catch (Exception e){
                e.printStackTrace();
            }

        }
        if (createDateTo != null && createDateTo.trim().length()!=0) {
            Date dateTo = null;
            try {
                dateTo = format.parse(createDateTo);
                Criterion createDateCriterion = Restrictions.le("q.createDate",dateTo);
                Criterion updateDateCriterion = Restrictions.le("q.updateDate",dateTo);
                criteria.add(Restrictions.or(createDateCriterion,updateDateCriterion));

            }catch (Exception e){
                e.printStackTrace();
                System.out.println(e);
            }
        }
        if (scoreFrom != null && scoreFrom.trim().length()!=0){
            criteria.add(Restrictions.ge("q.score", Float.parseFloat(scoreFrom)));
        }
        if (scoreTo != null && scoreTo.trim().length()!=0){
            criteria.add(Restrictions.le("q.score", Float.parseFloat(scoreTo)));
        }
        if (statusId != null && statusId.trim().length()!=0){
            criteria.add(Restrictions.eq("status.id",statusId));
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
//        criteria.add(Restrictions.eq("status",3));
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
                .add(Projections.property("score"), "score"));
        criteria.addOrder(Order.asc("id"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();
        logger.info(questions.toString());
        return questions;
    }

    public List<Question> getQuestionNotInSelected(List qId){

        Criteria criteria = getSession().createCriteria(Question.class);
        criteria.add(Restrictions.not(Restrictions.in("id", qId)));
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("id"), "idz")
                .add(Projections.property("choices"), "choicesz")
                .add(Projections.property("description"), "descriptionz")
                .add(Projections.property("createDate"), "createDatez")
                .add(Projections.property("difficultyLevel"), "difficultyLevelz")
                .add(Projections.property("subCategory"), "subCategoryz")
                .add(Projections.property("questionType"), "questionTypez")
                .add(Projections.property("createBy"), "createByz")
                .add(Projections.property("status"), "statusz")
                .add(Projections.property("score"), "score"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();

        return questions;
    }

    public List<Question> getQuestionListByPaper(ExamPaper ep){

        Criteria criteria = getSession().createCriteria(PaperQuestion.class);
        criteria.add(Restrictions.eq("pk.examPaper", ep));
        List<PaperQuestion> paperQuestions = criteria.list();
        List<Question> questions = new ArrayList<Question>();

        for(PaperQuestion p : paperQuestions){
            questions.add(p.getQuestion());
        }

        return questions;
    }

    public List<Question> generalSearchQuestion(List users, Integer subId, List<Integer> qIds){

        Criteria criteria = getSession().createCriteria(Question.class);
        if(users != null){
            criteria.add(Restrictions.in("createBy.id", users));
        }
        if(subId != 0){
            criteria.add(Restrictions.eq("subCategory.id", subId));
        }
        if(qIds.size() != 0){
            criteria.add(Restrictions.not(Restrictions.in("id", qIds)));
        }
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("id"), "ids")
                .add(Projections.property("choices"), "choicess")
                .add(Projections.property("description"), "descriptions")
                .add(Projections.property("createDate"), "createDates")
                .add(Projections.property("difficultyLevel"), "difficultyLevels")
                .add(Projections.property("subCategory"), "subCategorys")
                .add(Projections.property("questionType"), "questionTypes")
                .add(Projections.property("createBy"), "createBys")
                .add(Projections.property("status"), "statuss")
                .add(Projections.property("score"), "scores"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();

        return  questions;
    }

    public List<Question> advanceSearchQuestion(List users, Integer subId, List<Integer> qIds, String qDesc, String qCreateDateFrom, String qCreateDateTo, String qScoreFrom, String qScoreTo) throws ParseException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy",Locale.US);
        Date dateFrom = null;
        Date dateTo = null;
        if(!qCreateDateFrom.equals("")){
            dateFrom = simpleDateFormat.parse(qCreateDateFrom);
        }
        if(!qCreateDateTo.equals("")){
            dateTo = simpleDateFormat.parse(qCreateDateTo);
        }
        Float scoreFrom = null;
        Float scoreTo = null;

        if (!qScoreFrom.equals("")) {
            scoreFrom = Float.parseFloat(qScoreFrom);
        }
        if (!qScoreTo.equals("")) {
            scoreTo = Float.parseFloat(qScoreTo);
        }

        Criteria criteria = getSession().createCriteria(Question.class);

        if (users != null) {
            criteria.add(Restrictions.in("createBy.id", users));
        }
        if (!subId.equals("")) {
            criteria.add(Restrictions.eq("subCategory.id", subId));
        }
        if (qIds.size() != 0) {
            criteria.add(Restrictions.not(Restrictions.in("id", qIds)));
        }
        if (!qDesc.equals("")) {
            criteria.add(Restrictions.like("description", "%" + qDesc + "%"));
        }
        if (!qCreateDateFrom.equals("")) {
            criteria.add(Restrictions.ge("createDate", dateFrom));
        }
        if (!qCreateDateTo.equals("")) {
            criteria.add(Restrictions.le("createDate", dateTo));
        }
        if (!qScoreFrom.equals("")) {
            criteria.add(Restrictions.ge("score", scoreFrom));
        }
        if (!qScoreTo.equals("")) {
            criteria.add(Restrictions.le("score", scoreTo));
        }
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("id"), "ids")
                .add(Projections.property("choices"), "choicess")
                .add(Projections.property("description"), "descriptions")
                .add(Projections.property("createDate"), "createDates")
                .add(Projections.property("difficultyLevel"), "difficultyLevels")
                .add(Projections.property("subCategory"), "subCategorys")
                .add(Projections.property("questionType"), "questionTypes")
                .add(Projections.property("createBy"), "createBys")
                .add(Projections.property("status"), "statuss")
                .add(Projections.property("score"), "scores"));
        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();

        return questions;
    }
}
