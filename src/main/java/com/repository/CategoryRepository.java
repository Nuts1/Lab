package com.repository;

import com.entity.Category;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by nuts on 18/03/17.
 */
@Repository
public interface CategoryRepository extends PagingAndSortingRepository<Category, Integer> {
}
