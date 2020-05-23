package com.mvc.prectice.movie.controller;

public class MovieDto {

	private String rank;
	private String img;
	private String movieAge;
	private String movieTitle;
	private String movieRate;
	private String movieOpenDate;
	private String like;
	
	public MovieDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MovieDto(String rank, String img, String movieAge, String movieTitle, String movieRate, String movieOpenDate,
			String like) {
		super();
		this.rank = rank;
		this.img = img;
		this.movieAge = movieAge;
		this.movieTitle = movieTitle;
		this.movieRate = movieRate;
		this.movieOpenDate = movieOpenDate;
		this.like = like;
	}
	
	public MovieDto(String rank, String img, String movieAge, String movieTitle, String movieRate, String movieOpenDate) {
		super();
		this.rank = rank;
		this.img = img;
		this.movieAge = movieAge;
		this.movieTitle = movieTitle;
		this.movieRate = movieRate;
		this.movieOpenDate = movieOpenDate;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getMovieAge() {
		return movieAge;
	}

	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieRate() {
		return movieRate;
	}

	public void setMovieRate(String movieRate) {
		this.movieRate = movieRate;
	}

	public String getMovieOpenDate() {
		return movieOpenDate;
	}

	public void setMovieOpenDate(String movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}

	public String getLike() {
		return like;
	}

	public void setLike(String like) {
		this.like = like;
	}

	
}
