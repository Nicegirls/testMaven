package org.lanqiao.util;

public class JudgeIdcard {
	public static boolean judge(String idcard){
		String year1 = idcard.substring(6,10);
		String month1= idcard.substring(10, 12);
		String day1  = idcard.substring(12, 14) ;
		int year = Integer.parseInt(year1) ;
		int month= Integer.parseInt(month1) ;
		int day  = Integer.parseInt(day1) ;
		
		if(year <= 1900) return false ;
		if(month > 12 || month < 1) return false ;
		if(day > 31 || day < 1) return false ;
		switch(month){
			case 4:
			case 6:
			case 9:
			case 11:{
				
				if(day >= 31) return false ;
				break;
			}
			case 2:{
				
				if(year%400==0 || (year%4==0 && year%100!=0)){
					if(day > 29) return false ;
				}else{
					if(day > 28) return false ;
				}
			}
			
		}
		
		return true ;
	}
}
