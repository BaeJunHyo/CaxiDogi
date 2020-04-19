package cd.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cd.com.a.model.admin_noticeDto;
import cd.com.a.service.admin_noticeService;
import cd.com.a.dao.admin_noticeDao;

@Service
public class admin_noticeServiceImpl implements admin_noticeService{

	@Autowired
	admin_noticeDao dao;

	@Override
	public boolean notice_insert(admin_noticeDto dto) {
		return dao.notice_insert(dto);
	}
	
	
}
