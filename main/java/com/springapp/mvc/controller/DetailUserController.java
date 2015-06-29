package com.springapp.mvc.controller;

import com.springapp.mvc.domain.QueryUserDomain;
import com.springapp.mvc.pojo.User;
import com.springapp.mvc.util.ConvertListToJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by l3eal2 on 17/2/2558.
 */
@Controller
@RequestMapping("/TDCS")
public class DetailUserController {
    @Autowired
    QueryUserDomain queryUserDomain;

    @RequestMapping(method = RequestMethod.POST, value = "detail")
    public String detail(ModelMap model, @ModelAttribute("id") Integer id, HttpServletRequest request) {
        User user = queryUserDomain.getUserDatas(id);
        model.addAttribute("user", user);
        List<User> users = queryUserDomain.getStudentUserDataList(user.getUserId(), "user");
        model.addAttribute("users", users);

        return "detail";
    }

    @RequestMapping(value = "/findStaffName", method = RequestMethod.POST, produces = "text/html", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> positionSearch(Model model, @ModelAttribute("piority") String piority) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=UTF-8");

        List list = queryUserDomain.getUserDataByPiority(piority);

        String jsonList = null;
        try {
            jsonList = ConvertListToJson.toJson(list);
        } catch (Exception e) {
            e.getMessage();
            e.printStackTrace();
        }
        return new ResponseEntity<String>(jsonList, headers, HttpStatus.OK);
    }
}
