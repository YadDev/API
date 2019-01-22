package com.transport.transit.beans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@ToString
public class BaseResponse {
	private String respCode;
	private String respMessage;
	private Object respData;
	
	
}