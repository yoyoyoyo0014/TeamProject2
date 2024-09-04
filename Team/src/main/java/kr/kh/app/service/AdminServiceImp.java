package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.regex.Pattern;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import kr.kh.app.dao.ClassDAO;
import kr.kh.app.model.vo.MajorVO;
import kr.kh.app.model.vo.MemberVO;

public class AdminServiceImp implements AdminService {
    
    private ClassDAO classDao;
    
    public AdminServiceImp() {
        String resource = "kr/kh/app/config/mybatis-config.xml";
        InputStream inputStream;
        try {
            inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            SqlSession session = sessionFactory.openSession(true);
            classDao = session.getMapper(ClassDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
	@Override
	public boolean insertUser(MemberVO user) {

        try {
            boolean userInsert = classDao.insertUser(user);
            if (!userInsert) {
                return false;
            }

            if (user.getMe_authority().equals("professor")) {
                return classDao.insertProfessor(user.getMe_id(), user.getMa_num());
            } else if (user.getMe_authority().equals("student")) {
                return classDao.insertStudent(user.getMe_id(), user.getMa_num());
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	

	@Override
	public List<MajorVO> getMajorList() {
		return classDao.selectMajorList();
	}
}

