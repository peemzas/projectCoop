package com.springapp.mvc.pojo.exam;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by Phuthikorn_T on 7/1/2015.
 */
@Entity
@Table(name="TDCS_CHOICES")
public class Choice  implements Serializable {

    @Id
    @Column(name="CHOICE_ID")
    private Integer id;

    @Column(name="CHOICE_DESCRIPTION")
    private String description;

    @ManyToOne
    @JoinColumn(name="CHOICE_CORRECTION")
    private Boo correction;

    @ManyToOne
    @JoinColumn(name="QUESTION_ID")
    private Question questionId;

    @ManyToOne
    @JoinColumn(name = "CHOICE_STATUS")
    private Status status;

    @OneToMany(mappedBy = "answerObjective")
    private Set<ExamAnswerRecord> examAnswerRecords;

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

    public Boo getCorrection() {
        return correction;
    }

    public void setCorrection(Boo correction) {
        this.correction = correction;
    }

    public Question getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Question questionId) {
        this.questionId = questionId;
    }
}
