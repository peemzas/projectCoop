package com.springapp.mvc.controller.exam;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.QueryCategoryDomain;
import com.springapp.mvc.domain.exam.QuerySubCategoryDomain;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.SubCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Phuthikorn_T on 8/7/2015.
 */
@Controller
@RequestMapping("/TDCS")
public class manageSubCategoryController {

    @Autowired
    QueryUserDomain queryUserDomain;

    @Autowired
    QuerySubCategoryDomain querySubCategoryDomain;

    @Autowired
    QueryCategoryDomain queryCategoryDomain;


    @RequestMapping(method = RequestMethod.POST, value = "/exam/addSubCategory")
    @ResponseBody
    public void addSubCategory(Model model, @RequestParam(value = "categoryName",required = true)String categoryName,
                               @RequestParam(value = "name",required = true)String name,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        SubCategory subCategory = new SubCategory();

        subCategory.setName(name);
        subCategory.setCategory(queryCategoryDomain.getCategoryByName(categoryName));

        System.out.println(subCategory.getName());

        User currentUser = queryUserDomain.getCurrentUser(request);

        System.out.println(currentUser);

        subCategory.setCreateBy(currentUser);

        System.out.println(subCategory.getCategory());

        System.out.println("Prepare to Insert");

        if (querySubCategoryDomain.checkSubCategoryDuplication(subCategory)) {

            querySubCategoryDomain.insertSubCategory(subCategory);

        } else {
            throw new Exception("Duplicate SubCategory");
        }
    }


}
