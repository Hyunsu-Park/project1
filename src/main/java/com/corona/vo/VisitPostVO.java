package com.corona.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VisitPostVO {
	private Integer seq;		//clpv_seq;
	private String area;		//clpv_area;
	private String type;		//clpv_type;
	private String address;		//clpv_address;
	private Date date1;			//clpv_first_visit_date;
	private Date date2;	 		//clpv_last_visit_date;
	private Integer disinfection;//clpv_disinfection;
	
}
