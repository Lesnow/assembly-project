package pl.coderslab.assemblyTeam;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AssemblyTeamRepository extends JpaRepository<AssemblyTeam, Long> {
    public AssemblyTeam findById(long id);

}