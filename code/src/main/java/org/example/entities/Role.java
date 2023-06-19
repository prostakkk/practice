package org.example.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="role")
public class Role {

    @Id
    @Column(name = "idRole")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="roleName")
    private String roleName;

    @OneToMany(mappedBy = "role")
    private List<User> users;

    public Role() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
