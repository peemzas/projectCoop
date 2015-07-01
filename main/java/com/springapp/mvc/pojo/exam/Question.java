package com.springapp.mvc.pojo.exam;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by Phuthikorn_T on 6/30/2015.
 */

@Entity
@Table(name="TDCS_QUESTIONS")
public class Question implements Serializable {

    @Id
    @Column(name="QUESTION_ID")
    private Integer id;

    @Column(name = "QUESTION_DESCRIPTION")
    private String description;


}
