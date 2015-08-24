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
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_CHOICE_ID_SEQ_GEN")
    @SequenceGenerator(name = "TDCS_CHOICE_ID_SEQ_GEN", sequenceName = "TDCS_CHOICE_SEQ")
    @Column(name="CHOICE_ID")
    private Integer id;

    @Column(name="CHOICE_DESCRIPTION")
    private String description;

    @ManyToOne
    @JoinColumn(name="CHOICE_CORRECTION")
    private Boo correction;

    @ManyToOne
    @JoinColumn(name="QUESTION_ID")
    private Question question;

    @ManyToOne
    @JoinColumn(name = "CHOICE_STATUS")
    private Status status;

//    @OneToMany(mappedBy = "answerObjective")
//    private Set<ExamAnswerRecord> examAnswerRecords;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Choice)) return false;

        Choice choice = (Choice) o;

        if (getId() != null ? !getId().equals(choice.getId()) : choice.getId() != null) return false;
        if (getDescription() != null ? !getDescription().equals(choice.getDescription()) : choice.getDescription() != null)
            return false;
        if (getCorrection() != null ? !getCorrection().equals(choice.getCorrection()) : choice.getCorrection() != null)
            return false;
        if (getQuestion() != null ? !getQuestion().equals(choice.getQuestion()) : choice.getQuestion() != null)
            return false;
        return !(getStatus() != null ? !getStatus().equals(choice.getStatus()) : choice.getStatus() != null);

    }

    @Override
    public int hashCode() {
        int result = getId() != null ? getId().hashCode() : 0;
        result = 31 * result + (getDescription() != null ? getDescription().hashCode() : 0);
        result = 31 * result + (getCorrection() != null ? getCorrection().hashCode() : 0);
        result = 31 * result + (getQuestion() != null ? getQuestion().hashCode() : 0);
        result = 31 * result + (getStatus() != null ? getStatus().hashCode() : 0);
        return result;
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

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question questionId) {
        this.question = questionId;
    }
}
