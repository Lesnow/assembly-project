
  package pl.coderslab.status;
  
  import javax.transaction.Transactional; import javax.validation.Valid;
  
  import org.springframework.security.core.annotation.AuthenticationPrincipal;
  import org.springframework.stereotype.Controller; import
  org.springframework.ui.Model; import
  org.springframework.validation.BindingResult; import
  org.springframework.web.bind.annotation.ModelAttribute; import
  org.springframework.web.bind.annotation.PathVariable; import
  org.springframework.web.bind.annotation.RequestMapping; import
  org.springframework.web.bind.annotation.RequestMethod;
  
  import pl.coderslab.project.Project; import
  pl.coderslab.project.ProjectRepository; import pl.coderslab.user.CurrentUser;
  import pl.coderslab.user.User;
  
  @Controller
  
  @RequestMapping ("/status") public class StatusController { private static
  StatusRepository statusRepository; private static ProjectRepository
  projectRepository;
  
  public StatusController(StatusRepository statusRepository, ProjectRepository
  projectRepository) {
	  this.statusRepository = statusRepository;
	  this.projectRepository = projectRepository; 
	  }
  
  @RequestMapping (value = "/add", method = RequestMethod.GET) String
  addStatus(Model model) { model.addAttribute("status", new Status()); return
  "status/addStatusForm"; }
  
  @Transactional
  
  @RequestMapping (value = "/add/{ProjectId}", method = RequestMethod.POST)
  String addStatus(@ModelAttribute @Valid Status
  status, @AuthenticationPrincipal CurrentUser customUser, @PathVariable Long
  ProjectId, BindingResult bindingResult) {
  
  if (bindingResult.hasErrors()) { return "status/addStatusForm"; }
  
  User entityUser = customUser.getUser();
  
  status.setUser(entityUser); if
  (projectRepository.findById(ProjectId).isPresent()) { Project project =
  projectRepository.findById(ProjectId).get(); status.setProject(project); }
  statusRepository.save(status); return "redirect:/project/all"; }
  
  }
 