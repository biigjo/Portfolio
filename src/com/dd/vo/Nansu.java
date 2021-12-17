package com.dd.vo;

import java.util.Random;

public class Nansu {

	public static void main(String[] args) {
		
		Random ran = new Random();
		String value = "";
		for(int i = 0; i <=7; i++) {
			int num = (int) 48 + (int)(ran.nextDouble()*74);
			value = value + (char)num;
		}
		System.out.println(value);
	}

}
