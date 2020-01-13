package controller;

import com.github.pagehelper.PageInfo;
import domain.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.StudentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;


    /**
     * 查询所有学生信息
     * @return
     */
    @RequestMapping("/StudentfindAll")
    public ModelAndView StudentfindAll(@RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10") int size){
        ModelAndView modelAndView = new ModelAndView();
        List<Student> StudentAll = studentService.StudentfindAll(page,size);
        PageInfo pageInfos=new PageInfo(StudentAll);
        modelAndView.addObject("pageInfos", pageInfos);
        modelAndView.setViewName("/Student");
        return modelAndView;
    }

    /**
     * 添加学生信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/StudentAdd",method = RequestMethod.POST,produces="text/html;charset=utf-8")
    @ResponseBody
    public String StudentAdd(HttpServletRequest request){
        Student id = studentService.findById(request.getParameter("id"));
        if(id==null){
            Student student = new Student();
            student.setId(request.getParameter("id"));
            student.setName(request.getParameter("name"));
            student.setAge(request.getParameter("age"));
            student.setGender(request.getParameter("gender"));
            student.setAddress(request.getParameter("address"));
            student.setProfession(request.getParameter("profession"));
            Integer.parseInt(request.getParameter("grade"));
            String grade = request.getParameter("grade");
            int i = Integer.parseInt(grade);
            student.setGrade(i);
            studentService.StudentAdd(student);
            return "添加成功";
        }else {
            return "添加失败,此id已有学生占用！";
        }
    }

    /**
     * 删除复选框，选中的记录
     * @param request
     */
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String str = request.getParameter("str");
        String[] s = str.split(" ");
        for (String id:s) {
            int i = Integer.parseInt(id);
            studentService.DeleteById(i);
        }
        response.setHeader("content-type","text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.getWriter().write("删除成功");
    }


    /**
     * 跳转到添加学生信息页面
     *由于WEB-INF目录下的jsp不能互相跳转（应该只是我不知道而已），所以只能通过反射去跳转
     * @return
     */
    @RequestMapping("/ToAdd_jsp")
    public String ToAdd_jsp(){
        return "/StudentAdd";
    }

    /**
     * 还是跳转，跳转到搜索结果页面，不了解别的跳转，我还写个鸡巴
     * @param request
     * @return
     */
    @RequestMapping("/TOsearch_jsp")
    public ModelAndView TOsearch_jsp(HttpServletRequest request){
       String Searchid= request.getParameter("Searchid");
        ModelAndView modelAndView = new ModelAndView();
        Student Search = studentService.findById(Searchid);
        if(Search==null){
            modelAndView.addObject("error", "查不到此id的学生信息！");
            modelAndView.setViewName("/search-error");
            return modelAndView;
        }
        modelAndView.addObject("Search", Search);
        modelAndView.setViewName("/search");
        return modelAndView;
    }

    /**
     * 跳转到更新学生信息页面
     * @param id
     * @return
     */
    @RequestMapping("/TOupdate_jsp")
    public ModelAndView TOupdate_jsp(String id){
        ModelAndView modelAndView = new ModelAndView();
        Student byId = studentService.findById(id);
        modelAndView.addObject("byId", byId);
        modelAndView.setViewName("/update");
        return modelAndView;
    }

    /**
     * 更新学生信息
     * @param request
     * @return
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST,produces="text/html;charset=utf-8")
    @ResponseBody
    public String update(HttpServletRequest request,String upid){
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String profession = request.getParameter("profession");
        String grade = request.getParameter("grade");
        int i = studentService.updateById(id, name, age, gender, address, profession, grade, upid);
        System.out.println(i);

        if(i==1){
            return "更新成功";
        }else {
            return "更新失败！";
        }

        }
    }

