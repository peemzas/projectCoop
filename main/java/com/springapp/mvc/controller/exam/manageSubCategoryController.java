package com.springapp.mvc.controller.exam;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.domain.exam.QuerySubCategoryDomain;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.pojo.exam.SubCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

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


    @RequestMapping(method = RequestMethod.POST, value = "/exam/addSubCategory")
    @ResponseBody
    public void addSubCategory(Model model, @Valid SubCategory subCategory,
                               HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        User createBy = queryUserDomain.getCurrentUser(request);
        subCategory.setCreateBy(createBy);

        if (querySubCategoryDomain.checkSubCategoryDuplication(subCategory)) {

            querySubCategoryDomain.insertSubCategory(subCategory);

        } else {
            throw new Exception("Duplicate SubCategory");
        }
    }


}
