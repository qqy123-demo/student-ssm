package service;

import domain.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 学生业务层接口
 */
public interface StudentService {
    /**
     * 查询所有学生信息
     */
    public List<Student> StudentfindAll(int page,int size);

    /**
     * 添加学生信息
     * @param student
     */
    public void StudentAdd(Student student);

    /**
     * 根据id删除指定学生记录
     * @param id
     */
    public void DeleteById(Integer id);

    /**
     * 根据id查询学生信息
     * @param id
     * @return
     */
    public Student findById( String id);

    /**
     * 根据id更新学生信息
     * @param id
     * @param name
     * @param age
     * @param gender
     * @param address
     * @param profession
     * @param grade
     * @param upid
     * @return
     */
    public int updateById( String id, String name, String age, String gender, String address, String profession, String grade, String upid);

}
