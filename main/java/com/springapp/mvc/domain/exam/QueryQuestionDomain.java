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
import org.json.JSONArray;
import org.json.JSONException;
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

        criteria.createAlias("q.createBy", "createBy");
//        criteria.createAlias("q.subCategory.category","category");
        criteria.createAlias("q.subCategory", "subCategory");
        criteria.createAlias("subCategory.category", "category");
        criteria.createAlias("q.questionType", "questionType");
        criteria.createAlias("q.status", "status");
        criteria.createAlias("q.difficultyLevel", "difficulty");
//        criteria.createAlias("","");

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("createBy.userName"), "createByEmpId");
        projectionList.add(Projections.property("q.id"), "id");
        projectionList.add(Projections.property("q.description"), "description");
        projectionList.add(Projections.property("q.score"), "score");
        projectionList.add(Projections.property("q.createDate"), "createDate");
        projectionList.add(Projections.property("difficulty.description"), "difficultyDesc");
        projectionList.add(Projections.property("category.name"), "categoryName");
        projectionList.add(Projections.property("subCategory.name"), "subCategoryName");
        projectionList.add(Projections.property("questionType.description"), "questionTypeDesc");
        projectionList.add(Projections.property("status.id"), "statusId");
//        projectionList.add(Projections.property(""),"");

        criteria.setProjection(projectionList);


        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();

        return questions;
    }

    public List<Question> getAllReadyQuestion() {
        Criteria criteria = getSession().createCriteria(Question.class, "q");
        criteria.add(Restrictions.eq("status", queryStatusDomain.getReadyStatus()));

        criteria.createAlias("q.createBy", "createBy");
//        criteria.createAlias("q.subCategory.category","category");
        criteria.createAlias("q.subCategory", "subCategory");
        criteria.createAlias("subCategory.category", "category");
        criteria.createAlias("q.questionType", "questionType");
        criteria.createAlias("q.status", "status");
        criteria.createAlias("q.difficultyLevel", "difficulty");
//        criteria.createAlias("","");

        ProjectionList projectionList = Projections.projectionList();
        projectionList.add(Projections.property("createBy.userName"), "createByEmpId");
        projectionList.add(Projections.property("q.id"), "id");
        projectionList.add(Projections.property("q.description"), "description");
        projectionList.add(Projections.property("q.score"), "score");
        projectionList.add(Projections.property("q.createDate"), "createDate");
        projectionList.add(Projections.property("difficulty.description"), "difficultyDesc");
        projectionList.add(Projections.property("category.name"), "categoryName");
        projectionList.add(Projections.property("subCategory.name"), "subCategoryName");
        projectionList.add(Projections.property("questionType.description"), "questionTypeDesc");
        projectionList.add(Projections.property("status.id"), "statusId");
//        projectionList.add(Projections.property(""),"");
        criteria.addOrder(Order.asc("q.id"));
        criteria.setProjection(projectionList);


        criteria.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Question> questions = criteria.list();

        return questions;
    }

    public Question getQuestionById(Integer id) {
        Criteria criteria = getSession().createCriteria(Question.class);
        criteria.add(Restrictions.eq("id", id));
        return (Question) criteria.uniqueResult();
    }

    public void deleteQuestion(Integer id) {
        Question question = getQuestionById(id);
        if (question.getPapers().isEmpty()) {
            beginTransaction();
            getSession().delete(question);
            commitTransaction();
            closeSession();
        }else{
            question.setStatus(queryStatusDomain.getDeletedStatus());
            beginTransaction();
            getSession().merge(question);
            commitTransaction();
            closeSession();
        }
    }

    public List<Question> searchQuestionQuery(String categoryId, String subCategoryName,
                                              JSONArray createByJsonArray, String questionId,
                                              String questionDesc, String createDateFrom,
                                              String createDateTo, String scoreFrom,
                                              String scoreTo, String statusId) {

        Criteria criteria = getSession().createCriteria(Question.class, "q");
        criteria.createAlias("q.subCategory", "subCategory");
        criteria.createAlias("q.createBy", "createBy");
        criteria.createAlias("q.status", "status");
        criteria.createAlias("q.difficultyLevel", "difficulty");
        criteria.addOrder(Order.asc("subCategory.category")).addOrder(Order.asc("subCategory")).addOrder(Order.asc("id")).addOrder(Order.asc("difficulty.level"));
        if (categoryId != null && categoryId != "") {
            Category category = queryCategoryDomain.getCategoryById(categoryId);
            criteria.add(Restrictions.eq("subCategory.category", category));
            if (subCategoryName != null && subCategoryName != "") {
                criteria.add(Restrictions.eq("subCategory", querySubCategoryDomain.getSubCategoryByNameAndCategory(subCategoryName, category)));
            }
        }
        if (createByJsonArray != null && createByJsonArray.length() != 0) {
            try {
                List<Integer> userIds = new ArrayList<Integer>();
                for (int i = 0; i < createByJsonArray.length(); i++) {
                    userIds.add(createByJsonArray.optInt(i));
                }

                criteria.add(Restrictions.in("createBy.userId", userIds));

            } catch (NumberFormatException ne) {
                ne.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (questionId != null && questionId.trim().length() != 0) {
            try {
                criteria.add(Restrictions.eq("q.id", Integer.parseInt(questionId)));
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        if (questionDesc != null && questionDesc.trim().length() != 0) {
            criteria.add(Restrictions.like("q.description", "%" + questionDesc + "%"));
        }
        DateFormat format = new SimpleDateFormat("dd/MM/yyyy");

        if (createDateFrom != null && createDateFrom.trim().length() != 0) {
            Date dateFrom = null;
            try {
                dateFrom = format.parse(createDateFrom);
                dateFrom = DateUtil.getDateWithRemovedTime(dateFrom);
                Criterion createDateCriterion = Restrictions.ge("q.createDate", dateFrom);
//                Criterion updateDateCriterion = Restrictions.ge("q.updateDate", dateFrom);
//                criteria.add(Restrictions.or(createDateCriterion, updateDateCriterion));
                criteria.add(createDateCriterion);

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        if (createDateTo != null && createDateTo.trim().length() != 0) {
            Date dateTo = null;
            try {
                dateTo = format.parse(createDateTo);
                dateTo = DateUtil.getDateWithRemovedTime(dateTo);
                Criterion createDateCriterion = Restrictions.le("q.createDate", dateTo);
//                Criterion updateDateCriterion = Restrictions.le("q.updateDate", dateTo);
//                criteria.add(Restrictions.or(createDateCriterion, updateDateCriterion));
                criteria.add(createDateCriterion);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (scoreFrom != null && scoreFrom.trim().length() != 0) {
            criteria.add(Restrictions.ge("q.score", Float.parseFloat(scoreFrom)));
        }
        if (scoreTo != null && scoreTo.trim().length() != 0) {
            criteria.add(Restrictions.le("q.score", Float.parseFloat(scoreTo)));
        }
        if (statusId != null && statusId.trim().length() != 0) {
            criteria.add(Restrictions.eq("status.id", statusId));
        } else {
            criteria.add(Restrictions.eq("status.id", 3));
        }

        criteria.addOrder(Order.asc("q.createDate")).addOrder(Order.desc("q.id"));

        List<Question> resultList = criteria.list();
        for(Question q : resultList){
            getSession().refresh(q);
        }

        return resultList;
    }

    public void mergeQuestion(Question question) {
        getSession().merge(question);
    }


//    Add by Mr.Wanchana

    public List<Question> getAllQuestionDetail() {

        Criteria criteria = getSession().createCriteria(Question.class);
        criteria.add(Restrictions.ne("status.id", 4));

        List<Question> questions = criteria.list();
        return questions;
    }

    public List<Question> getQuestionNotInSelected(List qId) {

        Criteria criteria = getSession().createCriteria(Question.class);
        criteria.add(Restrictions.not(Restrictions.in("id", qId)));
        criteria.add(Restrictions.ne("status.id", 4));

        List<Question> questions = criteria.list();

        return questions;
    }

    public List<Question> getQuestionListByPaper(ExamPaper ep) {

        Criteria criteria = getSession().createCriteria(PaperQuestion.class);
        criteria.add(Restrictions.eq("pk.examPaper", ep));
//        criteria.add(Restrictions.ne("status.id", 4));

        List<PaperQuestion> paperQuestions = criteria.list();
        List<Question> questions = new ArrayList<Question>();

        for (PaperQuestion p : paperQuestions) {
            questions.add(p.getQuestion());
        }

        return questions;
    }

    public List<Question> generalSearchQuestion(List users, String catId, Integer subId, List<Integer> qIds) {

        Criteria criteria = getSession().createCriteria(Question.class, "question");
        criteria.createAlias("question.subCategory", "subCategory");
        criteria.createAlias("question.createBy", "createBy");
        criteria.createAlias("subCategory.category", "category");
        criteria.add(Restrictions.ne("status.id", 4));

        if (users != null) {
            criteria.add(Restrictions.in("createBy.id", users));
        }
        if (catId != "") {
            Criterion criterion1 = Restrictions.like("category.id", "%" + catId + "%").ignoreCase();
            Criterion criterion2 = Restrictions.like("category.name", "%" + catId + "%").ignoreCase();
            criteria.add(Restrictions.or(criterion1, criterion2));
        }
        if (subId != 0) {
            criteria.add(Restrictions.eq("subCategory.id", subId));
        }
        if (qIds.size() != 0) {
            criteria.add(Restrictions.not(Restrictions.in("id", qIds)));
        }

        List<Question> questions = criteria.list();

        return questions;
    }

    public List<Question> advanceSearchQuestion(List users, String catId, Integer subId, List<Integer> qIds, String qDesc, String qCreateDateFrom, String qCreateDateTo, String qScoreFrom, String qScoreTo) throws ParseException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy", Locale.US);
        Date dateFrom = null;
        Date dateTo = null;
        if (!qCreateDateFrom.equals("")) {
            dateFrom = simpleDateFormat.parse(qCreateDateFrom);
        }
        if (!qCreateDateTo.equals("")) {
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

        Criteria criteria = getSession().createCriteria(Question.class, "question");
        criteria.createAlias("question.subCategory", "subCategory");
        criteria.createAlias("question.createBy", "createBy");
        criteria.createAlias("subCategory.category", "category");
        criteria.add(Restrictions.ne("status.id", 4));

        if (users != null) {
            criteria.add(Restrictions.in("createBy.id", users));
        }
        if (catId != "") {
            Criterion criterion1 = Restrictions.like("category.id", "%" + catId + "%").ignoreCase();
            Criterion criterion2 = Restrictions.like("category.name", "%" + catId + "%").ignoreCase();
            criteria.add(Restrictions.or(criterion1, criterion2));
        }
        if (subId != 0) {
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

        List<Question> questions = criteria.list();

        return questions;
    }

    public List<Question> getQuestionsByLevel(Integer level) {

        Criteria criteria = getSession().createCriteria(Question.class);
        criteria.add(Restrictions.eq("difficultyLevel.level", level));
        criteria.add(Restrictions.ne("status.id", 4));

        List<Question> question = criteria.list();

        return question;
    }
}
