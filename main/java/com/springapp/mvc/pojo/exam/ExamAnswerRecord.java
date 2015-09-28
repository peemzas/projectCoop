package com.springapp.mvc.pojo.exam;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Phuthikorn_T on 7/1/2015.
 */
@Entity
@Table(name="TDCS_EXAM_ANSWER_RECORDS")
public class ExamAnswerRecord implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="ANSWER_RECORD_ID")
    private Integer id;

    @ManyToOne
    @JoinColumn(name="QUESTION_ID")
    private Question question;

    @ManyToOne
    @JoinColumn(name="ANSWER_OBJECTIVE")
    private Choice answerObjective;

    @Column(name="ANSWER_SUBJECTIVE")
    private String answerSubjective;

//    @OneToMany(mappedBy = "recordId")
//    private Set<ExamMarkingRecord> examMarkingRecords;

    @ManyToOne
    @JoinColumn(name = "EXAM_RECORD_ID")
    private ExamRecord examRecord;


//    public Set<ExamMarkingRecord> getExamMarkingRecords() {
//        return examMarkingRecords;
//    }
//
//    public void setExamMarkingRecords(Set<ExamMarkingRecord> examMarkingRecords) {
//        this.examMarkingRecords = examMarkingRecords;
//    }

    public ExamRecord getExamRecord() {
        return examRecord;
    }

    public void setExamRecord(ExamRecord examRecordId) {
        this.examRecord = examRecordId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question questionId) {
        this.question = questionId;
    }

    public Choice getAnswerObjective() {
        return answerObjective;
    }

    public void setAnswerObjective(Choice answerObjective) {
        this.answerObjective = answerObjective;
    }

    public String getAnswerSubjective() {
        return answerSubjective;
    }

    public void setAnswerSubjective(String answerSubjective) {
        this.answerSubjective = answerSubjective;
    }

//    Add By Mr.Wanchana
//    private Question question;
//    @ManyToOne
//    @JoinColumn(name = "QUESTION_ID")
//
//    public Question getQuestion() {
//        return question;
//    }
//
//    public void setQuestion(Question question) {
//        this.question = question;
//    }
}
