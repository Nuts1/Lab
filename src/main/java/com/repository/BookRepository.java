package com.repository;

import com.entity.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends PagingAndSortingRepository<Book, Integer> {

    @Query("SELECT b FROM com.entity.Book b WHERE lower(b.category.name) like concat('%', lower(?1), '%')")
    Page<Book> findByCategoryName(String categoryName, Pageable pageable);
}
