package pl.coderslab.project;


import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

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
}
