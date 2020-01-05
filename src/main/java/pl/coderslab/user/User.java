package pl.coderslab.user;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Set;

@Data
@Entity
@Table (name = "users")
public class User {

    @Column(name = "user_id")
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long Id;

    @Column(name = "email")
    @Email(message = "Podaj prawidłowy adres email")
    @NotEmpty (message = "wpisz swój email")
    private String email;

    @Column(name = "password")
    @Length (min = 6, message = "hasło musi składać się przynajmniej z 6 znaków")
    @NotEmpty (message = "wpisz swoje hasło")
    private String password;

    @Column(name = "nick")
    @Size(min = 1, max = 4, message = "między 1 a 4 znaki")
    @NotEmpty (message = "Podaj skrót imienia i nazwiska max 4 znaki")
    private String nick;

    @Column(name = "active")
    private int active;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;
}
