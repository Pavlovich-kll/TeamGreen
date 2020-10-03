package com.andersen.intern.TeamGreen.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "types")
public class Type extends AbstractNamedEntity {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private long id;
    private String name;
    @OneToMany(mappedBy = "type")
    private Set<Product> images;

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    public Set<Product> getImages() {
        return images;
    }

    public void setImages(Set<Product> images) {
        this.images = images;
    }
}
