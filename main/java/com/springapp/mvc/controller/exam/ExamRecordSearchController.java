package com.springapp.mvc.controller.exam;

import com.google.gson.Gson;
import com.springapp.mvc.domain.QueryPositionDomain;
import com.springapp.mvc.domain.exam.QueryExamRecordDomain;
import com.springapp.mvc.domain.exam.QueryExamRecordSearchDomain;
import com.springapp.mvc.domain.exam.QueryExamResultDomain;
import com.springapp.mvc.pojo.Position;
import com.springapp.mvc.pojo.exam.ExamPaper;
import com.springapp.mvc.pojo.exam.ExamRecord;
import com.springapp.mvc.pojo.exam.ExamResult;
import flexjson.JSONSerializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by JobzPC on 7/10/2558.
 */
@Controller
@RequestMapping("/TDCS")
public class ExamRecordSearchController {
    private static final Logger logger = Logger.getLogger(ExamRecordSearchController.class.getName());

    @Autowired
    QueryExamResultDomain queryExamResualt;

    @Autowired
    QueryPositionDomain queryPositionDomain;

    @RequestMapping(value = "/exam/getQueryExamRecordSearch", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> getQueryExamRecordSearch(@RequestParam(value = "code",required = false)String code,
                                                           @RequestParam(value = "position",required = false)Integer positionId) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
//        Position position = null;
//        if(positionId != 0){
//            position =  queryPositionDomain.getPositionById(positionId);
//        }
//        List<ExamResult> examResult = queryExamResualt.getQueryExamResultSearch(code, position);
        List<ExamResult> results = queryExamResualt.getAllExamResult();

        String json = new JSONSerializer().exclude("*.class").serialize(results);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }
}
