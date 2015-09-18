package com.springapp.mvc.controller.exam;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Phuthikorn_T on 17-Sep-15.
 */
@Controller
@RequestMapping(value = "/TDCS")
public class DoExamController {
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


//    @RequestMapping(method = RequestMethod.GET, value = "/exam/doExam")
//    public String doExam(ModelMap modelMap, Model model,HttpServletRequest request,HttpServletResponse response){
//
//
//        return "doExam";
//    }
//    @RequestMapping(method = RequestMethod.GET, value = "/exam/doExam")
//    public String doExam(ModelMap modelMap, Model model,HttpServletRequest request,HttpServletResponse response,
//                         @RequestParam(value = "paperId")String paperId){
//
//
//        return "doExam";
//    }

}
