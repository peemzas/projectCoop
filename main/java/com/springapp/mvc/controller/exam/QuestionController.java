package com.springapp.mvc.controller.exam;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.*;
import com.springapp.mvc.pojo.exam.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
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
        System.out.println(question);
//        Integer questionTypeId = null;
//        if(questionType == "Objective"){
//            questionTypeId = 1;
//        }else if(questionType == "Subjective"){
//            questionTypeId = 2;
//        }

        System.out.println("questionTypeId = " + questionTypeId + " : questionType = ");


        System.out.println("===============================================================0=====================================================================");
        question.setCreateBy(queryUserDomain.getCurrentUser(request));
        System.out.println("===============================================================1=====================================================================");
        question.setDescription(qDesc);


        System.out.println(question.getDescription());
        System.out.println("===============================================================2=====================================================================");
        question.setCreateDate(new Date());
        System.out.println("===============================================================3=====================================================================");
        System.out.println("questionTypeId = " + questionTypeId + " : questionType = ");
        question.setQuestionType(queryQuestionTypeDomain.getQuestionTypeById(questionTypeId));
        System.out.println("===============================================================4=====================================================================");
        question.setDifficultyLevel(queryDifficultyDomain.getDifficultyByInteger(difficultyLevel));
        System.out.println("===============================================================5=====================================================================");
        question.setScore(score);
        System.out.println("===============================================================6=====================================================================");
        question.setSubCategoryId(querySubCategoryDomain.getSubCategoryByNameAndCategory(subCat, queryCategoryDomain.getCategoryByName(cat)));
        System.out.println("===============================================================7=====================================================================");
        question.setStatus(queryStatusDomain.getReadyStatus());
        System.out.println("===============================================================8=====================================================================");

        System.out.println(cDescList);
        System.out.println(cDescList.get(0));

        queryQuestionDomain.insertQuestion(question, cDescList, correctChoice);
    }

}
