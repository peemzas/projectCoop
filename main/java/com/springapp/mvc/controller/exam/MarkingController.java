package com.springapp.mvc.controller.exam;

import com.springapp.mvc.domain.exam.QueryExamAnswerDomain;
import com.springapp.mvc.domain.exam.QueryExamRecordDomain;
import com.springapp.mvc.domain.exam.QueryExamResultDomain;
import com.springapp.mvc.domain.exam.QueryPaperDomain;
import com.springapp.mvc.pojo.exam.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by PTang_000 on 30-Sep-15.
 */
@Controller
@RequestMapping("/TDCS")
public class MarkingController {

    @Autowired
    QueryPaperDomain queryPaperDomain;

    @Autowired
    QueryExamResultDomain queryExamResultDomain;

    @Autowired
    QueryExamRecordDomain queryExamRecordDomain;

    @RequestMapping(method = RequestMethod.GET, value = "/exam/marking")
    public String marking(ModelMap modelMap, Model model, HttpServletRequest request, HttpServletResponse response
//                         ,@RequestParam(value = "recordId") Integer recordId
            , @RequestParam(value = "resultId") Integer resultId) {

//        ExamRecord examRecord = queryExamRecordDomain.getExamRecordById(recordId);
//        ExamResult examResult = queryExamResultDomain.getExamResultByExamRecord(examRecord);
//        modelMap.addAttribute("examRecord", examRecord);
//        modelMap.addAttribute("subjectiveScore", examResult.getSubjectiveScore());
        ExamResult examResult = queryExamResultDomain.getExamResultById(resultId);
        modelMap.addAttribute("examResult",examResult);

        return "marking";
    }
}
