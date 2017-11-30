package org.bansang.web;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.bansang.dto.GroupMemberDTO;
import org.bansang.service.GroupService;
import org.bansang.util.ReadGroupExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/bansang/*")
@Log
public class GroupController {

	@Autowired
	GroupService groupService;
		
	@GetMapping("/register")
	public void uploadExcelFileGet() {
		
	}

	@PostMapping("/")
	public void uploadExcelFile(@RequestParam("file") MultipartFile file, String groupName) throws Exception {
		
        log.info("======= UPLOAD =======");        

        UUID uuid = UUID.randomUUID();
        String uploadName = uuid.toString() + "_" + file.getOriginalFilename();
        String filePath = "C:\\zzz\\zupload\\" + uploadName;
        OutputStream out = new FileOutputStream(filePath);
        FileCopyUtils.copy(file.getInputStream(), out);
        
        ReadGroupExcel excel = new ReadGroupExcel();
        List<GroupMemberDTO> list = excel.readGroupFromExcelFile(filePath);
        
    	for (GroupMemberDTO groupMemberDTO : list) {

    		groupService.upload(groupMemberDTO);			
		}
	}
}
