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
    @JoinColumn(name = "MARKEDBY",referencedColumnName = "USER_ID")
    private  User markedBy;

    @Column(name = "COMMENTING")
    private  String comment;

    @Column(name = "RESULT_SCORE")
    private Integer resultScore;



}
