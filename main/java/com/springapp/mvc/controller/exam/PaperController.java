package com.springapp.mvc.controller.exam;

import com.google.gson.Gson;
import com.springapp.mvc.domain.QueryPositionDomain;
import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.QueryCategoryDomain;
import com.springapp.mvc.domain.exam.QueryPaperDomain;
import com.springapp.mvc.domain.exam.QueryPaperStatusDomain;
import com.springapp.mvc.domain.exam.QuerySubCategoryDomain;
import com.springapp.mvc.pojo.Position;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.pojo.exam.ExamPaper;
import com.springapp.mvc.pojo.exam.PaperQuestion;
import com.springapp.mvc.pojo.exam.Status;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.awt.print.Paper;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

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

    private static final Logger logger = Logger.getLogger(PaperController.class.getName());

    @RequestMapping(value = "/exam/createPaper", method = RequestMethod.POST)
    public ResponseEntity<String> createPaper(Model model,
                            @RequestParam(value = "paperId", required = true) String paperId,
                            @RequestParam(value = "paperName", required = false) String paperName,
                            @RequestParam(value = "paperScore", required = true) String paperScore,
                            @RequestParam(value = "paperTime", required = true) String paperTime,
                            @RequestParam(value = "paperForPosition", required = true) String paperForPosition,
                            @RequestParam(value = "jsonObjQuestion", required = true) String jsonObjQuestion,
                            HttpServletRequest request,
                            HttpServletResponse response) throws JSONException {

        JSONArray jsonArray = new JSONArray(jsonObjQuestion);
        List<Integer> qIds = new ArrayList();
        List<Float> qScores = new ArrayList();
        Integer paperMaxScore = new Integer(paperScore);
        Integer pTime = new Integer(paperTime);
        Integer pPosition = new Integer(paperForPosition);
        Position pForPosition = queryPositionDomain.getPositionById(pPosition);
        User createBy = queryUserDomain.getCurrentUser(request);
        Status paperStatus = queryPaperStatusDomain.getStatusById(3);
        Calendar calendar = Calendar.getInstance();
        Date createDate = new Date(calendar.getTime().getTime());

        for(int i = 0; i < jsonArray.length(); i++){
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            Integer tempQId = new Integer(jsonObject.getString("qId"));
            tempQId.getClass().getName();
            Float tempQScore = new Float(jsonObject.getString("qScore"));
            qIds.add(tempQId);
            qScores.add(tempQScore);
        }

        ExamPaper examPaper = new ExamPaper();
        examPaper.setCreateBy(createBy);
        examPaper.setCode(paperId);
        examPaper.setName(paperName);
        examPaper.setMaxScore(paperMaxScore);
        examPaper.setCreateDate(createDate);
        examPaper.setTimeLimit(pTime);
        examPaper.setPaperStatus(paperStatus);
        examPaper.setPosition(pForPosition);
        queryPaperDomain.createPaper(examPaper, qIds, qScores);

        return new ResponseEntity<String>(HttpStatus.CREATED);
    }

    @RequestMapping(value = "/exam/getAllPapers", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> getAllPapers(){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<ExamPaper> examPapers = queryPaperDomain.getAllPapers();
//        String json = new JSONSerializer().exclude("*.class").serialize(examPapers);
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
}
