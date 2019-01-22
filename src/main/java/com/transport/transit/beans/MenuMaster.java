package com.transport.transit.beans;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @ToString
public class MenuMaster {


	private Integer pageID;
	
	
	private String pageName;
	
	
	private Integer pageSeq;
	
	
	private String pageLink;
	
	
	private String pageShortCut;
}
