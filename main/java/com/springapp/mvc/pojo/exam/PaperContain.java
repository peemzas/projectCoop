package com.springapp.mvc.pojo.exam;

import javax.persistence.*;

/**
 * Created by Phuthikorn_T on 15-Sep-15.
 */
@Entity
@Table(name = "TDCS_PAPER_CONTAINING")
public class PaperContain {
    @Id
    @ManyToOne
    @JoinColumn(name = "PAPER_ID")
    private ExamPaper examPaper;

    @Id
    @ManyToOne
    @JoinColumn(name = "QUESTION_ID")
    private Question question;

    @Column(name = "SCORE")
    private Float score;

    public ExamPaper getExamPaper() {
        return examPaper;
    }

    public void setExamPaper(ExamPaper examPaper) {
        this.examPaper = examPaper;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }
}
