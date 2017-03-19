package com.repository;

import com.entity.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by nuts on 3/19/17.
 */
@Repository
public interface UserRepository extends PagingAndSortingRepository<User, Integer> {

}
