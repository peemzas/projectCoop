package com.springapp.mvc.controller.exam;

import com.google.gson.Gson;
import com.springapp.mvc.domain.QueryPositionDomain;
import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.*;
import com.springapp.mvc.pojo.Position;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.*;
import com.springapp.mvc.util.DateUtil;
import flexjson.JSONSerializer;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
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
import javax.validation.Valid;
import java.awt.print.Paper;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;
import java.sql.Date;

/**
 * Created by Phuthikorn_T on 8/11/2015.
 */
@Controller
@RequestMapping("/TDCS")
public class PaperController {

    @Autowired
    QueryUserDomain queryUserDomain;

    @Autowired
    QuerySubCategoryDomain querySubCategoryDomain;

    @Autowired
    QueryCategoryDomain queryCategoryDomain;

    @Autowired
    QueryPaperDomain queryPaperDomain;

//    Add By Mr.Wanchana
    @Autowired
    QueryPositionDomain queryPositionDomain;

    @Autowired
    QueryPaperStatusDomain queryPaperStatusDomain;

    @Autowired
    QueryQuestionDomain queryQuestionDomain;

    @Autowired
    QueryPaperQuestionDomain queryPaperQuestionDomain;

    @Autowired
    QueryExamRecordDomain queryExamRecordDomain;

    private static final Logger logger = Logger.getLogger(PaperController.class.getName());

    @RequestMapping(value = "/exam/createPaper", method = RequestMethod.POST)
    public ResponseEntity<String> createPaper(Model model,
                            @RequestParam(value = "paperCode", required = true) String paperCode,
                            @RequestParam(value = "paperName", required = false) String paperName,
                            @RequestParam(value = "paperScore", required = true) String paperScore,
                            @RequestParam(value = "paperTime", required = true) String paperTime,
                            @RequestParam(value = "paperForPosition", required = true) Integer paperForPosition,
                            @RequestParam(value = "jsonObjQuestion", required = true) String jsonObjQuestion,
                            HttpServletRequest request,
                            HttpServletResponse response) throws JSONException {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        JSONArray jsonArray = new JSONArray(jsonObjQuestion);
        List<Integer> qIds = new ArrayList();
        List<Float> qScores = new ArrayList();
        Float paperMaxScore = new Float(paperScore);
        Integer pTime = new Integer(paperTime);
        Integer pPosition = null;
        Position pForPosition = null;

        if(paperForPosition != 0){
            pPosition = new Integer(paperForPosition);
            pForPosition = queryPositionDomain.getPositionById(pPosition);
        }

        User createBy = queryUserDomain.getCurrentUser(request);
        Status paperStatus = queryPaperStatusDomain.getStatusById(2);
//        long time = System.currentTimeMillis();
//        Date curDate = new Date(time);
        java.util.Date curDate = DateUtil.getCurrentDateWithRemovedTime();

        for(int i = 0; i < jsonArray.length(); i++){
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            Integer tempQId = new Integer(jsonObject.getString("qId"));
            tempQId.getClass().getName();
            Float tempQScore = new Float(jsonObject.getDouble("qScore"));
            qIds.add(tempQId);
            qScores.add(tempQScore);
        }

        ExamPaper examPaper = new ExamPaper();
        examPaper.setCreateBy(createBy);
        examPaper.setCode(paperCode);
        examPaper.setName(paperName);
        examPaper.setMaxScore(paperMaxScore);
        examPaper.setCreateDate(curDate);
        examPaper.setTimeLimit(pTime);
        examPaper.setPaperStatus(paperStatus);
        examPaper.setPosition(pForPosition);
        queryPaperDomain.createPaper(examPaper, qIds, qScores);

        Integer paperId = queryPaperDomain.getId(paperCode);
        String json = new Gson().toJson(paperId);

        return new ResponseEntity<String>(json, headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/exam/updatePaper", method = RequestMethod.POST)
    public ResponseEntity<String> updatePaper(Model model,
                                              @RequestParam(value = "paperCodeUpdate", required = true) String paperCode,
                                              @RequestParam(value = "paperNameUpdate", required = false) String paperName,
                                              @RequestParam(value = "paperScoreUpdate", required = true) String paperScore,
                                              @RequestParam(value = "paperTimeUpdate", required = true) String paperTime,
                                              @RequestParam(value = "paperForPositionUpdate", required = true) Integer paperForPosition,
                                              @RequestParam(value = "jsonObjQuestionUpdate", required = true) String jsonObjQuestion,
                                              @RequestParam(value = "paperIdUpdate", required = true) Integer pId,
                                              HttpServletRequest request,
                                              HttpServletResponse response) throws JSONException {

        JSONArray jsonArray = new JSONArray(jsonObjQuestion);
        List<Integer> qIds = new ArrayList();
        List<Float> qScores = new ArrayList();
        Float paperMaxScore = new Float(paperScore);
        Integer pTime = new Integer(paperTime);
        Integer pPosition = null;
        Position pForPosition = null;

        if(paperForPosition != 0){
            pPosition = new Integer(paperForPosition);
            pForPosition = queryPositionDomain.getPositionById(pPosition);
        }

        User updateBy = queryUserDomain.getCurrentUser(request);
        Status paperStatus = queryPaperStatusDomain.getStatusById(2);
//        long time = System.currentTimeMillis();
//        Date updateDate = new Date(time);
        java.util.Date updateDate = DateUtil.getCurrentDateWithRemovedTime();

        for(int i = 0; i < jsonArray.length(); i++){
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            Integer tempQId = new Integer(jsonObject.getString("qId"));
            tempQId.getClass().getName();
            Float tempQScore = new Float(jsonObject.getString("qScore"));
            qIds.add(tempQId);
            qScores.add(tempQScore);
        }

        queryPaperDomain.updatePaper(qIds, qScores, pId, updateBy, paperCode, paperName, paperMaxScore, updateDate, pTime, paperStatus, pForPosition);

        return new ResponseEntity<String>(HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/copyPaper", method = RequestMethod.POST)
    public ResponseEntity<String> copyPaper(Model model,
                                              @RequestParam(value = "paperCode", required = true) String paperCode,
                                              @RequestParam(value = "paperName", required = false) String paperName,
                                              @RequestParam(value = "paperId", required = true) Integer pId,
                                              HttpServletRequest request,
                                              HttpServletResponse response) throws JSONException {

        ExamPaper examPaper = queryPaperDomain.getPaperById(pId);
        List<PaperQuestion> paperQuestions = queryPaperQuestionDomain.getPaperQuestionByExamPaper(examPaper);
        queryPaperDomain.copyPaper(examPaper, paperQuestions, paperCode, paperName);

        return new ResponseEntity<String>(HttpStatus.CREATED);
    }

    @RequestMapping(value = "/exam/getAllPapers", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> getAllPapers(){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<ExamPaper> examPapers = queryPaperDomain.getAllPapers();
        String json = new Gson().toJson(examPapers);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/updatePaperStatus", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> updatePaperStatus(Model model,
                                                    @RequestParam(value = "paperId") int paperId,
                                                    @RequestParam(value = "paperStatus") int paperStatus){

        Status status = new Status();
        status = queryPaperStatusDomain.getStatusById(paperStatus);
        ExamPaper examPaper = new ExamPaper();
        examPaper = queryPaperDomain.getPaperById(paperId);
        examPaper.setPaperStatus(status);
        queryPaperDomain.updatePaperStatus(examPaper);

        return new ResponseEntity<String>(HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/deletePaper", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> deletePaper(@RequestBody String jsoN) throws JSONException {

        JSONArray jsonArray = new JSONArray(jsoN);
        List paperIds = new ArrayList();

        for(int i = 0; i < jsonArray.length(); i++){
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            paperIds.add(jsonObject.getInt("paperId"));
        }

        queryPaperDomain.deletePaper(paperIds);

        return new ResponseEntity<String>(HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/checkExamPaperInUse", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> checkExamPaperInUse(@RequestParam(value = "paperId") Integer paperId){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        Boolean check = queryExamRecordDomain.checkExamRecordInUse(paperId);

        String json = new Gson().toJson(check);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/getPaper", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> getPaper(@RequestParam(value = "paperId") int paperId){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        ExamPaper paper = queryPaperDomain.getPaperById(paperId);
        List<ExamPaper> paperList = new ArrayList<ExamPaper>();
        paperList.add(paper);
        String json = new JSONSerializer().exclude("*.class").serialize(paperList);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/getPaperQuestionByPaper", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> getPaperQuestionByPaper(@RequestParam(value = "paperId") int paperId){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        ExamPaper paper = queryPaperDomain.getPaperById(paperId);
        List<PaperQuestion> paperQuestion = queryPaperQuestionDomain.getPaperQuestionByExamPaper(paper);
        String json = new JSONSerializer().exclude("*.class").serialize(paperQuestion);
        logger.info("................................................"+paper.getCreateDate());

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/searchPaper", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> searchPaper(@RequestBody String jsoN) throws JSONException, ParseException {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<Integer> empIds = new ArrayList<Integer>();

        String code = "";
        String name = "";
        String createDateFrom = "";
        String createDateTo = "";
        String scoreFrom = "";
        String scoreTo = "";
        String paperStatus = "";

        JSONArray jsonArray = new JSONArray(jsoN);
        JSONObject jsonObj = jsonArray.getJSONObject(0);

        Integer check = new Integer(jsonObj.getString("empId"));
        Integer btnStatus = 0;

        if(check == 0){
            JSONObject jsonObject = jsonArray.getJSONObject(0);
            code = jsonObject.getString("code");
            name = jsonObject.getString("name");
            btnStatus = jsonObject.getInt("buttonStatus");

            createDateFrom = jsonObject.getString("createDateFrom");
            createDateTo = jsonObject.getString("createDateTo");
            scoreFrom = jsonObject.getString("scoreFrom");
            scoreTo = jsonObject.getString("scoreTo");
            paperStatus = jsonObject.getString("paperStatus");
        }
        else{
            for(int i = 0; i < jsonArray.length(); i++){
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                empIds.add(new Integer(jsonObject.getString("empId")));
                if(i == 0){
                    code = jsonObject.getString("code");
                    name = jsonObject.getString("name");
                    createDateFrom = jsonObject.getString("createDateFrom");
                    createDateTo = jsonObject.getString("createDateTo");
                    scoreFrom = jsonObject.getString("scoreFrom");
                    scoreTo = jsonObject.getString("scoreTo");
                    paperStatus = jsonObject.getString("paperStatus");
                }
                btnStatus = jsonObject.getInt("buttonStatus");
            }
        }

        if(empIds.size() == 0){
            empIds = null;
        }

        if(btnStatus == 0){
            List<ExamPaper> papers = queryPaperDomain.generalSearchPaper(empIds, code, name);
            String toJson = new JSONSerializer().include("choices").exclude("*.class").serialize(papers);
            return new ResponseEntity<String>(toJson, headers, HttpStatus.OK);
        }
        else{
            List<ExamPaper> papers = queryPaperDomain.advanceSearchPaper(empIds, code, name, createDateFrom, createDateTo, scoreFrom, scoreTo, paperStatus);
            String toJson = new JSONSerializer().include("choices").exclude("*.class").serialize(papers);
            return new ResponseEntity<String>(toJson, headers, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "/exam/randomQuestions", method= RequestMethod.POST)
    public ResponseEntity<String> randExamPaper(@RequestParam(value = "randEasy", required = false) Integer randEasy,
                                                @RequestParam(value = "randNormal", required = false) Integer randNormal,
                                                @RequestParam(value = "randHard", required = false) Integer randHard){


        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<Question> questions = new ArrayList<Question>();
        String json = "";
        int i = 0;
        if(!randEasy.equals(0)){
            List index = new ArrayList();
            List<Question> questionsEasy = queryQuestionDomain.getQuestionsByLevel(1);
            if(questionsEasy.size() < randEasy){
                json = null;
                return new ResponseEntity<String>(json, headers, HttpStatus.OK);
            }
            else{
                for(i = 0; i < questionsEasy.size(); i ++){
                    index.add(i);
                }
                for(int j = 0; j < randEasy; j ++){
                    Collections.shuffle(index);
                    questions.add(questionsEasy.get((Integer) index.get(0)));
                    index.remove(0);
                }
            }
        }
        if(!randNormal.equals(0)){
            List index2 = new ArrayList();
            List<Question> questionsNormal = queryQuestionDomain.getQuestionsByLevel(2);
            if(questionsNormal.size() < randNormal){
                json = null;
                return new ResponseEntity<String>(json, headers, HttpStatus.OK);
            }
            else{
                for(i = 0; i < questionsNormal.size(); i ++){
                    index2.add(i);
                }
                for(int j = 0; j < randNormal; j ++){
                    Collections.shuffle(index2);
                    questions.add(questionsNormal.get((Integer) index2.get(0)));
                    index2.remove(0);
                }
            }
        }
        if(!randHard.equals(0)){
            List index3 = new ArrayList();
            List<Question> questionsHard = queryQuestionDomain.getQuestionsByLevel(3);
            if(questionsHard.size() < randNormal){
                json = null;
                return new ResponseEntity<String>(json, headers, HttpStatus.OK);
            }
            else{
                for(i = 0; i < questionsHard.size(); i ++){
                    index3.add(i);
                }
                for(int j = 0; j < randHard; j ++){
                    Collections.shuffle(index3);
                    questions.add(questionsHard.get((Integer) index3.get(0)));
                    index3.remove(0);
                }
            }
        }

        json = new JSONSerializer().include("choices").exclude("*.class").serialize(questions);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/getPaperCode", method= RequestMethod.POST)
    public ResponseEntity<String> getPaperCode(@RequestParam(value = "pId", required = true) Integer paperId){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List codes = queryPaperDomain.getCode(paperId);
        String json = new JSONSerializer().exclude("*.class").serialize(codes);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/getPaperCodeCopy", method= RequestMethod.POST)
    public ResponseEntity<String> getPaperCodeCopy(){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List codes = queryPaperDomain.getCodeCopy();
        String json = new JSONSerializer().exclude("*.class").serialize(codes);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }
}
