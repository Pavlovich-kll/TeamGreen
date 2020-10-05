package com.andersen.intern.TeamGreen.repository.user;

import com.andersen.intern.TeamGreen.model.User;

import java.util.List;

/* Интерфейс нужен для зависимости на абстракциях (Dependency Inversion)
*
* */
public interface UserRepository {

    User get(long id);

    boolean delete(long id);

    List<User> getAll();

    User save(User user);

    User getByEmail(String email);
}
