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
@Table(name="TDCS_QUESTIONS")
public class Question implements Serializable {
//    @SequenceGenerator(name = "TDCS_QUESTION_TRIG", sequenceName = "TDCS_QUESTION_SEQ")
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="QUESTION_ID")
    private Integer id;

    @Column(name = "QUESTION_DESCRIPTION")
    private String description;

    @Column(name="QUESTION_SCORE")
    private Float score;

    @Column(name="QUESTION_CREATE_DATE")
    private Date createDate;

    @ManyToOne
    @JoinColumn(name="DIFFICULTY_LEVEL")
    private Difficulty difficultyLevel;

    @ManyToOne
    @JoinColumn(name="SUB_CATEGORY_ID")
    private SubCategory subCategory;

    @ManyToOne
    @JoinColumn(name="QUESTION_TYPE_ID")
    private QuestionType questionType;

    @ManyToOne
    @JoinColumn(name="QUESTION_CREATE_BY")
    private User createBy;

    @ManyToOne
    @JoinColumn(name = "QUESTION_STATUS")
    private Status status;

//    @OneToMany(mappedBy = "questionId")
//    private Set<ExamAnswerRecord> examAnswerRecords;

    @ManyToMany(mappedBy = "questions" ,fetch = FetchType.LAZY)
    private Set<ExamPaper> examPapers = new HashSet<ExamPaper>();

//    @OneToMany(mappedBy = "question")
//    private Set<Choice> choices;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Question)) return false;

        Question question = (Question) o;

        if (getId() != null ? !getId().equals(question.getId()) : question.getId() != null) return false;
        if (getDescription() != null ? !getDescription().equals(question.getDescription()) : question.getDescription() != null)
            return false;
        if (getScore() != null ? !getScore().equals(question.getScore()) : question.getScore() != null) return false;
        if (getCreateDate() != null ? !getCreateDate().equals(question.getCreateDate()) : question.getCreateDate() != null)
            return false;
        if (getDifficultyLevel() != null ? !getDifficultyLevel().equals(question.getDifficultyLevel()) : question.getDifficultyLevel() != null)
            return false;
        if (getSubCategory() != null ? !getSubCategory().equals(question.getSubCategory()) : question.getSubCategory() != null)
            return false;
        if (getQuestionType() != null ? !getQuestionType().equals(question.getQuestionType()) : question.getQuestionType() != null)
            return false;
        if (getCreateBy() != null ? !getCreateBy().equals(question.getCreateBy()) : question.getCreateBy() != null)
            return false;
        return !(getStatus() != null ? !getStatus().equals(question.getStatus()) : question.getStatus() != null);

    }

    @Override
    public int hashCode() {
        int result = getId() != null ? getId().hashCode() : 0;
        result = 31 * result + (getDescription() != null ? getDescription().hashCode() : 0);
        result = 31 * result + (getScore() != null ? getScore().hashCode() : 0);
        result = 31 * result + (getCreateDate() != null ? getCreateDate().hashCode() : 0);
        result = 31 * result + (getDifficultyLevel() != null ? getDifficultyLevel().hashCode() : 0);
        result = 31 * result + (getSubCategory() != null ? getSubCategory().hashCode() : 0);
        result = 31 * result + (getQuestionType() != null ? getQuestionType().hashCode() : 0);
        result = 31 * result + (getCreateBy() != null ? getCreateBy().hashCode() : 0);
        result = 31 * result + (getStatus() != null ? getStatus().hashCode() : 0);
        return result;
    }

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

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
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

    public SubCategory getSubCategory() {
        return subCategory;
    }

    public void setSubCategory(SubCategory subCategoryId) {
        this.subCategory = subCategoryId;
    }

    public QuestionType getQuestionType() {
        return questionType;
    }

    public void setQuestionType(QuestionType questionTypeId) {
        this.questionType = questionTypeId;
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

//    public Set<ExamAnswerRecord> getExamAnswerRecords() {
//        return examAnswerRecords;
//    }
//
//    public void setExamAnswerRecords(Set<ExamAnswerRecord> examAnswerRecords) {
//        this.examAnswerRecords = examAnswerRecords;
//    }

    public Set<ExamPaper> getExamPapers() {
        return examPapers;
    }

    public void setExamPapers(Set<ExamPaper> examPapers) {
        this.examPapers = examPapers;
    }

//    public Set<Choice> getChoices() {
//        return choices;
//    }
//
//    public void setChoices(Set<Choice> choices) {
//        this.choices = choices;
//    }
}
