package com.repository;

import com.entity.Order;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by nuts on 3/20/17.
 */
@Repository
public interface OrderRepository extends PagingAndSortingRepository<Order, Integer> {
}
