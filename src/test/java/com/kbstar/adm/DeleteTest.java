package com.kbstar.adm;

import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class DeleteTest {

    @Autowired
    AdmService service;

    @Test
    void contextLoads(){
        String id = "id01";
        try {
            service.remove(id);
        } catch (Exception e) {
            log.info("에러 ..... ");
           e.printStackTrace();
        }
    }
}
