package com.springapp.mvc.controller;

import com.springapp.mvc.domain.*;
import com.springapp.mvc.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/TDCS")
public class InPageController {

    @Autowired
    private QueryUniversityDomain queryUniversityDomain;
    @Autowired
    private QueryFacutyDomain queryFacutyDomain;
    @Autowired
    private QueryMajorDomain queryMajorDomain;
    @Autowired
    private QueryUserDomain queryUserDomain;
    @Autowired
    private QueryJobDomain queryJobDomain;
    @Autowired
    private QueryApprentieDomain queryApprentieDomain;
    @Autowired
    private QueryCompanyDomain queryCompanyDomain;
    @Autowired
    private QueryPositionDomain queryPositionDomain ;
    @Autowired
    private QuerySectionDomain querySectionDomain  ;
    @Autowired
    private FindAllDataTableDomain findAllDataTableDomain;
    @Autowired
    private QuerySectionPositionDomain querySectionPositionDomain;
    @Autowired
    private QueryTeamDomain queryTeamDomain;
    @Autowired
    private QueryTopicDomain queryTopicDomain;


    @RequestMapping(method = RequestMethod.GET, value = "/picture")
    public String picture(ModelMap model,  HttpServletRequest request) {

        List<User> list = findAllDataTableDomain.searchId(User.class,"userName", (String) request.getSession().getAttribute("username"));
        model.addAttribute("picName",list.get(0).getImange());
        return "pacturePage";
    }


    @RequestMapping(method = RequestMethod.GET, value = "/addStudent")
    public String addStudent(ModelMap model, @ModelAttribute("studentData") User user, HttpServletRequest request) {
        try {
            request.getSession().setAttribute("countUserValidate", queryUserDomain.getCountUserValidate(request.getSession().getAttribute("session_piority").toString()));
            model.addAttribute("countUserValidate", request.getSession().getAttribute("status"));
        }catch (NullPointerException e){
            e.printStackTrace();
        }
        List<University> lisUniver = queryUniversityDomain.getAllUniversity();
        List<User> listUser = queryUserDomain.getStaff();
        model.addAttribute("listUser", listUser);
        model.addAttribute("listUni", lisUniver);
        model.addAttribute("listApp", queryApprentieDomain.getApprentice());
        model.addAttribute("listPosition", queryJobDomain.getJop("s"));
        return "addStudent";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/addStaff")
    public String addStaff(ModelMap model, @ModelAttribute("staffData") User user) {
        List<Company> list = queryCompanyDomain.getCompanyList();
        model.addAttribute("listComp", list);
        return "addStaff";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/searchStudent")
    public String searchStu(ModelMap model, HttpServletRequest request) {
        try {
            if (request.getSession().getAttribute("status").toString().equals("staff")) {
                request.getSession().setAttribute("countUserValidate", queryUserDomain.getCountUserValidate(request.getSession().getAttribute("session_piority").toString()));
                model.addAttribute("countUserValidate", request.getSession().getAttribute("countUserValidate"));
            }
        }catch (NullPointerException e){
            e.printStackTrace();
        }
        model.addAttribute("listUni", queryUniversityDomain.getAllUniversity());
        model.addAttribute("listFac", queryFacutyDomain.getAllFaculty());
        model.addAttribute("listMaj", queryMajorDomain.getAllMajor());
        model.addAttribute("listJob", queryJobDomain.getJop("s"));
        model.addAttribute("listUser", queryUserDomain.getStaff()); // Edit by PEEM


        return "searchStudent";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/searchStaff")
    public String searchStaff(ModelMap model) {
        model.addAttribute("listCompany", queryCompanyDomain.getCompanyList());
        model.addAttribute("listPosition", queryPositionDomain.getPositionByStatus("e"));
        model.addAttribute("listSection", querySectionDomain.getAllSection());
        return "searchStaff";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/home")
    public String userData(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
//            List<User> users = findAllDataTableDomain.searchId(User.class,"userName",request.getSession().getAttribute("username").toString());
            List<User> users = queryUserDomain.
                    getStudentUserDataList(
                            Integer.parseInt(request.getSession().getAttribute("userid").toString()),
                            request.getSession().getAttribute("status").toString());
            model.addAttribute("user",users);
            if(request.getSession().getAttribute("status").toString().equals("user")) {
                model.addAttribute("listApp", queryApprentieDomain.getApprentice());
                model.addAttribute("listPosition", queryJobDomain.getJop("s"));
                model.addAttribute("listUser", queryUserDomain.getStaff());
                model.addAttribute("countUserValidate", request.getSession().getAttribute("countUserValidate"));
                model.addAttribute("viewEva", queryUserDomain.getViewEva(Integer.parseInt(request.getSession().getAttribute("userid").toString())));

                try {
                    request.getSession().setAttribute("countUserValidate", queryUserDomain.getCountUserValidate(request.getSession().getAttribute("session_piority").toString()));
                }catch (NullPointerException e){
                    e.printStackTrace();
                }
                return "homeUser";
            }else if(request.getSession().getAttribute("status").toString().equals("staff")){
//                List<SectionPosition> spBuffer = findAllDataTableDomain.searchByIntegerColumn(SectionPosition.class,"spId",users.get(0).getSpId());
                users.get(0).setSectionPosition(querySectionPositionDomain.getSectionPositionClass(users.get(0).getSpId()));
                users.get(0).setTeam(queryTeamDomain.getTeamDatas(users.get(0).getTeamId()));
                List<Company> companyList = queryCompanyDomain.getCompanyList();
                List<Section> sectionList = findAllDataTableDomain.searchByIntegerColumn(Section.class,"conpId",users.get(0).getCompId());
//                Integer integer = spBuffer.get(0).getSectionId();
//                List<SectionPosition> sectionPositionList = findAllDataTableDomain.searchByIntegerColumn(SectionPosition.class,"sectionId",spBuffer.get(0).getSectionId());
                List<SectionPosition> sectionPositionList = findAllDataTableDomain.searchByIntegerColumn(SectionPosition.class,"sectionId",users.get(0).getSectionPosition().getSectionId());
                model.addAttribute("listComp", companyList);
                model.addAttribute("listSection",sectionList);
                model.addAttribute("listSectionPosition",sectionPositionList);
                try{
                    request.getSession().setAttribute("countUserValidate", queryUserDomain.getCountUserValidate(request.getSession().getAttribute("session_piority").toString()));
                }catch (NullPointerException e){
                    e.printStackTrace();
                }
                return "homeStaff";
            }else {
                //                List<SectionPosition> spBuffer = findAllDataTableDomain.searchByIntegerColumn(SectionPosition.class,"spId",users.get(0).getSpId());
                users.get(0).setSectionPosition(querySectionPositionDomain.getSectionPositionClass(users.get(0).getSpId()));
                users.get(0).setTeam(queryTeamDomain.getTeamDatas(users.get(0).getTeamId()));
                List<Company> companyList = queryCompanyDomain.getCompanyList();
                List<Section> sectionList = findAllDataTableDomain.searchByIntegerColumn(Section.class,"conpId",users.get(0).getCompId());
//                Integer integer = spBuffer.get(0).getSectionId();
//                List<SectionPosition> sectionPositionList = findAllDataTableDomain.searchByIntegerColumn(SectionPosition.class,"sectionId",spBuffer.get(0).getSectionId());
                List<SectionPosition> sectionPositionList = findAllDataTableDomain.searchByIntegerColumn(SectionPosition.class,"sectionId",users.get(0).getSectionPosition().getSectionId());
                model.addAttribute("listComp", companyList);
                model.addAttribute("listSection",sectionList);
                model.addAttribute("listSectionPosition",sectionPositionList);
                try{
                    request.getSession().setAttribute("countUserValidate", queryUserDomain.getCountUserValidate(request.getSession().getAttribute("session_piority").toString()));
                }catch (NullPointerException e){
                    e.printStackTrace();
                }
                return "homeStaff";
            }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/evaluation")
    public String evaluation(ModelMap model, HttpServletRequest request) {
        model.addAttribute("viewEva", queryUserDomain.getViewEva(Integer.parseInt(request.getSession().getAttribute("userid").toString())));
        return "evaluation";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/validate")
    public String validate(ModelMap model, HttpServletRequest request, @RequestParam(value = "page", required = false) Integer page) {
        if (page == null)
            page = 1;
        model.addAttribute("validate", queryUserDomain.getUserValidate(
                        request.getSession().getAttribute("session_piority").toString(),
                        page
                )
        );
        request.getSession().setAttribute("countUserValidate", queryUserDomain.getCountUserValidate(request.getSession().getAttribute("session_piority").toString()));
        Integer count = Integer.parseInt(request.getSession().getAttribute("countUserValidate").toString());
        model.addAttribute("countUserValidate", count);
        Integer pageNumber = Integer.parseInt(count / 10 + "");
        if (count % 10 != 0) {
            pageNumber++;
        }
        if (page > pageNumber) {
            model.addAttribute("notPage",1);
        }else model.addAttribute("notPage",0);
        model.addAttribute("pageCount", pageNumber);
        model.addAttribute("currentPage", page);
        return "validate";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("status");
        return "login";
    }

    @RequestMapping(method = RequestMethod.GET, value = "viewevaluate")
    public String afterEvaluation(ModelMap model,HttpServletRequest request) {
        queryUserDomain.setViewEva(Integer.parseInt(request.getSession().getAttribute("userid").toString()));
        model.addAttribute("viewEva", queryUserDomain.getViewEva(Integer.parseInt(request.getSession().getAttribute("userid").toString())));
        return "viewEvaluate";
    }

}
