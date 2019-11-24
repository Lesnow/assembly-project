package pl.coderslab.project;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {

    Set<Project> findAllByProjectNumberContaining(Long projectNumber);
    Set<Project> findAllByOrderByProjectNumber();
    Set<Project> findAllByOrderByEndDate();
    Set<Project> findAllByOrderByTransportDate();
    Set<Project> findAllByOrderByUser();
    Set<Project> findAllByOrderByAssemblyTeam();

    @Query (value = "select p.* from project p where p.user_user_id = ?1", nativeQuery = true)
    Set<Project> getProjectsByUserId(long id);


}