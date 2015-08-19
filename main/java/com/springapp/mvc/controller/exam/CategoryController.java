package com.springapp.mvc.controller.exam;

import com.google.gson.Gson;
import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.QueryCategoryDomain;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public  class CategoryController {

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



// return null;
    }
//    Add by Mr. Wanchana Himself
    @RequestMapping(value = "/exam/getAllCategory",method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> getAllCategory() {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<Category> categories = queryCategoryDomain.getListCategories();
        String json = new Gson().toJson(categories);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/deleteCategory", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity deleteCategory(@ModelAttribute("id") String categoryId){

        queryCategoryDomain.deleteCategory(categoryId);


        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/editCategory", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity editCategory(@Valid Category category){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        queryCategoryDomain.editCategory(category);

        return new ResponseEntity(headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/searchCategory", method = RequestMethod.POST)
    @ResponseBody
//    public ResponseEntity<String> searchCategory(@ModelAttribute("id") String categoryId,
//                                                 @ModelAttribute("name") String categoryName,
//                                                 HttpServletRequest request){
    public ResponseEntity<String> searchCategory(@ModelAttribute("name") String categoryName){

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<Category> categories = queryCategoryDomain.searchCategory(categoryName);
        String json = new Gson().toJson(categories);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }
}
