package com.transport.transit.beans;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @ToString
public class BusStopMaster {
	

	private Integer id;
	

	private String busStopName;
	

	private String busStopCode;
	

	private String busStopAdd;
	

	private String lattitude;
	

	private String longitude;
	

	private String busStopStatus;
	

	private String busStopState;
}
