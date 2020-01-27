package pl.coderslab.project;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.assemblyTeam.AssemblyTeam;
import pl.coderslab.user.User;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity
@Table (name = "project")
public class Project {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;

    @Size (min = 4, max = 6, message = "numer projektu powinien składać się z 4 do 6 znaków")
    @NotBlank (message = "wpisz numer projektu")
    @Column(unique = true)
    private String projectNumber;


    @Size(max = 9, message = "numer seryjny urządzenia powinien składać się z 6 do 9 znaków")
    @Column
    private String factoryNumber;

    @Size(max = 255)
    @Column
    private String adress;

    @ManyToOne
    private User user;

    @Min(1)
    @Max(3)
    @Column
    private int priority;

    @ManyToOne
    private AssemblyTeam assemblyTeam;


    @Size (max = 600)
    private String description;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate transportDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate endDate;

    private LocalDateTime created;
    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }
}