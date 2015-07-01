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
@Table(name="TDCS_EXAM_PAPER")
public class ExamPaper implements Serializable {

    @Id
    @Column(name="PAPER_ID")
    private Integer id;

    @Column(name="PAPER_NAME")
    private String name;

    @Column(name="PAPER_CREATE_DATE")
    private Date createDate;

    @Column(name="PAPER_MAX_SCORE")
    private Integer maxScore;

    @ManyToOne
    @JoinColumn(name="PAPER_CREATEBY")
    private User createBy;


    @OneToMany(mappedBy = "paperId")
    private Set<ExamAnswerRecord> examAnswerRecords;

    @OneToMany(mappedBy = "")
    private Set<ExamResult> examResults;





}
