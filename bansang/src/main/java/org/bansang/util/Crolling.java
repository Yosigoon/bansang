package org.bansang.util;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.channels.FileLockInterruptionException;
import java.util.Scanner;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.Capabilities;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.springframework.scheduling.annotation.Async;
import org.springframework.util.FileCopyUtils;
import com.gargoylesoftware.htmlunit.javascript.host.html.Option;
import lombok.extern.java.Log;

import lombok.extern.java.Log;

@Log
public class Crolling extends Thread{

	public static WebDriver driver;
	int index;
	String storeName;
	
	public Crolling(int index, String storeName) {
		this.index = index;
		this.storeName = storeName;
	}


	public void run(){
		try {
			System.setProperty("webdriver.chrome.driver", "C:\\zzz\\chromedriver\\chromedriver.exe"); //크롬드라이버 실행
			ChromeOptions options = new ChromeOptions();
			options.addArguments("headless"); //Chrome 창 안뜨고 캡쳐.
			
	//		String url = "https://www.google.co.kr/search?q="+ storeName +"&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjV07L69e_XAhUHrJQKHbrkCSgQ_AUICigB&biw=1920&bih=949"; // 구글  
			String url = "https://search.naver.com/search.naver?where=image&sm=tab_jum&query="+storeName; 
	
			driver = new ChromeDriver(options);
			driver.get(url);
			
	//		String imgUrl = driver.findElement(By.cssSelector("#rg_s > div:nth-child(" + (i+1) + ") > a > img")).getAttribute("src"); // 구글
			String imgUrl = driver.findElement(By.cssSelector("#_sau_imageTab > div.photowall._photoGridWrapper > div.photo_grid._box > div:nth-child(" + index + ") > a.thumb._thumb > img")).getAttribute("src");  
	
			URL	image = new URL(imgUrl);
			BufferedImage img = ImageIO.read(image);
			String filePath = "C:\\zzz\\crolling\\"+index+".png";
			ImageIO.write(img, "png", new File(filePath));
		
		} catch (Exception e) {
			throw new RuntimeException("exception from thread");
		}

		
		driver.quit();   

			
	}
}
