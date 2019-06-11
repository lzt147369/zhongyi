package com.zhongyi.es.dao;

import com.zhongyi.es.entity.Book;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * 功能描述:
 *
 * @author: liuzhiting
 * @date: 2019/6/5
 */




public interface BookDao extends ElasticsearchRepository<Book,String> {

}


