package com.repository;

import com.entity.Book;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Nuts on 2/28/2017
 * 11:16 PM.
 */
@Repository
public interface BookRepository extends PagingAndSortingRepository<Book, Integer> {
}
