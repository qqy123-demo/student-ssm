package dao;

import domain.Student;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 学生持久层
 */
public interface StudentDao {

    /**
     * 查询所有学生信息
     * @return
     */
    @Select("select * from student")
    public List<Student> StudentfindAll(int page,int size);

    /**
     * 添加学生信息
     * @param student
     */
    @Insert("insert into student(id,name,age,gender,address,profession,grade) values(#{id},#{name},#{age},#{gender},#{address},#{profession},#{grade})")
    public void StudentAdd(Student student);

    /**
     * 根据id删除指定学生信息记录
     */
    @Delete("DELETE FROM student WHERE id=#{id}")
    public void DeleteById(@Param("id")Integer id);

    /**
     * 根据id查询学生信息
     * @param id
     * @return
     */
    @Select("select * from student where id=#{id}")
    public Student findById(@Param("id") String id);

    /**
     * 根据id更新学生信息
     */
    @Update("update student set id=#{id},name=#{name},age=#{age},gender=#{gender},address=#{address},profession=#{profession},grade=#{grade} where id=#{upid}")
    public int updateById(@Param("id") String id,@Param("name") String name,@Param("age") String age,@Param("gender") String gender,@Param("address") String address,@Param("profession") String profession,@Param("grade") String grade,@Param("upid") String upid);
}
