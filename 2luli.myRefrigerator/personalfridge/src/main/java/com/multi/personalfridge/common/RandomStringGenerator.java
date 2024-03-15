package com.multi.personalfridge.common;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class RandomStringGenerator {

	public static String generateRandomString() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();

        String lowerAlphabets = "abcdefghijklmnopqrstuvwxyz";
        String upperAlphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String numbers = "0123456789";

        String characters = lowerAlphabets + upperAlphabets + numbers;

        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }

        return sb.toString();
    }

    
}