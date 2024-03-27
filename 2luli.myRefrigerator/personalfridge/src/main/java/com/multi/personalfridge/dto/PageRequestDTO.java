package com.multi.personalfridge.dto;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class PageRequestDTO {
	//출력할 총페이지
	private int realEnd;
    //현재 페이지
    private int currentPage;
    // 화면 하단 출력할 페이지 개수(기본 : 10)
    private int pageAmount;
    //시작 끝 페이지
    private int startPage, endPage;
    //뒤,앞
    private boolean prev, next;
    //총 데이터수
    private int total;
    //페이지당 출력할 아이템개수
    private int amount;
    
    @Builder
    public PageRequestDTO(int total, int pageAmount,int currentPage,int amount) {
        this.total = total;
        this.pageAmount = pageAmount;
        this.currentPage = currentPage;
        this.amount = amount;
        

        this.endPage = (int)(Math.ceil(currentPage * 1.0 / pageAmount)) * pageAmount;
        this.startPage = endPage - (pageAmount - 1);

        realEnd = (int)(Math.ceil(total * 1.0 / amount));

        if(endPage > realEnd){
          this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }
}