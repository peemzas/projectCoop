package com.springapp.mvc.controller.exam;

import com.springapp.mvc.domain.exam.QueryCategoryDomain;
import com.springapp.mvc.pojo.exam.Category;
import com.springapp.mvc.pojo.exam.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Controller
@RequestMapping("/TDCS")
public class AddCategoryController {

    @Autowired
    QueryCategoryDomain queryCategoryDomain;

//    @RequestMapping(value = "/TDCS/exam/addCategory",method = RequestMethod.POST)
//    @ResponseBody
//    public ResponseEntity addCategory(ModelMap model, @Valid Category category
//            ,HttpServletRequest request, HttpServletResponse response){
//
////        List<Category> list = queryCategoryDomain;
//
////        return list.get(0);
//    }
}
