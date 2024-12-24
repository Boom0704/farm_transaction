package com.future.blue.sell.vo;

import lombok.Data;

@Data
public class AutoCompleteVO {
	
    private int acId;
    private String cropType;
    private String saleTitle;
    private String saleContent;
    private Integer popularity;
    private String createDt;
    private String updateDt;
    private String useYn;

}
