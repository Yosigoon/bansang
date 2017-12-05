package org.bansang.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import lombok.extern.java.Log;

@Controller
@RequestMapping("/bansang/*")
@Log
public class BansangController {

	@GetMapping("/profile")
	public void getProfile() {
		return;
	}
	
	@GetMapping("/group")
	public void getGroup() {
		return;
	}
	
	@GetMapping("/download/{fileName:.+}")
	public ResponseEntity<byte[]> fileDown(@PathVariable("fileName") String fileName) throws Exception {
		InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        try {
        	HttpHeaders headers = new HttpHeaders();
        	in = new FileInputStream("C:\\zzz\\zdownload\\" + fileName); 
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.add("Content-Disposition", "attachment; filename=\""+ 
              new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
              headers, HttpStatus.CREATED);
        }catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
        return entity;
    }
}
