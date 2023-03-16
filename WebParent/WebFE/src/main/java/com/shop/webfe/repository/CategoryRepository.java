package com.shop.webfe.repository;

import com.shop.webcommon.entity.Category;
import com.shop.webcommon.entity.Product;
import com.shop.webfe.paging.SearchRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends SearchRepository<Category,Long> {

}
