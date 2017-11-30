package org.bansang.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@RequestMapping("/upload/*")
@RestController
@Log
public class ImageUploadController {

	@PostMapping("/register")
	public @ResponseBody Map<String, String> uploadRecommendImagePost (@RequestParam("file") MultipartFile file) throws IOException {
        
		String original = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
        String uploadName = uuid.toString() + "_" + original;
        
        String filePath = "C:\\zzz\\zupload\\" + uploadName;
        OutputStream out = new FileOutputStream(filePath);
        FileCopyUtils.copy(file.getInputStream(), out);
        
        Map<String, String> map = new HashMap<String, String>();
        map.put("original", file.getOriginalFilename());
        map.put("uploadName",uploadName);
        return map;
	}
	
	@GetMapping("/show/{uploadName:.+}")
    public @ResponseBody byte[] display(@PathVariable("uploadName") String uploadName) throws Exception {
		log.info("test......................");
        File file = new File("C:\\zzz\\zupload\\" + uploadName);
        return FileUtils.readFileToByteArray(file);
    }
}
