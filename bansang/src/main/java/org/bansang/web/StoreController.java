package org.bansang.web;

import org.bansang.dto.RecommendDTO;
import org.bansang.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/store/*")
@Log
public class StoreController {

	@Autowired
	private StoreService storeService;

    public List<RecommendDTO> list(){
		return storeService.list();
	}

	@GetMapping("/view")
	public RecommendDTO getView(Long storeNumber) {

		log.info("================");
		log.info("" + storeService.view(storeNumber));
		log.info("================");

		return storeService.view(storeNumber);
	}


	public void addValue(@RequestBody RecommendDTO dto){
		storeService.register(dto);
	}

	@GetMapping("/{storeNum}")
	public RecommendDTO getRecommendList(@RequestParam("storeNum") Long storeNum) {

		return storeService.getInfo(storeNum);
	}

	@GetMapping("/blog")
	public String blogList() {

		log.info("");

		String clientId = "JU1ZHvkqIuJ2itqjbi6v";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "w55QlDJ26S";// 애플리케이션 클라이언트 시크릿값";
		
		try {
			String text = URLEncoder.encode("강남역 맛집", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; // json 결과
			// String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
				
			}
			br.close();
			log.info("" + response.toString());
			
		
			
			return response.toString();

		} catch (Exception e) {
			log.info("" + e);
			return null;
		}
	}

}
