package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Phuthikorn_T on 7/1/2015.
 */

@Entity
@Table(name = "TDCS_EXAM_RESULTS")
public class ExamResult implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_EXAM_RESULT_ID_SEQ_GEN")
    @Column(name = "RESULT_ID")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "MARKED_BY", referencedColumnName = "USER_ID")
    private User markedBy;

    @Column(name = "COMMENTING")
    private String comment;

    @Column(name = "OBJECTIVE_SCORE")
    private Float objectiveScore;

    @Column(name = "SUBJECTIVE_SCORE")
    private Float subjectiveScore;

    @ManyToOne
    @JoinColumn(name = "EXAM_RECORD_ID")
    private ExamRecord examRecord;

    @ManyToOne
    @JoinColumn(name = "RESULT_STATUS")
    private Status status;


    public Float getSubjectiveScore() {
        return subjectiveScore;
    }

    public void setSubjectiveScore(Float subjectiveScore) {
        this.subjectiveScore = subjectiveScore;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

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

    public User getMarkedBy() {
        return markedBy;
    }

    public void setMarkedBy(User markedBy) {
        this.markedBy = markedBy;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Float getObjectiveScore() {
        return objectiveScore;
    }

    public void setObjectiveScore(Float resultScore) {
        this.objectiveScore = resultScore;
    }
}
