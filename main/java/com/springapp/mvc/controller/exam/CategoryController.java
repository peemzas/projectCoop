package com.springapp.mvc.controller.exam;

import com.google.gson.Gson;
import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.QueryCategoryDomain;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.Category;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.springapp.mvc.util.HibernateUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.xml.ws.Response;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by Phuthikorn_T on 8/5/2015.
 */
@Controller
@RequestMapping("/TDCS")
public class CategoryController {

    @Autowired
    QueryCategoryDomain queryCategoryDomain;

    @Autowired
    QueryUserDomain queryUserDomain;

    private static final Logger logger = Logger.getLogger(Category.class.getName());

    @RequestMapping(method = RequestMethod.POST, value = "/exam/addCategory")
    @ResponseBody
    public void addCategory(ModelMap model, @Valid Category category
            , HttpServletRequest request, HttpServletResponse response) {

        User createBy = queryUserDomain.getCurrentUser(request);
        category.setCreateBy(createBy);

        queryCategoryDomain.insertCategory(category);


// return null;
    }

    //    Add by Mr. Wanchana
    @RequestMapping(value = "/exam/getAllCategory", method = RequestMethod.POST)
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
    public void deleteCategory(@RequestParam(value = "catId", required = true) String catId) {

        Category category = queryCategoryDomain.getCategoryById(catId);
        queryCategoryDomain.deleteCategory(category);
    }

    @RequestMapping(value = "/exam/editCategory", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity editCategory(@Valid Category category,
                                       HttpServletRequest request) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        User createBy = queryUserDomain.getCurrentUser(request);
        category.setCreateBy(createBy);
        queryCategoryDomain.editCategory(category);

        return new ResponseEntity(headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/exam/searchCategory", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> searchCategory(@ModelAttribute("id") String categoryId,
                                                 HttpServletRequest request) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List<Category> categories = queryCategoryDomain.searchCategory(categoryId);
        logger.info(String.valueOf(categories+"++++++++++++++++++++++++++++++++++"));
        String json = new Gson().toJson(categories);

        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
    }

//    @RequestMapping(value = "/exam/LOVcategory", method = RequestMethod.POST)
//    @ResponseBody
//    public ResponseEntity<String> LOVcategory(@RequestParam(value = "categoryId", required = false) String categoryId) {
//
//        logger.info(String.valueOf(categoryId+"+++++"));
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Content-Type", "application/json;charset=UTF-8");
//
//        List<Category> getCategoryByIdLOV = queryCategoryDomain.getCategoryByIdLOV(categoryId);
//
//        String json = new Gson().toJson(getCategoryByIdLOV);
//
//        return new ResponseEntity<String>(json, headers, HttpStatus.OK);
//    }
}
