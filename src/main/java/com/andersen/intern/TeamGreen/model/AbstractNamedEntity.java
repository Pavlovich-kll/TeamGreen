package com.andersen.intern.TeamGreen.model;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

/* Абстрактный класс entity, у которого есть имя
 *  От него будем наследовать entity, у которых есть имена
 * */

@MappedSuperclass
public class AbstractNamedEntity extends AbstractBaseEntity {

    @Column(name = "name", nullable = false)
    @Size(min = 4, max = 100)
    @NotBlank
    protected String name;

    protected AbstractNamedEntity() {
    }

    public AbstractNamedEntity(Long id, String name, LocalDateTime created, LocalDateTime lastUpdated) {
        super(id, created, lastUpdated);
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    public String toString() {
        return super.toString() + "(" + name + ")";
    }
}
