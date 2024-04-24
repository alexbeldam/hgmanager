package hg.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Token {
    @Id
    private int id;
}