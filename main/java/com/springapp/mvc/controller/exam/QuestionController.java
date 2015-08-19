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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;


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
    public void addQuestion(ModelMap model,
                            @RequestParam(value = "categoryName", required = true) String cat,
                            @RequestParam(value = "subCategoryName", required = true) String subCat,
                            @RequestParam(value = "questionDesc", required = true) String qDesc,
                            @RequestParam(value = "choiceDescArray", required = false) List<String> cDescList,
                            @RequestParam(value = "correctChoice", required = false) Integer correctChoice,
                            @RequestParam(value = "questionType", required = true) Integer questionTypeId,
                            @RequestParam(value = "difficulty", required = true) Integer difficultyLevel,
                            @RequestParam(value = "score", required = true) Float score
            , HttpServletRequest request, HttpServletResponse response) {

        Question question = new Question();

        question.setCreateBy(queryUserDomain.getCurrentUser(request));
        question.setDescription(qDesc);


        question.setCreateDate(new Date());
        question.setQuestionType(queryQuestionTypeDomain.getQuestionTypeById(questionTypeId));
        question.setDifficultyLevel(queryDifficultyDomain.getDifficultyByInteger(difficultyLevel));
        question.setScore(score);

        question.setSubCategory(querySubCategoryDomain.getSubCategoryByNameAndCategory(subCat, queryCategoryDomain.getCategoryByName(cat)));

        System.out.println("===============================================================6=====================================================================");
        question.setSubCategory(querySubCategoryDomain.getSubCategoryByNameAndCategory(subCat, queryCategoryDomain.getCategoryByName(cat)));
        System.out.println("===============================================================7=====================================================================");

        question.setStatus(queryStatusDomain.getReadyStatus());

        queryQuestionDomain.insertQuestion(question, cDescList, correctChoice);
    }


    @RequestMapping(method = RequestMethod.POST, value = "/exam/editQuestion")
    @ResponseBody
    public void editQuestion(ModelMap model,
                             @RequestParam(value = "categoryName", required = true) String cat,
                             @RequestParam(value = "subCategoryName", required = true) String subCat,
                             @RequestParam(value = "questionDesc", required = true) String qDesc,
                             @RequestParam(value = "choiceDescArray", required = false) List<String> cDescList,
                             @RequestParam(value = "correctChoice", required = false) Integer correctChoice,
                             @RequestParam(value = "questionType", required = true) Integer questionTypeId,
                             @RequestParam(value = "difficulty", required = true) Integer difficultyLevel,
                             @RequestParam(value = "score", required = true) Float score
            , HttpServletRequest request, HttpServletResponse response) {


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
            , HttpServletRequest request, HttpServletResponse respons){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

//        Question question = queryQuestionDomain.getQuestionById(questionId);
        List<Choice> choices = queryChoiceDomain.getChoiceListByQuestionId(questionId);
        String json = new Gson().toJson(choices);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }


}

