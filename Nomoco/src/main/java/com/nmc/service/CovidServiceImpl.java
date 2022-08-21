package com.nmc.service;

import java.io.IOException;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class CovidServiceImpl implements CovidService {

	

	private static final Logger log = LoggerFactory.getLogger(CovidServiceImpl.class);
	
	
		@Override
		public JSONArray getCovidInfo() {
             //국내 발생현황

			// Jsoup를 이용해서 크롤링 -covid
			String url = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=11&ncvContSeq=&contSeq=&board_id=&gubun=";

			Document doc = null; // Document에 페이지의 전체 소스가 저장됨

			try {
				doc = Jsoup.connect(url).get();

			} catch (IOException e) {
				e.printStackTrace();
			}

			// select를 이용하여 원하는 태그를 선택
			Elements covid_title = doc.select("#content > div > h5:nth-child(4)"); // 1) 국내발생현황名
			Elements covid_num0 = doc.select("#content > div > div.caseTable > div:nth-child(1) > ul > li:nth-child(1) > dl > dd"); //2) 사망수1
			Elements covid_num1 = doc.select("#content > div > div.caseTable > div:nth-child(1) > ul > li:nth-child(2) > dl > dd"); //3) 사망수2
			Elements covid_num2 = doc.select("#content > div > div.caseTable > div:nth-child(2) > ul > li:nth-child(1) > dl > dd"); //4) 재원 위중증1
			Elements covid_num3 = doc.select("#content > div > div.caseTable > div:nth-child(2) > ul > li:nth-child(2) > dl > dd"); //5) 재원 위중증2
			Elements covid_num4 = doc.select("#content > div > div.caseTable > div:nth-child(3) > ul > li:nth-child(1) > dl > dd"); //6) 신규입원1
			Elements covid_num5 = doc.select("#content > div > div.caseTable > div:nth-child(3) > ul > li:nth-child(2) > dl > dd"); //7) 신규입원2
			Elements covid_num6 = doc.select("#content > div > div.caseTable > div:nth-child(4) > ul > li:nth-child(1) > dl > dd"); //8) 확진1
			Elements covid_num7 = doc.select("#content > div > div.caseTable > div:nth-child(4) > ul > li:nth-child(2) > dl > dd"); //9) 확진2
		

			// JSON 형태로 숙소 정보 저장
			JSONArray covidList = new JSONArray();

			for (int i = 0; i < covid_title.size(); i++) {
				// JSONObject에 키:값 형태로 데이터 저장
				JSONObject obj = new JSONObject();

				obj.put("covid_title", covid_title.get(i).text());
				obj.put("covid_num0", covid_num0.get(i).text());
				obj.put("covid_num1", covid_num1.get(i).text());
				obj.put("covid_num2", covid_num2.get(i).text());
				obj.put("covid_num3", covid_num3.get(i).text());
				obj.put("covid_num4", covid_num4.get(i).text());
				obj.put("covid_num5", covid_num5.get(i).text());
				obj.put("covid_num6", covid_num6.get(i).text());
				obj.put("covid_num7", covid_num7.get(i).text());
				
				

				// covidList에 생성한 JSONObject 추가
//					log.info(obj+"");
				covidList.add(obj);
				
			}
		System.out.println(" covidList : " + covidList);
			return covidList;
		}
		
		@Override
		public JSONArray getCovidInfo2() {
            //일자별 실시간 확진 현황(매주 update)
			String url = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=11&ncvContSeq=&contSeq=&board_id=&gubun=";

			Document doc = null;

			try {
				doc = Jsoup.connect(url).get();

			} catch (IOException e) {
				e.printStackTrace();
			}
			Elements c_title = doc.select("#content > div > h5:nth-child(13)"); // 1. 일자별 확진현황名
			Elements c_info = doc.select("#content > div > div:nth-child(14) > table > thead"); //2. 날짜
			Elements c_info1 = doc.select("#content > div > div:nth-child(14) > table > tbody > tr:nth-child(1)"); //3.일일확진수
			Elements c_info2 = doc.select("#content > div > div:nth-child(14) > table > tbody > tr:nth-child(2)"); //4.인구10만명당
			Elements c_title2 = doc.select("#content > div > div:nth-child(25) > div > h5"); //5.성별 확진현황名
			Elements c_info3 = doc.select("#content > div > div:nth-child(26) > table > tbody"); //6. 남성&여성

			JSONArray covidList2 = new JSONArray();

			for (int i = 0; i < c_title.size(); i++) {
				JSONObject obj = new JSONObject();

				obj.put("c_title", c_title.get(i).text());
				obj.put("c_info", c_info.get(i).text());
				obj.put("c_info1", c_info1.get(i).text());
				obj.put("c_info2", c_info2.get(i).text());
				obj.put("c_title2", c_title2.get(i).text());
				obj.put("c_info3", c_info3.get(i).text());

				covidList2.add(obj);
				System.out.println("covidList2"+covidList2);

			}

			return covidList2;
		}

}

