package com.corona.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private Integer ui_seq;
	private String ui_id;
	private String ui_pwd;
	private String ui_name;
	private Integer ui_gender;
	private Integer ui_age;
	private String ui_address;
	private String ui_phon_number;
	private Date ui_reg_date;
	private Integer ui_type;
}
