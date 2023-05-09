package com.kbstar.controller;

import com.kbstar.dto.MsgAdm;
import com.kbstar.dto.Sales;
import com.kbstar.service.CartService;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Random;

@Slf4j
@RestController
public class ChartsController {

    @Autowired
    SalesService salesService = new SalesService();

    @RequestMapping("/groupSales")
    public Object groupSales(Model model) throws Exception {
        // series : [ { 'name' : 'Male', 'data' : []}, {'name' : 'Female', 'data' : []} ]
        List<Sales> salesList = salesService.groupsales();

        JSONArray series = new JSONArray();

        JSONObject male = new JSONObject();
        male.put("name", "Male");
        JSONArray maleData = new JSONArray();

        JSONObject female = new JSONObject();
        female.put("name", "Female");
        JSONArray femaleData = new JSONArray();

        // 1~12월 돌기
        for (int i = 1 ; i < 13 ; i++){
            int maleSales = 0;
            int femaleSales = 0;
            for (Sales sales : salesList) {
                if (Integer.parseInt(sales.getRdate()) == i) { // 해당하는 월의 데이터이면
                    if (sales.getGender().trim().equals("M")) { // 남자인 경우
                        maleSales += sales.getPrice();
                    } else if (sales.getGender().trim().equals("F")) { // 여자인 경우
                        femaleSales += sales.getPrice();
                    }
                }
            }
            maleData.add(maleSales);
            femaleData.add(femaleSales);
        }

        male.put("data", maleData);
        female.put("data", femaleData);

        series.add(male);
        series.add(female);

        return series;
    }

}