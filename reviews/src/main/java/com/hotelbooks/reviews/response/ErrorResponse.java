package com.hotelbooks.reviews.response;

import lombok.Data;

@Data
public class ErrorResponse {

	private int code;
	private String description;

	public ErrorResponse(int code, String description) {
		super();
		this.code = code;
		this.description = description;
	}

}
