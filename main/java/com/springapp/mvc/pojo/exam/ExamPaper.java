package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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

    @Column(name = "PAPER_EXAM_TIME_MINUTE")
    private Integer examTime;

    @ManyToOne
    @JoinColumn(name = "PAPER_CREATE_BY")
    private User createBy;

    @ManyToOne
    @JoinColumn(name = "PROPORTIONAL_SCORE")
    private Boo proportionalScore;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "TDCS_PAPER_CONTAINING",
            joinColumns = {@JoinColumn(name = "PAPER_ID",nullable = false , updatable = false)},
            inverseJoinColumns = {@JoinColumn(name = "QUESTION_ID",nullable = false , updatable = false)})
    private Set<Question> questions = new HashSet<Question>();


    public Integer getExamTime() {
        return examTime;
    }

    public Boo getProportionalScore() {
        return proportionalScore;
    }

    public void setProportionalScore(Boo proportionalScore) {
        this.proportionalScore = proportionalScore;
    }

    public void setExamTime(Integer examTime) {
        this.examTime = examTime;
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


    public Set<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }
}
