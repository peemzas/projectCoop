package com.springapp.mvc.controller.exam;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.*;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.*;
import com.springapp.mvc.util.DateUtil;
import com.springapp.mvc.util.HibernateUtil;
import flexjson.JSONSerializer;
import org.hibernate.Hibernate;
import org.json.JSONArray;
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
import java.math.BigDecimal;
import java.util.*;

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

    @Autowired
    QueryExamRecordDomain queryExamRecordDomain;

    @Autowired
    QueryExamAnswerDomain queryExamAnswerDomain;

    @Autowired
    QueryExamResultDomain queryExamResultDomain;

    @Autowired
    QueryPaperQuestionDomain queryPaperQuestionDomain;


    @RequestMapping(method = RequestMethod.GET, value = "/exam/doExam")
    public String doExam(ModelMap modelMap, Model model, HttpServletRequest request, HttpServletResponse response,
                         @RequestParam(value = "paperId") Integer paperId) {

        ExamPaper examPaper = queryPaperDomain.getPaperById(paperId);
//        String json = new JSONSerializer().exclude("*.class").include("questions").include("questions.pk").include("questions.pk.question").serialize(examPaper);
//        modelMap.addAttribute("paper", json);
        modelMap.addAttribute("paper", examPaper);
//        modelMap.addAttribute("questionTypeObjective",queryQuestionTypeDomain.getObjective());

        return "doExam";
    }


//    @RequestMapping(method = RequestMethod.POST, value = "/exam/submitExam")
//    public String submitExam(HttpServletRequest request, HttpServletResponse response, ModelMap model
//            , @RequestParam(value = "paperId") String paperId
//            , @RequestParam(value = "answerRecords") Map<String,String> answerRecords
//            , @RequestParam(value = "timeTaken") Integer timeTaken
//    ) {
//        String submitStatus = "Submit Complete";
//        User user = queryUserDomain.getCurrentUser(request);
//        ExamPaper paper = queryPaperDomain.getPaperById(Integer.parseInt(paperId));
//
//        ExamRecord examRecord = new ExamRecord();
//        examRecord.setPaper(paper);
//        examRecord.setUser(user);
//        examRecord.setTimeTaken(timeTaken);
//        examRecord.setExamDate(new Date());
//
//        try {
//            queryExamRecordDomain.saveExamRecord(examRecord);
//
//            for (Map.Entry<Integer, String> entry : answerMap.entrySet()) {
//                System.out.println(entry.getKey() + " : " + entry.getValue());
//
//                ExamAnswerRecord examAnswer = new ExamAnswerRecord();
//                examAnswer.setExamRecord(examRecord);
//                Question question = queryQuestionDomain.getQuestionById(entry.getKey());
//                examAnswer.setQuestion(question);
//
//                if (question.getQuestionType() == queryQuestionTypeDomain.getObjective()) {
//                    examAnswer.setAnswerObjective(
//                            queryChoiceDomain.getChoiceById(
//                                    Integer.parseInt(entry.getValue())
//                            )
//                    );
//                } else {
//                    examAnswer.setAnswerSubjective(entry.getValue());
//                }
//                queryExamAnswerDomain.saveExamAnswer(examAnswer);
//            }
//        }catch (NullPointerException npe){
//            npe.printStackTrace();
//            submitStatus = "Submit Fail : Null Pointer Exception";
//        }catch (Exception e){
//            submitStatus = "Submit Fail";
//        }
//
//        return submitStatus;
//    }


    @RequestMapping(method = RequestMethod.POST, value = "/exam/submitExam")
    @ResponseBody
    public ResponseEntity<String> submitExam(HttpServletRequest request, HttpServletResponse response, ModelMap model
            , @RequestParam(value = "paperId") String paperId
            , @RequestParam(value = "answerRecords") JSONArray answerRecords
            , @RequestParam(value = "timeTaken") Integer timeTaken
//                             , @RequestBody List<AnswerRecord> answerRecords
    ) throws Exception {

        ExamPaper paper = queryPaperDomain.getPaperById(Integer.parseInt(paperId));
        User user = queryUserDomain.getCurrentUser(request);
        ExamRecord examRecord = new ExamRecord();
        examRecord.setUser(user);
        examRecord.setPaper(paper);
        examRecord.setTimeTaken(timeTaken);
        examRecord.setExamDate(new Date());
        examRecord.setExamDate(DateUtil.getCurrentDateWithRemovedTime());

        ExamRecord preTestRecord = queryExamRecordDomain.getPreTestRecord(examRecord);
        if (preTestRecord != null){
            examRecord.setPreTestRecord(preTestRecord);
        }

        Float objectiveScore = (float) 0.0;
        Choice currentChoice = null;
        Question currentQuestion = null;
        try {
            HibernateUtil.beginTransaction();

            queryExamRecordDomain.saveExamRecord(examRecord);
            //Save ExamRecord

            for (int i = 0; i < answerRecords.length(); i++) {
                ExamAnswerRecord examAnswerRecord = new ExamAnswerRecord();
                examAnswerRecord.setExamRecord(examRecord);
                currentQuestion = queryQuestionDomain.getQuestionById(answerRecords.getJSONObject(i).getInt("questionId"));
                examAnswerRecord.setQuestion(currentQuestion);


                if (answerRecords.getJSONObject(i).optInt("answerObjective") != 0) {
                    currentChoice = queryChoiceDomain.getChoiceById(answerRecords.getJSONObject(i).getInt("answerObjective"));
                    examAnswerRecord.setAnswerObjective(currentChoice);

                    if (currentChoice.getCorrection() == queryBooDomain.getTrue()) {
                        objectiveScore += queryPaperQuestionDomain.getPaperQuestion(paper,currentQuestion).getScore();
                    }
                } else {
                    try {
                        examAnswerRecord.setAnswerSubjective(
                                answerRecords.getJSONObject(i).getString("answerSubjective"));
                    }catch (Exception e){
                        //Do nothing
                    }
                }
                queryExamAnswerDomain.saveExamAnswer(examAnswerRecord);
            }
            //Save ExamResult
            ExamResult examResult = new ExamResult();
            examResult.setExamRecord(examRecord);
            examResult.setObjectiveScore(new BigDecimal(objectiveScore));
            examResult.setStatus(queryStatusDomain.getPendingStatus());
            queryExamResultDomain.saveExamResult(examResult);

            HibernateUtil.commitTransaction();

        } catch (Exception e) {
            e.printStackTrace();
            HibernateUtil.rollbackTransaction();
            throw e;
        }

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
        String json = new JSONSerializer().serialize("hello");

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/getExamBody")
    @ResponseBody
    public ResponseEntity<String> getExamBody(@RequestParam(value = "paperId", required = true) Integer paperId) {

        List<Question> questionList = queryQuestionDomain.getQuestionListByPaper(queryPaperDomain.getPaperById(paperId));
        for (Question q : questionList) {
            Collections.shuffle(q.getChoices());
        }
        Collections.shuffle(questionList);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");
        String json = new JSONSerializer().exclude("*.class").include("choices").serialize(questionList);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }


}
