package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Phuthikorn_T on 7/1/2015.
 */

@Entity
@Table(name = "TDCS_EXAM_RESULTS")
public class ExamResult implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_EXAM_RESULT_ID_SEQ_GEN")
    @SequenceGenerator(name = "TDCS_EXAM_RESULT_ID_SEQ_GEN", sequenceName = "TDCS_EXAM_RESULT_SEQ")
    @Column(name = "RESULT_ID")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "MARKED_BY", referencedColumnName = "USER_ID")
    private User markedBy;

    @Column(name = "COMMENTING")
    private String comment;

    @Column(name = "OBJECTIVE_SCORE")
    private BigDecimal objectiveScore;

    @Column(name = "SUBJECTIVE_SCORE")
    private BigDecimal subjectiveScore;

    @Column(name = "MARKED_DATE")
    private Date markedDate;

    @ManyToOne
    @JoinColumn(name = "EXAM_RECORD_ID")
    private ExamRecord examRecord;

    @ManyToOne
    @JoinColumn(name = "RESULT_STATUS")
    private Status status;

    public Date getMarkedDate() {
        return markedDate;
    }

    public void setMarkedDate(Date markedDate) {
        this.markedDate = markedDate;
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

    public BigDecimal getObjectiveScore() {
        return objectiveScore;
    }

    public void setObjectiveScore(BigDecimal objectiveScore) {
        this.objectiveScore = objectiveScore;
    }

    public BigDecimal getSubjectiveScore() {
        return subjectiveScore;
    }

    public void setSubjectiveScore(BigDecimal subjectiveScore) {
        this.subjectiveScore = subjectiveScore;
    }
}
