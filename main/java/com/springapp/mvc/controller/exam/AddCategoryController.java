package com.springapp.mvc.controller.exam;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.QueryCategoryDomain;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.springapp.mvc.util.HibernateUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Controller
@RequestMapping("/TDCS")
public  class AddCategoryController {

    @Autowired
    QueryCategoryDomain queryCategoryDomain;

    @Autowired
    QueryUserDomain queryUserDomain;


    @RequestMapping(method = RequestMethod.POST, value = "/exam/addCategory")
    @ResponseBody
    public void  addCategory(ModelMap model, @Valid Category category
            ,HttpServletRequest request, HttpServletResponse response){

        User createBy = queryUserDomain.getCurrentUser(request);
        category.setCreateBy(createBy);

            queryCategoryDomain.insertCategory(category);

//        return null;
    }
}
