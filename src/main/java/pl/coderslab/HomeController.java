package pl.coderslab;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.user.CurrentUser;
import pl.coderslab.user.User;


@Controller
@RequestMapping("/")
public class HomeController {

    @RequestMapping (value = "/")
    String showHomePage() {
        return "index";
    }
}