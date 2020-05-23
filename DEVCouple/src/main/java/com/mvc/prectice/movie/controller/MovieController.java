package com.mvc.prectice.movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class MovieController {

	Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value = "/movieinfo.do")
	public String Movieinfo(Model model) {
		String url = "http://www.cgv.co.kr/movies/"; //크롤링할 url지정
		Document doc = null;    //해당 페이지의 전체 소스가 저장된다.
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements ranks = doc.select(".rank");
		Elements imgs = doc.select(".thumb-image > img");
		Elements movieAges = doc.select(".ico-grade");
		Elements movieTitles = doc.select("div.box-contents strong.title");
		Elements movieRates = doc.select(".percent span");
		Elements movieOpenDates = doc.select(".txt-info strong");
		//Elements likes = doc.select(".count strong>i");
		
		List<MovieDto> list = new ArrayList<MovieDto>();
		for(int i = 0; i < ranks.size(); i++) {
			String rank = ranks.get(i).text();
			String img = imgs.get(i).attr("src");
			String movieAge = movieAges.get(i).text();
			String movieTitle = movieTitles.get(i).text();
			String movieRate = movieRates.get(i).text();
			String movieOpenDate = movieOpenDates.get(i).text();
			//String like = likes.get(i).text();
			
			int seq = i;
			//MovieDto moviedto = new MovieDto(rank,img,movieAge,movieTitle,movieRate,movieOpenDate,like);
			MovieDto moviedto = new MovieDto(rank,img,movieAge,movieTitle,movieRate,movieOpenDate);
			logger.info(moviedto.toString());
			list.add(moviedto);
			
		}
		Gson gson = new Gson();
		gson.toJson(list);
		model.addAttribute("movieinfo", list);

		return "movieinfo";
		
	}
	
	@RequestMapping(value = "/moviesoon.do")
	@ResponseBody
	public void MovieSoon(HttpServletResponse response) throws IOException {
		logger.info("MovieSoon");
		String url = "http://www.cgv.co.kr/movies/pre-movies.aspx"; //크롤링할 url지정
		Document doc = null;    //해당 페이지의 전체 소스가 저장된다.
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements ranks = doc.select(".rank");
		Elements imgs = doc.select(".thumb-image > img");
		Elements movieAges = doc.select(".ico-grade");
		Elements movieTitles = doc.select("div.box-contents strong.title");
		Elements movieRates = doc.select(".percent span");
		Elements movieOpenDates = doc.select(".txt-info strong");
		//Elements likes = doc.select(".count strong>i");
		
		List<MovieDto> list = new ArrayList<MovieDto>();
		for(int i = 0; i < ranks.size(); i++) {
			String rank = ranks.get(i).text();
			String img = imgs.get(i).attr("src");
			String movieAge = movieAges.get(i).text();
			String movieTitle = movieTitles.get(i).text();
			String movieRate = movieRates.get(i).text();
			String movieOpenDate = movieOpenDates.get(i).text();
			//String like = likes.get(i).text();
			
			int seq = i;
			//MovieDto moviedto = new MovieDto(rank,img,movieAge,movieTitle,movieRate,movieOpenDate,like);
			MovieDto moviedto = new MovieDto(rank,img,movieAge,movieTitle,movieRate,movieOpenDate);
			logger.info(moviedto.toString());
			list.add(moviedto);
			
		}
		Gson gson = new Gson();
		String jsonList = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.println(jsonList);
	}
	
}
