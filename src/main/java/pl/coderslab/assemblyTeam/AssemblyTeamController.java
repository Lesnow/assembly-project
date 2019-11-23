package pl.coderslab.assemblyTeam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping ("/team")
public class AssemblyTeamController {
    private static AssemblyTeamRepository teamRepository;

    public AssemblyTeamController(AssemblyTeamRepository teamRepository) {
        this.teamRepository = teamRepository;
    }


    @RequestMapping ("/all")
    String shawAllTeams(Model model) {
        List<AssemblyTeam> teams = teamRepository.findAll();
        model.addAttribute("teams", teams);
        return "assemblyTeam/showAllTeams";
    }

    @RequestMapping (value = "/add", method = RequestMethod.GET)
    String addTeam(Model model) {
        model.addAttribute("team", new AssemblyTeam());
        return "assemblyTeam/addTeamForm";
    }

    @RequestMapping (value = "/add", method = RequestMethod.POST)
    String addTeam(@ModelAttribute @Valid AssemblyTeam team, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "assemblyTeam/addTeamForm";
        }
        teamRepository.save(team);
        return "redirect:/team/all";
    }

    @RequestMapping ("/update/{id}")
    public String updateTeam(@PathVariable Long id, Model model) {
        AssemblyTeam team;
        if (teamRepository.findById(id).isPresent()) {
            team = teamRepository.findById(id).get();
            model.addAttribute("team", team);
        } else {
            model.addAttribute("team", new AssemblyTeam());
        }
        return "assemblyTeam/addTeamForm";
    }

    @PostMapping ("/update/{id}")
    public String updateTeam(@PathVariable Long id, @ModelAttribute @Valid AssemblyTeam team, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "assemblyTeam/addTeamForm";
        }
        teamRepository.save(team);
        return "redirect:/team/all";
    }

    @RequestMapping ("/delete/{id}")
    String deleteTeam(@PathVariable long id, Model model) {
        teamRepository.deleteById(id);
        return "redirect:/team/all";
    }
}

