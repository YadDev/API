package com.transport.transit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.transport.transit.beans.BaseResponse;
import com.transport.transit.beans.BusStopMaster;
import com.transport.transit.beans.MenuMaster;
import com.transport.transit.beans.UserCredential;
import com.transport.transit.common.Constant;

@Controller
public class LoginController {

	private ObjectMapper objMapper=new ObjectMapper();
	
	private Gson gson=null;
	private RestTemplate restTemplate=new RestTemplate(); 
	String tokenResponse=null;
	
	@RequestMapping("/login")
	public ModelAndView getLogin(@ModelAttribute("login") UserCredential login, BindingResult res) {
		System.out.println("Login Page");
		return new ModelAndView("login");

	}

	@RequestMapping("/loginAuth")
	public ModelAndView loginAuthentication(@ModelAttribute("login") UserCredential login, BindingResult result,
			HttpServletRequest request,RedirectAttributes redirectAttributes) {
		ModelAndView model=new ModelAndView();
		
		try {
			System.out.println("Entered Credential "+login);
			String jsonString=objMapper.writeValueAsString(login);
			tokenResponse= restTemplate.postForObject(Constant.Admin.LOGINURL,login,String.class);
			System.out.println("Entered Credential "+tokenResponse);
//			HttpSession session = request.getSession();
			if(login.getUserName().equals("admin")) {
				System.out.println("Devendra");
//				model.addObject("loggedInUser",login.getUserName());
//				redirectAttributes.addFlashAttribute("token", status);
				model.setViewName("redirect:/postLogin");
			}				
			else {				
				model.setViewName("redirect:/login");
			}
		}
		catch(Exception exe) {
			model.setViewName("redirect:/login");
		}
			return model; 
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView model=new ModelAndView();
		try {
			String userName="admin";
			String status = restTemplate.postForObject(Constant.Admin.LOGOUT,userName,String.class);
			System.out.println("Entered Credential "+status);
//			HttpSession session = request.getSession();
			
				System.out.println("Devendra");
				model.setViewName("redirect:/login");
			
		}
		catch(Exception exe) {
			model.setViewName("redirect:/login");
		}
			return model; 
	}
	@RequestMapping("/postLogin")
	public ModelAndView postLogin(HttpServletRequest request) {
		ModelAndView model=new ModelAndView();
		BaseResponse response=new BaseResponse();
		
		try {
			gson=new Gson();
			String roleID="2121";
			
			TypeToken<BaseResponse> baseRepsonse = new TypeToken<BaseResponse>() {};
			response = gson.fromJson(tokenResponse, baseRepsonse.getType());
						
			HttpHeaders header=new HttpHeaders();
			header.add("Authorization", "Bearer " +response.getRespData());
			MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
			headers.add("Authorization", "Bearer " +response.getRespData());
			headers.add("Content-Type", "application/json");
			RestTemplate restTemplate = new RestTemplate();

			HttpEntity<MultiValueMap<String, String>> requestRest = new HttpEntity<MultiValueMap<String, String>>(headers,header);

			//restTemplate.postForObject(Constant.Admin.MENUS, request, Boolean.class);
			String menuString = restTemplate.postForObject(Constant.Admin.MENUS,requestRest,String.class);
				System.out.println("Menu String :: "+menuString);
				List<MenuMaster> menus=new ArrayList<>();
				
//					BaseResponse menusBaseResponse = objMapper.readValue(menuString, BaseResponse.class);
					TypeToken<List<MenuMaster>> menu = new TypeToken<List<MenuMaster>>() {};
					menus = gson.fromJson(menuString, menu.getType());
									
					
				
			System.out.println("Menus Master Response  "+menus.size());
			for (MenuMaster menuMaster : menus) {
				System.out.println(menuMaster.toString());
			}
				model.addObject("menuList",menus);
				model.setViewName("dashboard");
				
		}
		catch(Exception exe) {
			model.setViewName("dashboard");
		}
		return model; 
	}	
	

	@RequestMapping("/busStopPage")
	public ModelAndView busStop(ModelAndView model) {
		System.out.println("Model and View for Bus Stop");
		model.setViewName("busStopPage");
		return model; 
	}

	
	

	@RequestMapping(value = "/springPaginationDataTables", method = RequestMethod.GET)
    public @ResponseBody String springPaginationDataTables(HttpServletRequest  request) throws IOException {
		
		List<BusStopMaster> busStopList = new ArrayList<BusStopMaster>();
		for (int i = 0; i < 30; i++) {
				BusStopMaster buStop = new BusStopMaster();
				buStop.setBusStopCode("CD"+i);
				buStop.setBusStopName("Vikhroli"+i);
				buStop.setBusStopAdd("Vikhroli"+i);
				buStop.setBusStopState("MH");
				buStop.setBusStopStatus("A");
				busStopList.add(buStop);  
	  	}

		Gson gson=new Gson();
		
		 String a = "\"aaData\"";
         String json2 = "{" + a + ":";
		 //String json2 = "";
        
         json2= json2+gson.toJson(busStopList);
         json2 = json2 + "}";
         System.out.println("Json Formate: "+ json2);
         return json2;
	
		
    }

	

	@RequestMapping("/failed")
	public ModelAndView userLoginFailed(@ModelAttribute("login") UserCredential login) {

		return new ModelAndView("login", "msg", "Login Failed!!!!");

	}
	
}
