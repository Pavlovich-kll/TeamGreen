package com.andersen.intern.TeamGreen.model;

import javax.persistence.*;

import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "products")
public class Product extends AbstractNamedEntity {
    private String description;
    private long price;
    @Lob
    private byte[] image;
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "product_types", joinColumns = @JoinColumn(name = "product_id"),
            uniqueConstraints = {@UniqueConstraint(columnNames = {"product_id", "type"},
                    name = "product_types_unique_idx")})
    @Column(name = "type")
    @ElementCollection(fetch = FetchType.LAZY)
    private Set<Type> types;

    @ManyToMany(mappedBy = "products")
    Set<Order> orders;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public Set<Type> getTypes() {
        return types;
    }

    public void setTypes(Set<Type> types) {
        this.types = types;

    }
}
