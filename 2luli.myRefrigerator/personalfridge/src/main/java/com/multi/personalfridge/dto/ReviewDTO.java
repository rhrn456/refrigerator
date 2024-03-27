package com.multi.personalfridge.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReviewDTO {
    private Integer review_id;
    private String review_content;
    private String user_id;
    private int recipe_id;
    private Timestamp create_review_date;
    private String recipe_name;
    private String recipe_category;

}