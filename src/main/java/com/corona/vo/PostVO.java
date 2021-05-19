package com.corona.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class PostVO {
	private Integer pi_seq;
	private String pi_owner;
	private Date pi_reg_date;
	private Integer pi_board_seq;
	private String pi_title;
	private String pi_content;
}
