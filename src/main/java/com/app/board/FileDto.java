package com.app.board;

public class FileDto {
	
	private int file_number;
	private int board_number;
	private String file_name;
	private int file_cnt;
	private String create_at;
	private String update_at;
	
	

	public String getCreate_at() {
		return create_at;
	}
	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}
	public String getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}
	public int getFile_number() {
		return file_number;
	}
	public void setFile_number(int file_number) {
		this.file_number = file_number;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getFile_cnt() {
		return file_cnt;
	}
	public void setFile_cnt(int file_size) {
		this.file_cnt = file_size;
	}
	
	@Override
	public String toString() {
		return "fileDto [file_number="+file_number+", board_number="+board_number+", file_name="+file_name+"]";
	}
}
