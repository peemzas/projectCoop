package com.springapp.mvc.controller.exam;

import com.google.gson.Gson;
import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.*;
import com.springapp.mvc.pojo.exam.*;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.Choice;
import com.springapp.mvc.pojo.exam.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;


/**
 * Created by Phuthikorn_T on 8/11/2015.
 */
@Controller
@RequestMapping("/TDCS")
public class QuestionController {

    @Autowired
    QueryUserDomain queryUserDomain;

    @Autowired
    QuerySubCategoryDomain querySubCategoryDomain;

    @Autowired
    QueryCategoryDomain queryCategoryDomain;

    @Autowired
    QueryPaperDomain queryPaperDomain;

    @Autowired
    QueryChoiceDomain queryChoiceDomain;

    @Autowired
    QueryQuestionDomain queryQuestionDomain;

    @Autowired
    QueryQuestionTypeDomain queryQuestionTypeDomain;

    @Autowired
    QueryDifficultyDomain queryDifficultyDomain;

    @Autowired
    QueryStatusDomain queryStatusDomain;


    @Autowired
    QueryBooDomain queryBooDomain;

    private static final Logger logger = Logger.getLogger(QuestionController.class.getName());


    @RequestMapping(method = RequestMethod.POST, value = "/exam/addQuestion")
    @ResponseBody
    public ResponseEntity<String> addQuestion(ModelMap model,
                                              @RequestParam(value = "categoryName", required = true) String cat,
                                              @RequestParam(value = "subCategoryName", required = true) String subCat,
                                              @RequestParam(value = "questionDesc", required = true) String qDesc,
                                              @RequestParam(value = "choiceDescArray", required = false) List<String> cDescList,
                                              @RequestParam(value = "correctChoice", required = false) Integer correctChoice,
                                              @RequestParam(value = "questionType", required = true) Integer questionTypeId,
                                              @RequestParam(value = "difficulty", required = true) Integer difficultyLevel,
                                              @RequestParam(value = "score", required = true) Float score
            , HttpServletRequest request, HttpServletResponse response) {


        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        Question question = new Question();

        question.setCreateBy(queryUserDomain.getCurrentUser(request));
        question.setDescription(qDesc);


        question.setCreateDate(new Date());
        question.setQuestionType(queryQuestionTypeDomain.getQuestionTypeById(questionTypeId));
        question.setDifficultyLevel(queryDifficultyDomain.getDifficultyByInteger(difficultyLevel));
        question.setScore(score);

        question.setSubCategory(querySubCategoryDomain.getSubCategoryByNameAndCategory(subCat, queryCategoryDomain.getCategoryByName(cat)));

        question.setStatus(queryStatusDomain.getReadyStatus());

        queryQuestionDomain.insertQuestion(question, cDescList, correctChoice);

        String json = new Gson().toJson(question);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }


    @RequestMapping(method = RequestMethod.POST, value = "/exam/editQuestion")
    @ResponseBody
    public void editQuestion(ModelMap model,
                             @RequestParam(value = "questionId", required = true) Integer questionId,
                             @RequestParam(value = "categoryName", required = true) String catName,
                             @RequestParam(value = "subCategoryName", required = true) String subCatName,
                             @RequestParam(value = "questionDesc", required = true) String qDesc,
                             @RequestParam(value = "choiceDescArray", required = false) List<String> cDescList,
                             @RequestParam(value = "correctChoice", required = false) Integer correctChoice,
                             @RequestParam(value = "questionType", required = true) Integer questionTypeId,
                             @RequestParam(value = "difficulty", required = true) Integer difficultyLevel,
                             @RequestParam(value = "score", required = true) Float score
            , HttpServletRequest request, HttpServletResponse response) {

        Category category = queryCategoryDomain.getCategoryByName(catName);
        SubCategory subCategory = querySubCategoryDomain.getSubCategoryByNameAndCategory(subCatName, category);
        QuestionType questionType = queryQuestionTypeDomain.getQuestionTypeById(questionTypeId);
        Difficulty difficulty = queryDifficultyDomain.getDifficultyByInteger(difficultyLevel);

        Question question = queryQuestionDomain.getQuestionById(questionId);

        List<Choice> choices = queryChoiceDomain.getChoiceListByQuestionId(question.getId());

        if (queryQuestionTypeDomain.isObjective(questionType)) {

            for (int i = 0; i < choices.size(); i++) {

                Choice c = choices.get(i);
//                c.setDescription(cDescList.get(i));

                Boo boo = null;
                if (i + 1 == correctChoice) {
                    boo = queryBooDomain.getTrue();
                } else {
                    boo = queryBooDomain.getFalse();
                }
                if (!(c.getDescription() == cDescList.get(i) && c.getCorrection() == boo)) { //edited
                    Choice newChoice = new Choice();
                    newChoice.setDescription(cDescList.get(i));
                    newChoice.setCorrection(boo);
                    newChoice.setQuestion(question);
                    newChoice.setStatus(queryStatusDomain.getReadyStatus());
//                queryChoiceDomain.insertChoice(newChoice);
//                c.setStatus(queryStatusDomain.getDeletedStatus());
//                queryChoiceDomain.mergeUpdateChoice(c);
                } else { // no change

                }
            }
        }
        if (!(question.getDescription().equals(qDesc) && question.getScore().equals(score) &&
                question.getQuestionType() == questionType && question.getDifficultyLevel() == difficulty &&
                question.getSubCategory() == subCategory)) { //edited

            System.out.println("======================question================================");
            System.out.println("TRUE !!!!!!");

            question.setStatus(queryStatusDomain.getDeletedStatus());
            queryQuestionDomain.mergeQuestion(question);

            Question newQuestion = cloneQuestion(question,request);
            newQuestion.setDescription(qDesc);
            newQuestion.setScore(score);
            newQuestion.setQuestionType(questionType);
            newQuestion.setDifficultyLevel(difficulty);
            newQuestion.setSubCategory(subCategory);

            queryQuestionDomain.insertQuestion(newQuestion,cDescList,correctChoice);

        } else {// no change
            System.out.println("=======================question===============================");
            System.out.println("FALSE!!!!!!");
        }

        System.out.println("===============================================Fin");

    }

    @RequestMapping(method = RequestMethod.POST, value = "/exam/getAllQuestion")
    @ResponseBody
    public ResponseEntity<String> getAllQuestion(ModelMap model
            , HttpServletRequest request, HttpServletResponse response) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<Question> questions = queryQuestionDomain.getAllQuestion();
        String json = new Gson().toJson(questions);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/exam/getAllReadyQuestion")
    @ResponseBody
    public ResponseEntity<String> getAllReadyQuestion(ModelMap model
            , HttpServletRequest request, HttpServletResponse response) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<Question> questions = queryQuestionDomain.getAllReadyQuestion();
        String json = new Gson().toJson(questions);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/exam/deleteQuestion")
    @ResponseBody
    public void deleteQuestion(ModelMap model
            , @RequestParam(value = "questionId", required = true) Integer questionId
            , HttpServletRequest request, HttpServletResponse response) {

        queryQuestionDomain.deleteQuestion(questionId);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/exam/getChoiceDetail")
    @ResponseBody
    public ResponseEntity<String> getChoiceDetail(ModelMap model
            , @RequestParam(value = "questionId", required = true) Integer questionId
            , HttpServletRequest request, HttpServletResponse respons) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

//        Question question = queryQuestionDomain.getQuestionById(questionId);
        List<Choice> choices = queryChoiceDomain.getChoiceListByQuestionId(questionId);
        String json = new Gson().toJson(choices);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }


    @RequestMapping(method = RequestMethod.POST, value = "/exam/searchQuestion")
    @ResponseBody
    public ResponseEntity<String> searchQuestion(ModelMap modelMap
            , @RequestParam(value = "category", required = false) Integer categoryId
            , @RequestParam(value = "sucCategory", required = false) Integer subCategoryId
            , @RequestParam(value = "createBy", required = false) String createBy
            , @RequestParam(value = "questionId", required = false) Integer questionId
            , @RequestParam(value = "questionDesc", required = false) String questionDesc
            , @RequestParam(value = "createDateFrom", required = false) Date createDateFrom
            , @RequestParam(value = "createDateTo", required = false) Date createDateTo
            , @RequestParam(value = "scoreFrom", required = false) Float scoreFrom
            , @RequestParam(value = "scoreTo", required = false) Float scoreTo
            , @RequestParam(value = "status", required = false) Integer statusId
            , HttpServletRequest request, HttpServletResponse response
    ) {
        System.out.println("==============================================================");
        System.out.println(categoryId);
        System.out.println(subCategoryId);
        System.out.println(createBy);
        System.out.println(questionId);
        System.out.println(questionDesc);
        System.out.println(createDateFrom);
        System.out.println(createDateTo);
        System.out.println(scoreFrom);
        System.out.println(scoreTo);
        System.out.println(statusId);
        System.out.println("==============================================================");


        List<Question> questions = queryQuestionDomain.searchQuestionQuery(categoryId, subCategoryId
                , createBy, questionId, questionDesc, createDateFrom, createDateTo, scoreFrom, scoreTo, statusId);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
        String json = new Gson().toJson(questions);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);

    }

    @RequestMapping(method = RequestMethod.POST, value = "/exam/getQuestionDetail")
    @ResponseBody
    public ResponseEntity<String> getQuestionDetail(ModelMap modelMap,
                                                    @RequestParam(value = "questionId", required = true) Integer questionId,
                                                    HttpServletRequest request, HttpServletResponse response) {
        Question question = queryQuestionDomain.getQuestionById(questionId);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
        String json1 = new Gson().toJson(question);

        return new ResponseEntity<String>(json1, headers, HttpStatus.OK);
    }


    public Question cloneQuestion(Question question,HttpServletRequest request){

        Question questionNew = new Question();
        questionNew.setDifficultyLevel(question.getDifficultyLevel());
        questionNew.setStatus(queryStatusDomain.getReadyStatus());
        questionNew.setCreateDate(new Date());
        questionNew.setDescription(question.getDescription());
        questionNew.setScore(question.getScore());
        questionNew.setSubCategory(question.getSubCategory());
        questionNew.setQuestionType(question.getQuestionType());
        questionNew.setCreateBy(queryUserDomain.getCurrentUser(request));

        return questionNew;
    }


//    Add By Mr.Wanchana
    @RequestMapping(method = RequestMethod.POST, value = "/exam/generalQuestionSearch")
    @ResponseBody
    public ResponseEntity<String> generalQuestionSearch(String[] arrayEmpNameToQuery){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
////
//        for(int i = 0; i < arrayEmpNameToQuery.length; i ++){
//            System.out.println(arrayEmpNameToQuery[i] + " ");
//        }
        logger.info(arrayEmpNameToQuery.toString());
        String json = new Gson().toJson(arrayEmpNameToQuery);
        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
//        return null;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/exam/getAllQuestionDetail")
    @ResponseBody
    public ResponseEntity<String> getAllQuestionDetail(){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<Question> questions = queryQuestionDomain.getAllQuestionDetail();
        String json = new Gson().toJson(questions);
        logger.info(questions.toString());

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

}


