package com.andersen.intern.TeamGreen.model;

import javax.persistence.*;
import java.util.Objects;

/* Абстрактный класс entity, у которого есть поле id
* а так же переопределены методы equals, hashCode и toString
* От него наследуем entity, у которых нет имени
* */

@MappedSuperclass
@Access(AccessType.FIELD)
public abstract class AbstractBaseEntity {

    // здесь настраиваем, что id будет генериться с использованием sequence
    @Id
    @SequenceGenerator(name = "global_seq", sequenceName = "global_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "global_seq")
    protected Integer id;

    protected AbstractBaseEntity() {
    }

    public AbstractBaseEntity(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AbstractBaseEntity that = (AbstractBaseEntity) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + id;
    }
}
