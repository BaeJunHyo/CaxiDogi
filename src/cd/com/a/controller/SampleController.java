package cd.com.a.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="main.do")
	public String sample(Model model) {
		String test = sqlSession.selectOne("Member.test");
		model.addAttribute("test", test);
		return "main";
	}
	
}
