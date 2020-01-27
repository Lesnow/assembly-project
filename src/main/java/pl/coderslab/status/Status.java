package pl.coderslab.status;


import lombok.Data;
import pl.coderslab.project.Project;
import pl.coderslab.user.User;

import java.time.LocalDateTime;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@Entity(name = "status")
public class Status {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;
    
    @ManyToOne
    private Project project;
    
    @ManyToOne
    private User user;

    @Size (min = 3, max = 255)
    @NotBlank
    @Column (nullable = false)
    private String statusName;

    @Size (min = 3, max = 255)
    @NotBlank
    @Column (nullable = false)
    private String description;

    private LocalDateTime created;
    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }
}
