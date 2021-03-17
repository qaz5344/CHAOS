package com.human.chaosIF;

import java.util.List;

import com.human.chaosDTO.FileDTO;

public interface IF_FileDAO {
	public List<FileDTO> seFile()throws Exception;
	public List<FileDTO> seFiles(int no)throws Exception;
	public List<FileDTO> seFileUser(String nick)throws Exception;
	public void insertF(FileDTO fDTO)throws Exception;
	public void delBnum(int bnum)throws Exception;
}
