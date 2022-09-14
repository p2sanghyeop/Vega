package com.app.board;

public class RippleDto extends BoardDto {
	
	private int ripple_number;
	private int board_number;
	private String ripple_id;
	private String ripple_text;
	private String update_at;
	private String create_at;
	
	
	public int getRipple_number() {
		return ripple_number;
	}
	public void setRipple_number(int ripple_number) {
		this.ripple_number = ripple_number;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getRipple_id() {
		return ripple_id;
	}
	public void setRipple_id(String ripple_id) {
		this.ripple_id = ripple_id;
	}
	public String getRipple_text() {
		return ripple_text;
	}
	public void setRipple_text(String ripple_text) {
		this.ripple_text = ripple_text;
	}
	public String getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}
	public String getCreate_at() {
		return create_at;
	}
	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}
}
