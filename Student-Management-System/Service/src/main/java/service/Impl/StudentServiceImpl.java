package service.Impl;

import com.github.pagehelper.PageHelper;
import dao.StudentDao;
import domain.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.StudentService;

import java.util.List;

/**
 * 学生业务层实现类
 */
@Service  //声明此接口为service
@Transactional
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public List<Student> StudentfindAll(int page,int size) {

        PageHelper.startPage(page,size);
        return studentDao.StudentfindAll(page,size);
    }

    @Override
    public void StudentAdd(Student student) {
        studentDao.StudentAdd(student);
    }

    @Override
    public void DeleteById(Integer id) {
        studentDao.DeleteById(id);
    }

    @Override
    public Student findById(String id) {
        return studentDao.findById(id);
    }

    @Override
    public int updateById(String id, String name, String age, String gender, String address, String profession, String grade, String upid) {
        return studentDao.updateById(id,name,age,gender,address,profession,grade,upid);
    }


}
