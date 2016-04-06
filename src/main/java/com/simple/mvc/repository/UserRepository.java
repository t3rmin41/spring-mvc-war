package com.simple.mvc.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.simple.mvc.jpa.UserJpa;

@Repository
public class UserRepository {

    @PersistenceContext
    private EntityManager entityManager;
    
    @Transactional
    public List<UserJpa> getAllUsers() {
        TypedQuery<UserJpa> typedQuery = entityManager.createQuery("SELECT u FROM " + UserJpa.class.getName() + " u", UserJpa.class);
        return typedQuery.getResultList();
    }
    
    @Transactional
    public UserJpa createUser(UserJpa jpa) {
        entityManager.persist(jpa);
        entityManager.flush();
        entityManager.refresh(jpa);
        return jpa;
    }
    
    @Transactional
    public UserJpa getUserJpaById(Long userId) {
        return getUserById(userId);
    }
    
    @Transactional
    public UserJpa editUser(UserJpa jpa) {
        return entityManager.merge(jpa);
    }
    
    @Transactional
    public Long deleteUserById(Long userId) {
        UserJpa jpa = getUserById(userId);
        entityManager.remove(jpa);
        return userId;
    }
    
    private UserJpa getUserById(Long userId) {
        TypedQuery<UserJpa> typedQuery = entityManager.createQuery("SELECT u FROM " + UserJpa.class.getName() + " u " +
                "WHERE u.id = :user_id", UserJpa.class);
        typedQuery.setParameter("user_id", userId);
        return typedQuery.getSingleResult();
    }
}
