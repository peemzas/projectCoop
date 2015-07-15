package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;

/**
 * Created by Phuthikorn_T on 7/15/2015.
 */
@Entity
@Table(name="TDCS_EXAM_MARKING_RECORDS")
public class ExamMarkingRecord {

    @Id
    @Column(name="MARKING_RECORD_ID")
    private Integer id;

    @Column(name = "MARKING_SCORE")
    private Integer markingScore;

    @ManyToOne
    @JoinColumn(name = "RECORD_ID")
    private  ExamAnswerRecord recordId;

    @ManyToOne
    @JoinColumn(name = "MARKED_BY")
    private User markedBy;

    @Override
    public String toString() {
        return "ExamMarkingRecord{" +
                "id=" + id +
                ", markingScore=" + markingScore +
                ", recordId=" + recordId +
                ", markedBy=" + markedBy +
                '}';
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
        return recordId;
    }

    public void setrecordId(ExamAnswerRecord recordId) {
        this.recordId = recordId;
    }

    public User getMarkedBy() {
        return markedBy;
    }

    public void setMarkedBy(User markedBy) {
        this.markedBy = markedBy;
    }
}
