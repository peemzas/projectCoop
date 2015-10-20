package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.Position;
import com.springapp.mvc.pojo.User;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

/**
 * Created by Phuthikorn_T on 6/30/2015.
 */

@Entity
@Table(name = "TDCS_EXAM_PAPERS")
public class ExamPaper implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "examPaper_id_generator")
    @SequenceGenerator(name = "examPaper_id_generator")
    @Column(name = "PAPER_ID")
    private Integer id;

    @Column(name = "PAPER_NAME")
    private String name;

    @Column(name = "PAPER_CREATE_DATE")
    private Date createDate;

    @Column(name = "PAPER_MAX_SCORE")
    private Float maxScore;

    @ManyToOne
    @JoinColumn(name = "PAPER_CREATE_BY")
    private User createBy;

    @Column(name = "PAPER_CODE")
    private String code;

    @Column(name = "PAPER_UPDATE_DATE")
    private Date updateDate;

    @Column(name = "PAPER_TIME_LIMIT_MINUTE")
    private Integer timeLimit;

    @ManyToOne
    @JoinColumn(name = "PAPER_FOR_POSITION")
    private Position position;

    @ManyToOne
    @JoinColumn(name = "PAPER_STATUS")
    private Status paperStatus;

    @ManyToOne
    @JoinColumn(name = "PAPER_UPDATE_BY")
    private User updateBy;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.examPaper", cascade =
            {CascadeType.PERSIST, CascadeType.MERGE})
    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE,
            org.hibernate.annotations.CascadeType.DELETE_ORPHAN})
    private Set<PaperQuestion> questions;


    public Integer getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(Integer timeLimit) {
        this.timeLimit = timeLimit;
    }

    public Set<PaperQuestion> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<PaperQuestion> questions) {
        this.questions = questions;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public User getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(User updateBy) {
        this.updateBy = updateBy;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Float getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(Float maxScore) {
        this.maxScore = maxScore;
    }

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Status getPaperStatus() {
        return paperStatus;
    }

    public void setPaperStatus(Status paperStatus) {
        this.paperStatus = paperStatus;
    }
}
