package com.andersen.intern.TeamGreen.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/* Наш кошелек, у которого есть поле balance и user_id
*
* */

@Entity
@Table(name = "wallets")
public class Wallet extends AbstractBaseEntity {

    @Column(name = "balance", nullable = false)
    private BigDecimal balance = new BigDecimal(0);  //default 0 при создании

    @MapsId
    @OneToOne(mappedBy = "wallet", cascade = CascadeType.ALL,
            fetch = FetchType.LAZY, optional = false)
    private User user;


    public Wallet() {
    }

    public Wallet(Integer id, BigDecimal balance, User user, LocalDateTime created, LocalDateTime lastUpdated) {
        super(id, created, lastUpdated);
        this.balance = balance;
        this.user = user;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
