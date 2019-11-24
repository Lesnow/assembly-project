package pl.coderslab.project;


import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Data
@Entity(name = "status")
public class Status {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;

    @Size (min = 3, max = 255)
    @NotBlank
    @Column (nullable = false)
    private String statusName;


/*    @Size (min = 1, max = 20)
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
    */
}
