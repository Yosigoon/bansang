package org.bansang.web;


import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;
import org.bansang.dto.GroupDTO;
import org.bansang.dto.GroupMemberDTO;
import org.bansang.dto.MemberDTO;
import org.bansang.service.GroupService;
import org.bansang.util.ReadGroupExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@CrossOrigin(origins="*", allowedHeaders="*", allowCredentials="true")
@RestController
@RequestMapping("/group/*")
@Log
public class GroupController {

	@Autowired
	GroupService groupService;

	@GetMapping("/groupList")
	public @ResponseBody List<GroupDTO> groupList(MemberDTO dto) {
		log.info("===============Group List: " + groupService.groupList(dto.getMemberId()));
		return groupService.groupList(dto.getMemberId());
	}
	
	@GetMapping("/groupMemberList/{groupNumber}")
	public @ResponseBody List<GroupMemberDTO> groupMemberList(@PathVariable("groupNumber") Long groupNumber) {
		log.info("Group Member List: " + groupService.groupMemberList(groupNumber));
		return groupService.groupMemberList(groupNumber);
	}


	@PostMapping("/excelUpload")
	public void uploadExcelFile(@RequestParam("file") MultipartFile file) throws Exception {
		
		UUID uuid = UUID.randomUUID();
		String uploadName = uuid.toString() + "_" + file.getOriginalFilename();
		String filePath = "C:\\zzz\\excel\\" + uploadName;
		OutputStream out = new FileOutputStream(filePath);
		FileCopyUtils.copy(file.getInputStream(), out);

		ReadGroupExcel excel = new ReadGroupExcel();
		GroupDTO dto = excel.readGroupFromExcelFile(filePath);

		groupService.upload(dto);
		
	}
}
