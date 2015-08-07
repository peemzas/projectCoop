package com.springapp.mvc.pojo.exam;

import com.springapp.mvc.pojo.User;

import javax.persistence.*;
import java.awt.print.Paper;
import java.util.Date;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Entity
@Table(name = "TDCS_EXAM_RECORDS")
public class ExamRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "TDCS_EXAM_RECORD_ID_SEQ_GEN")
    @SequenceGenerator(name = "TDCS_EXAM_RECORD_ID_SEQ_GEN", sequenceName = "TDCS_EXAM_RECORD_SEQ")
    @Column(name = "RECORD_ID")
    private Integer recordId;

    @ManyToOne
    @JoinColumn(name = "USER_ID")
    private User userId;

    @ManyToOne
    @JoinColumn(name = "PAPER_ID")
    private ExamPaper paperId;

    @Column(name = "EXAM_DATE")
    private Date examDate;


}
