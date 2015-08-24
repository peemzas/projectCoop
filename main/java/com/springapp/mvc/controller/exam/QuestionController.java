package com.springapp.mvc.controller.exam;

import com.google.gson.Gson;
import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.*;
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
                             @RequestParam(value = "categoryName", required = true) String cat,
                             @RequestParam(value = "subCategoryName", required = true) String subCat,
                             @RequestParam(value = "questionDesc", required = true) String qDesc,
                             @RequestParam(value = "choiceDescArray", required = false) List<String> cDescList,
                             @RequestParam(value = "correctChoice", required = false) Integer correctChoice,
                             @RequestParam(value = "questionType", required = true) Integer questionTypeId,
                             @RequestParam(value = "difficulty", required = true) Integer difficultyLevel,
                             @RequestParam(value = "score", required = true) Float score
            , HttpServletRequest request, HttpServletResponse response) {

        Question originalQuestion = queryQuestionDomain.getQuestionById(questionId);

        Question questionToBeEdit = originalQuestion;
        questionToBeEdit.setSubCategory(querySubCategoryDomain.getSubCategoryByNameAndCategory(subCat
                , queryCategoryDomain.getCategoryByName(cat)));
        questionToBeEdit.setDescription(qDesc);
        questionToBeEdit.setQuestionType(queryQuestionTypeDomain.getQuestionTypeById(questionTypeId));
        questionToBeEdit.setDifficultyLevel(queryDifficultyDomain.getDifficultyByInteger(difficultyLevel));
        questionToBeEdit.setScore(score);

        List<Choice> originalChoices = queryChoiceDomain.getChoiceListByQuestionId(questionId);
        List<Choice> newChoices = originalChoices;

        if (!originalQuestion.equals(questionToBeEdit)) {
//            originalQuestion.setStatus(queryStatusDomain.getDeletedStatus());
//            queryQuestionDomain.mergeQuestion(originalQuestion);
            System.out.println("======================================================");
            System.out.println("TRUE !!!!!!");

        } else {
            System.out.println("======================================================");
            System.out.println("FALSE!!!!!!");
        }

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
            , @RequestParam(value = "createBy", required = false) String createByUsername
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
        System.out.println(createByUsername);
        System.out.println(questionId);
        System.out.println(questionDesc);
        System.out.println(createDateFrom);
        System.out.println(createDateTo);
        System.out.println(scoreFrom);
        System.out.println(scoreTo);
        System.out.println(statusId);
        System.out.println("==============================================================");


        List<Question> questions = queryQuestionDomain.searchQuestionQuery(categoryId, subCategoryId
                , createByUsername, questionId, questionDesc, createDateFrom, createDateTo, scoreFrom, scoreTo, statusId);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
        String json = new Gson().toJson(questions);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);

    }

    @RequestMapping(method = RequestMethod.POST, value = "/exam/getQuestionDetail")
    @ResponseBody
    public ResponseEntity<String> getQuesotionDetail(ModelMap modelMap,
                                                     @RequestParam(value = "questionId", required = true) Integer questionId,
                                                     HttpServletRequest request, HttpServletResponse response) {
        Question question = queryQuestionDomain.getQuestionById(questionId);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
        String json1 = new Gson().toJson(question);

        return new ResponseEntity<String>(json1, headers, HttpStatus.OK);
    }


}
// Add By Mr.Wanchana
//    @RequestMapping(method = RequestMethod.POST, value = "/exam/generalQuestionSearch")
//    @ResponseBody
//    public ResponseEntity<String> generalQuestionSearch(){
//
//    }

