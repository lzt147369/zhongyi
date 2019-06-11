package com.zhongyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
public class AdminApplication {

    public static void main(String[] args) {
        //TODO 解决es错误
        System.setProperty("es.set.netty.runtime.available.processors", "false");
        SpringApplication.run(AdminApplication.class, args);
    }
}


