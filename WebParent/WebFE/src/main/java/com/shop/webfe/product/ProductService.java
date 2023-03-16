package com.shop.webfe.product;


import com.shop.webcommon.dto.ProductDto;
import com.shop.webcommon.entity.Product;
import com.shop.webcommon.dto.ProductDetailDto;
import com.shop.webfe.repository.ProductRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    ProductRepository productRepository;
    public List<ProductDto> listProduct(){
        List<Product> products = productRepository.findAllByCreateAt();
        return products.parallelStream()
                .map(product -> modelMapper.map(product, ProductDto.class))
                .collect(Collectors.toList());
    }
    public ProductDetailDto getDetailProduct(Long id){
        Product product = productRepository.findById(id).get();
        return modelMapper.map(product, ProductDetailDto.class);
    }
    public List<ProductDetailDto> getAllProductByCategory(Long id){
       Product getProduct = productRepository.findById(id).get();
       Long getIdCategory = getProduct.getCategory().getId();
       List<Product> products = productRepository.findAllByCategory(getIdCategory);
       return  products.parallelStream()
               .map(product -> modelMapper.map(product,ProductDetailDto.class))
               .collect(Collectors.toList());
    }
    public ProductDetailDto findById(Long id){
        Product product = productRepository.findById(id).get();
        return modelMapper.map(product,ProductDetailDto.class);
    }
    public List<ProductDto> findMenShirtsByVolume(){
        List<Product> products = productRepository.findMenShirtsByVolume();
        return products.parallelStream()
                .map(product -> modelMapper.map(product,ProductDto.class))
                .collect(Collectors.toList());
    }
    public  List<ProductDto> findMalePantsByVolume(){
        List<Product> products = productRepository.findMalePantsByVolume();
        return products.parallelStream()
                .map(product -> modelMapper.map(product,ProductDto.class))
                .collect(Collectors.toList());
    }
}
