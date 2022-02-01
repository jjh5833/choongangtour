package com.choongangtour.dto;

import org.springframework.web.multipart.MultipartFile;

public class TestDTO {
	private int b_no, l_no, re_no, visi;
	//샛별추가 1012
	private int b_like;
	
	private String b_img, b_file, b_title, b_content, b_date, l_id, re_category, b_addr, b_tele, b_time, b_price ,b_tip, b_web ;
	public String getB_addr() {
		return b_addr;
	}



	public void setB_addr(String b_addr) {
		this.b_addr = b_addr;
	}

	public String getB_tele() {
		return b_tele;
	}

	public void setB_tele(String b_tele) {
		this.b_tele = b_tele;
	}

	public String getB_time() {
		return b_time;
	}

	public void setB_time(String b_time) {
		this.b_time = b_time;
	}

	public String getB_price() {
		return b_price;
	}

	public void setB_price(String b_price) {
		this.b_price = b_price;
	}

	public String getB_tip() {
		return b_tip;
	}

	public void setB_tip(String b_tip) {
		this.b_tip = b_tip;
	}

	public String getB_web() {
		return b_web;
	}

	public void setB_web(String b_web) {
		this.b_web = b_web;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getB_no() {
		return b_no;
	}

	public int setB_no(int b_no) {
		return this.b_no = b_no;
	}

	public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}


	public String getB_file() {
		return b_file;
	}

	public String setB_file(String b_file) {
		return this.b_file = b_file;
	}

	public String getB_img() {
		return b_img;
	}

	public String setB_img(String b_img) {
		return this.b_img = b_img;
	}

	public String getL_id() {
		return l_id;
	}

	public void setL_id(String l_id) {
		this.l_id = l_id;
	}

	public int getRe_no() {
		return re_no;
	}

	public int setRe_no(int re_no) {
		return this.re_no = re_no;
	}

	public String getRe_category() {
		return re_category;
	}

	public void setRe_category(String re_category) {
		this.re_category = re_category;
	}

	public int getVisi() {
		return visi;
	}

	public void setVisi(int visi) {
		this.visi = visi;
	}

	public int getB_like() {
		return b_like;
	}

	public void setB_like(int b_like) {
		this.b_like = b_like;
	}



	}

