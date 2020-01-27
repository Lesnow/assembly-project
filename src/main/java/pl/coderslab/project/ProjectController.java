package pl.coderslab.project;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.assemblyTeam.AssemblyTeam;
import pl.coderslab.assemblyTeam.AssemblyTeamRepository;
import pl.coderslab.user.CurrentUser;
import pl.coderslab.user.User;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Set;


@Controller
@RequestMapping ("/project")
public class ProjectController {
    private static ProjectRepository projectRepository;
    private static AssemblyTeamRepository assemblyTeamRepository;

    public ProjectController(ProjectRepository projectRepository, AssemblyTeamRepository assemblyTeamRepository) {
        this.projectRepository = projectRepository;
        this.assemblyTeamRepository = assemblyTeamRepository;
    }


    @RequestMapping ("/projects/{projectNumber}")
    String searchProjects(@PathVariable Long projectNumber, Model model) {
        Set<Project> projects = projectRepository.findAllByProjectNumberContaining(projectNumber);
        model.addAttribute("projects", projects);
        return "project/showAllProjects";
    }

    @RequestMapping ("/user")
    String searchProjectsByUserId(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User entityUser = customUser.getUser();
        Set<Project> projects = projectRepository.getProjectsByUserId(entityUser.getId());
        model.addAttribute("projects", projects);
        return "project/showAllProjects";
    }

    @RequestMapping ("/allByEndDate")
    String shawAllProjectsByEndDate(Model model) {
        Set<Project> projects = projectRepository.findAllByOrderByEndDate();
        model.addAttribute("projects", projects);
        return "project/showAllProjects";
    }

    @RequestMapping ("/allByTransportDate")
    String shawAllProjectsByTransportDate(Model model) {
        Set<Project> projects = projectRepository.findAllByOrderByTransportDate();
        model.addAttribute("projects", projects);
        return "project/showAllProjects";
    }

    @RequestMapping ("/allByUser")
    String shawAllProjectsByUser(Model model) {
        Set<Project> projects = projectRepository.findAllByOrderByUser();
        model.addAttribute("projects", projects);
        return "project/showAllProjects";
    }

    @RequestMapping ("/allByTeam")
    String shawAllProjectsByAssemblyTeam(Model model) {
        Set<Project> projects = projectRepository.findAllByOrderByAssemblyTeam();
        model.addAttribute("projects", projects);
        return "project/showAllProjects";
    }


    @RequestMapping ("/all")
    String shawAllProjects(Model model) {
        Set<Project> projects = projectRepository.findAllByOrderByProjectNumber();
        model.addAttribute("projects", projects);
        return "project/showAllProjects";
    }


    @RequestMapping (value = "/add", method = RequestMethod.GET)
    String addProject(Model model) {
        model.addAttribute("project", new Project());
        return "project/addProjectForm";
    }

    @RequestMapping (value = "/add", method = RequestMethod.POST)
    String addProject(@ModelAttribute @Valid Project project, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "project/addProjectForm";
        }
		
		/*
		 * if (statusRepository.findById(1L).isPresent()) {
		 * project.setStatus(statusRepository.findById(1L).get()); }
		 */
        projectRepository.save(project);
        return "redirect:/project/all";
    }

    @RequestMapping (value = "/update/{id}", method = RequestMethod.GET)
    public String updateProject(@PathVariable Long id, Model model) {

        Project project;
        if (projectRepository.findById(id).isPresent()) {
            project = projectRepository.findById(id).get();
            model.addAttribute("project", project);
        } else {
            model.addAttribute("project", new Project());
        }
        return "project/addProjectForm";
    }

    @PostMapping ("/update/{id}")
    public String updateProject(@PathVariable Long id, @ModelAttribute @Valid Project project, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "project/addProjectForm";
        }
        projectRepository.save(project);
        return "redirect:/project/all";
    }

    @Transactional
    @RequestMapping (value = "/attachCurrentUser/{ProjectId}", method = RequestMethod.GET)
    public String attachCurrentUser(@AuthenticationPrincipal CurrentUser customUser, @PathVariable Long ProjectId, Model model) {
        Project project;
        User entityUser = customUser.getUser();
        if (projectRepository.findById(ProjectId).isPresent()) {
            project = projectRepository.findById(ProjectId).get();
            project.setUser(entityUser);
            projectRepository.save(project);
        } else {
        }
        return "redirect:/project/all";
    }

    @Transactional
    @RequestMapping (value = "/detachCurrentUser/{ProjectId}", method = RequestMethod.GET)
    public String detachCurrentUser(@AuthenticationPrincipal CurrentUser customUser, @PathVariable Long ProjectId, Model model) {
        Project project;
        if (projectRepository.findById(ProjectId).isPresent()) {
            project = projectRepository.findById(ProjectId).get();
            project.setUser(null);
            projectRepository.save(project);
        } else {
        }
        return "redirect:/project/all";
    }

    @Transactional
    @RequestMapping (value = "/togglePriority/{ProjectId}", method = RequestMethod.GET)
    public String togglePriority(@PathVariable Long ProjectId, Model model) {
        Project project;

        if (projectRepository.findById(ProjectId).isPresent()) {
            project = projectRepository.findById(ProjectId).get();
            if (project.getPriority() >= 3) {
                project.setPriority(1);
            } else {
                project.setPriority(project.getPriority() + 1);
            }
            projectRepository.save(project);
        } else {
        }
        return "redirect:/project/all";
    }


    @RequestMapping ("/delete/{id}")
    String deleteProject(@PathVariable long id, Model model) {
        projectRepository.deleteById(id);
        return "redirect:../all";
    }

    @ModelAttribute ("assemblyTeamList")
    public List<AssemblyTeam> fetchAssemblyTeams() {
        return assemblyTeamRepository.findAll();
    }

	/*
	 * @ModelAttribute ("statusesList") public List<Status> fetchStatuses() { return
	 * statusRepository.findAll(); }
	 */

    @ModelAttribute ("curentUser")
    User entityUser(@AuthenticationPrincipal CurrentUser customUser) {
        return customUser.getUser();
    }

    @ModelAttribute ("fourWeeksFromNow")
    @DateTimeFormat (pattern = "yyyy-MM-dd")
    LocalDate fourWeeksFromNow() {
        return LocalDate.now().plusWeeks(4);
    }

    @ModelAttribute ("priorities")
    List<Priority> priorities() {
        Priority normal = new Priority();
        normal.setId(1);
        normal.setPriority("normal");

        Priority high = new Priority();
        high.setId(2);
        high.setPriority("high");

        Priority ultraHigh = new Priority();
        ultraHigh.setId(3);
        ultraHigh.setPriority("ultra");

        return Arrays.asList(normal, high, ultraHigh);
    }
}
