package com.future.blue.market.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.future.blue.market.service.MarketService;
import com.future.blue.market.vo.MarketVO;

@Controller
public class MarketController{
	
	@Autowired
	private MarketService marketService;
	
	@RequestMapping("market/main_kmh")
	public String main_kmh(Model model) {
		
		List<MarketVO> marketList = marketService.selectCode();
		model.addAttribute("marketList", marketList);
		
		return "market/main_kmh";
	}
}