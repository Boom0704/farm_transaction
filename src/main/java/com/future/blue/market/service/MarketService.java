package com.future.blue.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.future.blue.market.dao.IMarketDAO;
import com.future.blue.market.vo.MarketVO;

@Service
public class MarketService {
	
	@Autowired
	private IMarketDAO MarketDAO;
	
	public List<MarketVO> selectCode(){
		return MarketDAO.selectCode();
	}

}
