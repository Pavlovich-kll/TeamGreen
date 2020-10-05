package com.andersen.intern.TeamGreen.repository.user;

import com.andersen.intern.TeamGreen.model.User;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {

    // Сортирует список пользователей по имени, если повторяются имена, то по email
    private static final Sort SORT_NAME_EMAIL = Sort.by(Sort.Direction.ASC, "name", "email");

    // делегируем методы на этот интерфейс
    private final CrudUserRepository crudUserRepository;

    public UserRepositoryImpl(CrudUserRepository crudUserRepository) {
        this.crudUserRepository = crudUserRepository;
    }

    @Override
    public User get(long id) {
        return crudUserRepository.findById(id).orElse(null);
    }

    @Override
    public boolean delete(long id) {
        return crudUserRepository.delete(id) != 0;
    }

    @Override
    public List<User> getAll() {
        return crudUserRepository.findAll(SORT_NAME_EMAIL);
    }

    @Override
    public User save(User user) {
        return crudUserRepository.save(user);
    }

    @Override
    public User getByEmail(String email) {
        return crudUserRepository.getByEmail(email);
    }
}
