package cd.com.a.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import cd.com.a.model.AdminPoolParam;
import cd.com.a.model.PoolListParam;
import cd.com.a.model.memberDto;
import cd.com.a.model.poolDto;
import cd.com.a.model.poolParam;
import cd.com.a.model.poolResvDto;
import cd.com.a.model.poolResvParam;
import cd.com.a.service.MemberService;
import cd.com.a.service.PoolService;

@Controller
public class PoolController {
	@Autowired
	PoolService poolService;

	@Autowired
	MemberService memService;

	@RequestMapping(value = "adminPoolList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminPoolList(Model model, AdminPoolParam param) {
		// paging 처리
		int sn = param.getPageNumber(); // 0 1 2 현재 페이지
		int start = sn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10, 20, 30

		param.setStart(start);
		param.setEnd(end);

		int totalRecordCount = poolService.adminPoolListCount(param);
		List<poolDto> poolList = poolService.adminPoolList(param);

		model.addAttribute("poolList", poolList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("param", param);

		return "/bo/pool/bo_PoolList";
	}

	
	  @RequestMapping(value="adminPoolDetail.do", method={RequestMethod.GET,RequestMethod.POST}) 
	  public String adminPoolDetail(int pool_seq, Model model) {
	  
		  poolDto pool = poolService.getPoolDetail(pool_seq);
		  model.addAttribute("pool", pool);
		  
		  return "/bo/pool/bo_PoolDetail"; 
	  }
	 

	@RequestMapping(value = "adminPoolOk.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String adminPoolOk(int pool_seq) {
		String str = "";
		boolean status = poolService.adminPoolOk(pool_seq);

		if (status == true) {
			str = "ok";
		} else {
			str = "no";
		}

		return str;
	}

	@RequestMapping(value = "adminPoolNo.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String adminPoolNo(int pool_seq) {
		String str = "";
		boolean status = poolService.adminPoolNo(pool_seq);

		if (status == true) {
			str = "ok";
		} else {
			str = "no";
		}

		return str;
	}

	@RequestMapping(value = "getPoolList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getPoolList(Model model, PoolListParam param) {
		// paging 처리
		int pageNumber = param.getPageNumber();	// 0 1 2	현재 페이지
		int start = pageNumber * param.getRecordCountPerPage(); // 0, 10, 21
		
		int end = (pageNumber + 1) * param.getRecordCountPerPage();	// 10, 20, 30
		
		param.setStart(start);
		param.setEnd(end);
		
		List<poolDto> poollist = poolService.getPoolList(param);
		
		//글의 총수
		int totalRecordCount = poolService.getPoolCount(param);
		
		model.addAttribute("poollist", poollist);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("param",param);
		
		return "/pool/pool_list";
	}

	@RequestMapping(value = "poolDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getPoolDetail(Model model, int pool_seq, HttpSession session) {
		poolDto pool = poolService.getPoolDetail(pool_seq);
		model.addAttribute("pool", pool);

		return "/pool/pool_detail";
	}

	@RequestMapping(value = "poolResvView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String poolResvView(Model model, poolResvDto poolResv) {
		poolDto pool = poolService.getPoolDetail(poolResv.getPool_seq());
		memberDto mem = memService.resvMem(poolResv.getMem_seq());
		poolResv.setPool_resv_name(mem.getUser_name());
		poolResv.setPool_resv_tel(mem.getPhone());

		model.addAttribute("pool", pool);
		model.addAttribute("poolResv", poolResv);

		return "/pool/pool_resv";
	}

	@RequestMapping(value = "poolResvAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> poolResvAf(@ModelAttribute poolResvDto poolResv) {
		int result = poolService.resvPool(poolResv);
		Map<String, Object> rmap = new HashMap<String, Object>();
		if (result != 0) {
			rmap.put("status", "ok");
			rmap.put("rnum", result);
		} else {
			rmap.put("status", "no");
		}
		return rmap;
	}

	@RequestMapping(value = "pool_reservation.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String poolReservation(int pool_resv_seq, Model model) {
		poolResvDto resv = poolService.getResvPool(pool_resv_seq);
		poolDto pool = poolService.getPoolDetail(resv.getPool_seq());
		model.addAttribute("pool_resv", resv);
		model.addAttribute("pool", pool);
		return "/pool/pool_resv_detail";
	}

	@RequestMapping(value = "poolCancleAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String poolCancleAf(int pool_resv_seq) {
		String str = "";
		boolean status = poolService.poolCancleAf(pool_resv_seq);

		if (status == true) {
			str = "ok";
		} else {
			str = "no";
		}
		return str;
	}

	@RequestMapping(value = "poolResvList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String poolResvList(Model model, HttpSession session, poolParam param) {
		memberDto mem = (memberDto) session.getAttribute("loginUser");
		param.setMemSeq(mem.getMem_seq());

		// paging 처리
		int sn = param.getPageNumber(); // 0 1 2 현재 페이지
		int start = sn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10, 20, 30

		param.setStart(start);
		param.setEnd(end);

		int totalRecordCount = poolService.getPoolResvUserCount(param);
		List<poolResvParam> poolResvList = poolService.poolResvList(param);
		model.addAttribute("poolResvList", poolResvList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		return "/pool/poolResvList";
	}
	
	@RequestMapping(value = "poolCancleList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String poolCancleList(Model model, HttpSession session, poolParam param) {
		memberDto mem = (memberDto) session.getAttribute("loginUser");
		param.setMemSeq(mem.getMem_seq());

		// paging 처리
		int sn = param.getPageNumber(); // 0 1 2 현재 페이지
		int start = sn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10, 20, 30

		param.setStart(start);
		param.setEnd(end);

		int totalRecordCount = poolService.getPoolCancleCount(param);
		List<poolResvParam> poolList = poolService.poolCancleList(param);
		model.addAttribute("poolList", poolList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		return "/pool/poolCancleList";
	}
	

}
