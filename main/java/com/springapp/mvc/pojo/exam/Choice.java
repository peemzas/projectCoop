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

    @OneToMany(mappedBy = "answerObjective")
    private Set<ExamAnswerRecord> examAnswerRecords;


    @Override
    public String toString() {
        return "Choice{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", correction=" + correction +
                ", questionId=" + questionId +
                '}';
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
