package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

import com.springapp.mvc.pojo.exam.PaperQuestion;

/**
 * Created by Phuthikorn_T on 6/30/2015.
 */

@Entity
@Table(name = "TDCS_EXAM_PAPERS")
public class ExamPaper implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_EXAM_PAPER_ID_SEQ_GEN")
    @SequenceGenerator(name = "TDCS_EXAM_PAPER_ID_SEQ_GEN", sequenceName = "TDCS_EXAM_PAPER_SEQ")
    @Column(name = "PAPER_ID")
    private Integer id;

    @Column(name = "PAPER_NAME")
    private String name;

    @Column(name = "PAPER_CREATE_DATE")
    private Date createDate;

    @Column(name = "PAPER_MAX_SCORE")
    private Integer maxScore;

    @ManyToOne
    @JoinColumn(name = "PAPER_CREATE_BY")
    private User createBy;

//    @ManyToOne
//    @JoinColumn(name = "PROPORTIONAL_SCORE")
//    private Boo proportionalScore;f

    @Column(name = "PAPER_CODE")
    private String code;

    @Column(name = "PAPER_UPDATE_DATE")
    private Date updateDate;

    @Column(name = "PAPER_TIME_LIMIT_MINUTE")
    private Integer timeLimit;

    @Column(name = "PAPER_FOR_POSITION")
    private String position;

    @ManyToOne
    @JoinColumn(name = "PAPER_UPDATE_BY")
    private User updateBy;

//    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinTable(name = "TDCS_PAPER_CONTAINING",
//            joinColumns = {@JoinColumn(name = "PAPER_ID", nullable = false, updatable = false)},
//            inverseJoinColumns = {@JoinColumn(name = "QUESTION_ID", nullable = false, updatable = false)})
//    private Set<Question> questions = new HashSet<Question>();

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

    public Integer getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(Integer maxScore) {
        this.maxScore = maxScore;
    }

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
