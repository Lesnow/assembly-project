package pl.coderslab.assemblyTeam;


import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@Entity
@Table (name = "assemblyTeam")
public class AssemblyTeam {

    @Id
    @GeneratedValue ( strategy = GenerationType.IDENTITY)
    private long id;

    @Size (min = 3, max = 255)
    @NotBlank (message = "nazwa nie może być pusta")
    @Column (name = "teamName", nullable = false)
    private String teamName;

    @Column(name = "phoneNumber")
    private String phoneNumber;

    @Column(name = "additionalInfo")
    private String additionalInfo;

    @Column(name = "active")
    private boolean active;

}
