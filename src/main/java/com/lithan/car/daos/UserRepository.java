package com.lithan.car.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lithan.car.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserName(String name);
}
