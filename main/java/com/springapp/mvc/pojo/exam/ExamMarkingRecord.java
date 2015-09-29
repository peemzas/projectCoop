package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Phuthikorn_T on 7/15/2015.
 */
@Entity
@Table(name="TDCS_EXAM_MARKING_RECORDS")
public class ExamMarkingRecord implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_EXAM_MARKING_RECORD_ID_SEQ_GEN")
    @Column(name="MARKING_RECORD_ID")
    private Integer id;

    @Column(name = "MARKING_SCORE")
    private Integer markingScore;

    @ManyToOne
    @JoinColumn(name = "ANSWER_RECORD_ID")
    private  ExamAnswerRecord answerRecordId;

    @ManyToOne
    @JoinColumn(name = "MARKED_BY")
    private User markedBy;

    @ManyToOne
    @JoinColumn(name = "RESULT_ID")
    private ExamResult resultId;




    public ExamAnswerRecord getAnswerRecordId() {
        return answerRecordId;
    }

    public void setAnswerRecordId(ExamAnswerRecord recordId) {
        this.answerRecordId = recordId;
    }

    public ExamResult getResultId() {
        return resultId;
    }

    public void setResultId(ExamResult resultId) {
        this.resultId = resultId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMarkingScore() {
        return markingScore;
    }

    public void setMarkingScore(Integer markingScore) {
        this.markingScore = markingScore;
    }

    public ExamAnswerRecord getrecordId() {
        return answerRecordId;
    }

    public void setrecordId(ExamAnswerRecord recordId) {
        this.answerRecordId = recordId;
    }

    public User getMarkedBy() {
        return markedBy;
    }

    public void setMarkedBy(User markedBy) {
        this.markedBy = markedBy;
    }
}
