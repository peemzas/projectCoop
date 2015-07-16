package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Phuthikorn_T on 7/1/2015.
 */

@Entity
@Table(name="TDCS_EXAM_RESULTS")
public class ExamResult implements Serializable {

    @Id
    @Column(name = "RESULT_ID")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "USER_ID")
    private User userId;

    @ManyToOne
    @JoinColumn(name = "PAPER_ID")
    private ExamAnswerRecord paperId;

    @ManyToOne
    @JoinColumn(name = "MARKED_BY",referencedColumnName = "USER_ID")
    private  User markedBy;

    @Column(name = "COMMENTING")
    private  String comment;

    @Column(name = "RESULT_SCORE")
    private Integer resultScore;

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

    public ExamAnswerRecord getPaperId() {
        return paperId;
    }

    public void setPaperId(ExamAnswerRecord paperId) {
        this.paperId = paperId;
    }

    public User getMarkedBy() {
        return markedBy;
    }

    public void setMarkedBy(User markedBy) {
        this.markedBy = markedBy;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getResultScore() {
        return resultScore;
    }

    public void setResultScore(Integer resultScore) {
        this.resultScore = resultScore;
    }
}
