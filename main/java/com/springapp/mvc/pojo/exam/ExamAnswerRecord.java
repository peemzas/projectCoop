package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by Phuthikorn_T on 7/1/2015.
 */
@Entity
@Table(name="TDCS_EXAM_ANSWER_RECORDS")
public class ExamAnswerRecord implements Serializable {

    @Id
    @Column(name="ANSWER_RECORD_ID")
    private Integer id;

    @ManyToOne
    @JoinColumn(name="USER_ID")
    private User userId;

    @ManyToOne
    @JoinColumn(name="PAPER_ID")
    private ExamPaper paperId;

    @ManyToOne
    @JoinColumn(name="QUESTION_ID")
    private Question questionId;

    @ManyToOne
    @JoinColumn(name="ANSWER_OBJECTIVE")
    private Choice answerObjective;

    @Column(name="ANSWER_SUBJECTIVE")
    private String answerSubjective;

    @OneToMany(mappedBy = "recordId")
    private Set<ExamMarkingRecord> examMarkingRecords;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Question getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Question questionId) {
        this.questionId = questionId;
    }

    public Choice getAnswerObjective() {
        return answerObjective;
    }

    public void setAnswerObjective(Choice answerObjective) {
        this.answerObjective = answerObjective;
    }

    public String getAnswerSubjective() {
        return answerSubjective;
    }

    public void setAnswerSubjective(String answerSubjective) {
        this.answerSubjective = answerSubjective;
    }
}
