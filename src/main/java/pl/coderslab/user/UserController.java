package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping ("/user")
public class UserController {
    private static UserRepository userRepository;
    private static UserService userService;

    public UserController(UserRepository userRepository, UserService userService) {
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @RequestMapping (value = "/add", method = RequestMethod.GET)
    String addUser(Model model) {
        model.addAttribute("user", new User());
        return "user/addUserForm";
    }

    @RequestMapping (value = "/add", method = RequestMethod.POST)
    String addUser(@ModelAttribute @Valid User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "user/addUserForm";
        }
        userService.saveUser(user);
        return "index";
    }

    @RequestMapping (value = "/update/{id}", method = RequestMethod.GET)
    public String updateProject(@PathVariable Long id, Model model) {
        if (userRepository.findById(id).isPresent()) {
            model.addAttribute(userRepository.findById(id).get());
            return "user/changeUserDetailsForm";
        } else{
            return "redirect:/login";
        }
    }

    @PostMapping ("/update/{id}")
    public String updateProject(@PathVariable Long id, @ModelAttribute @Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "user/changeUserDetailsForm";
        }
        userService.saveUser(user);
        return "redirect:/login";
    }


    @RequestMapping ("/all")
    String shawAllUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "user/showAllUsers";
    }

    @Transactional
    @RequestMapping ("/toggleLock/{id}")
    String toogleLockUser(@PathVariable long id, Model model) {
        if (userRepository.findById(id).isPresent()) {
            User user = userRepository.findById(id).get();
            if (user.getActive() == 1) {
                user.setActive(0);
            } else {
                user.setActive(1);
            }
            userRepository.save(user);
        }
        else {
        }
        return "redirect:../all";
    }
}

