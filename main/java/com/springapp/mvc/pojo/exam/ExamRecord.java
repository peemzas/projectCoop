package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.awt.print.Paper;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Entity
@Table(name = "TDCS_EXAM_RECORDS")
public class ExamRecord implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_EXAM_RECORD_ID_SEQ_GEN")
    @SequenceGenerator(name = "TDCS_EXAM_RECORD_ID_SEQ_GEN", sequenceName = "TDCS_EXAM_RECORD_SEQ")
    @Column(name = "RECORD_ID")
    private Integer recordId;

    @ManyToOne
    @JoinColumn(name = "USER_ID")
    private User userId;

    @ManyToOne
    @JoinColumn(name = "PAPER_ID")
    private ExamPaper paperId;

    @Column(name = "EXAM_DATE")
    private Date examDate;

    @Column(name = "TIME_TAKEN")
    private Float timeTaken;


    public Float getTimeTaken() {
        return timeTaken;
    }

    public void setTimeTaken(Float timeTaken) {
        this.timeTaken = timeTaken;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public ExamPaper getPaperId() {
        return paperId;
    }

    public void setPaperId(ExamPaper paperId) {
        this.paperId = paperId;
    }

    public Date getExamDate() {
        return examDate;
    }

    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }
}
