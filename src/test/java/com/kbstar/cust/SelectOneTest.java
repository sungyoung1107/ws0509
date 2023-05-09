package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class SelectOneTest {

    @Autowired
    CustService service;

    @Test
    void contextLoads(){
        String id = "id77";
        Cust cust = null;
        try {
            cust = service.get(id);
            log.info("------------------------");
            log.info(cust.toString());
            log.info("------------------------");
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
