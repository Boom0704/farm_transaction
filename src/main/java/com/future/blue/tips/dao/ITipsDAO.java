package com.future.blue.tips.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.future.blue.tips.vo.TipsVO;

@Mapper
public interface ITipsDAO {
   
   public List<TipsVO> findSurveyData(TipsVO tipsvo);

}
