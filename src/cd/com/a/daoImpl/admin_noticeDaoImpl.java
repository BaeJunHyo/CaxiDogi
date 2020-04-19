package cd.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cd.com.a.model.admin_noticeDto;
import cd.com.a.service.admin_noticeService;
import cd.com.a.dao.admin_noticeDao;

@Repository
public class admin_noticeDaoImpl implements admin_noticeDao{
	
	@Autowired
	SqlSession sqlSession;
	String ns = "admin_notice.";
	
	
	@Override
	public boolean notice_insert(admin_noticeDto dto) {
		
		return sqlSession.insert(ns + "notice_insert", dto)>0?true:false;
	}
	
	
}
