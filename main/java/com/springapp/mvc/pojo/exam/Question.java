package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by Phuthikorn_T on 6/30/2015.
 */

@Entity
@Table(name="TDCS_QUESTIONS")
public class Question implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_QUESTION_ID_SEQ_GEN")
    @SequenceGenerator(name = "TDCS_QUESTION_ID_SEQ_GEN", sequenceName = "TDCS_QUESTION_SEQ")
    @Column(name="QUESTION_ID")
    private Integer id;

    @Column(name = "QUESTION_DESCRIPTION")
    private String description;

    @Column(name="QUESTION_SCORE")
    private String score;

    @Column(name="QUESTION_CREATE_DATE")
    private Date createDate;

    @ManyToOne
    @JoinColumn(name="DIFFICULTY_LEVEL")
    private Difficulty difficultyLevel;

    @ManyToOne
    @JoinColumn(name="SUB_CATEGORY_ID")
    private SubCategory subCategoryId;

    @ManyToOne
    @JoinColumn(name="QUESTION_TYPE_ID")
    private QuestionType questionTypeId;

    @ManyToOne
    @JoinColumn(name="QUESTION_CREATE_BY")
    private User createBy;

    @ManyToOne
    @JoinColumn(name = "QUESTION_STATUS")
    private Status status;

    @OneToMany(mappedBy = "questionId")
    private Set<ExamAnswerRecord> examAnswerRecords;

    @ManyToMany(mappedBy = "questions")
    private Set<ExamPaper> examPapers;

    @OneToMany(mappedBy = "questionId")
    private Set<Choice> choices;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Difficulty getDifficultyLevel() {
        return difficultyLevel;
    }

    public void setDifficultyLevel(Difficulty difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }

    public SubCategory getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(SubCategory subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public QuestionType getQuestionTypeId() {
        return questionTypeId;
    }

    public void setQuestionTypeId(QuestionType questionTypeId) {
        this.questionTypeId = questionTypeId;
    }

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Set<ExamAnswerRecord> getExamAnswerRecords() {
        return examAnswerRecords;
    }

    public void setExamAnswerRecords(Set<ExamAnswerRecord> examAnswerRecords) {
        this.examAnswerRecords = examAnswerRecords;
    }

    public Set<ExamPaper> getExamPapers() {
        return examPapers;
    }

    public void setExamPapers(Set<ExamPaper> examPapers) {
        this.examPapers = examPapers;
    }

    public Set<Choice> getChoices() {
        return choices;
    }

    public void setChoices(Set<Choice> choices) {
        this.choices = choices;
    }
}
