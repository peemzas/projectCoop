package com.springapp.mvc.controller.exam;


import com.springapp.mvc.domain.QueryPositionDomain;

import com.springapp.mvc.domain.exam.QueryExamResultDomain;
import com.springapp.mvc.pojo.Position;
import com.springapp.mvc.pojo.exam.ExamResult;
import flexjson.JSONSerializer;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
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

    @RequestMapping(value = "/exam/getQueryExamRecordSearch", method = RequestMethod.POST,headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> getQueryExamRecordSearch(@RequestBody String jsonObj) throws JSONException {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        JSONArray jsonArray = new JSONArray(jsonObj);
        List<Integer> userId = new ArrayList<Integer>();
        for (int i = 0 ; i < jsonArray.length()-1;i++){
            JSONObject jsonItems = jsonArray.getJSONObject(i);
            Integer forUserId = jsonItems.getInt("userId");
            userId.add(forUserId);
        }
        JSONObject jsonItems = jsonArray.getJSONObject(jsonArray.length()-1);
        String codeId = (String) jsonItems.get("code");
        String posiId = (String) jsonItems.get("position");
        Position position = null;
        Integer posiIdInt = Integer.parseInt(posiId);
        if(posiIdInt != 0){
            position =  queryPositionDomain.getPositionById(posiIdInt);
        }
        List<ExamResult> results = queryExamResualt.getAllExamResult(userId,codeId,position);
        String json = new JSONSerializer().exclude("*.class").serialize(results);
        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }
}
