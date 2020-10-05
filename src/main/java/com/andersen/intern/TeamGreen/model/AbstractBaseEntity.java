package com.andersen.intern.TeamGreen.model;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Objects;

/* Абстрактный класс entity, у которого есть поле id, created, lastUpdated
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
    protected Long id;

    @Column(name = "created", nullable = false)
    protected LocalDateTime created;

    @Column(name = "last_updated", nullable = false)
    protected LocalDateTime lastUpdated;

    protected AbstractBaseEntity() {
    }

    public AbstractBaseEntity(Long id, LocalDateTime created, LocalDateTime lastUpdated) {
        this.id = id;
        this.created = created;
        this.lastUpdated = lastUpdated;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public LocalDateTime getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(LocalDateTime lastUpdated) {
        this.lastUpdated = lastUpdated;
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
