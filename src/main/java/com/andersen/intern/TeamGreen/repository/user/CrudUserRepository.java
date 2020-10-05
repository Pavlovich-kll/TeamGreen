package com.andersen.intern.TeamGreen.repository.user;

import com.andersen.intern.TeamGreen.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


/* Через этот интерфейс мы будем работать с базой с помощью Data Jpa
*  Изменяем метод delete, так как по дефолту он возвращает Void,
*  С типом Int мы может сделать проверку на удаление из БД
* */
public interface CrudUserRepository extends JpaRepository<User, Long> {

    @Modifying // так, как у нас есть по дефолту этот метод, то мы должны поставить эту аннотацию
    @Query("DELETE FROM User u WHERE u.id=:id") // здесь прописываем наш запрос в БД
    int delete(@Param("id") long id);

    // метод для получения по email, Data Jpa сама генерит запрос по имени метода
    User getByEmail(String email);
}
