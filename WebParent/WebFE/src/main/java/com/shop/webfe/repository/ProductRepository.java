package com.shop.webfe.repository;



import com.shop.webcommon.entity.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends PagingAndSortingRepository<Product,Long> {
    @Query(nativeQuery = true,
            value = "select * from products order by created_at desc limit 8")
    List<Product> findAllByCreateAt();
    @Query(nativeQuery = true,
            value = "SELECT * FROM products WHERE category_id = 1 ORDER BY volume DESC LIMIT 10")
    List<Product> findMenShirtsByVolume();
    @Query(nativeQuery = true,
            value = "SELECT * FROM products WHERE category_id = 2 ORDER BY volume DESC LIMIT 10")
    List<Product> findMalePantsByVolume();
    @Query(value = "select * from products where category_id = :id",nativeQuery = true)
    List<Product> findAllByCategory(@Param(value = "id") Long id);
}
