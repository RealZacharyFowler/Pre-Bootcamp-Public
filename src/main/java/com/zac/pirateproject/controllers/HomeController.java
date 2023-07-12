package com.zac.pirateproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zac.pirateproject.models.LoginUser;
import com.zac.pirateproject.models.Pirate;
import com.zac.pirateproject.models.User;
import com.zac.pirateproject.services.PirateService;
import com.zac.pirateproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;



@Controller
public class HomeController {
	
	@Autowired
	private UserService users;
	@Autowired
	private PirateService pirates;
	
	@GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        // Call a register method in the service 
        // to do some extra validations and create a new user!
    	User user = users.register(newUser, result);
    	
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = users.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    
        // No errors! 
        // Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	model.addAttribute("pirates", pirates.all());
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "home.jsp";
    }
    @GetMapping("/addPage")
    public String addPage(@ModelAttribute("pirate") Pirate pirate, Model model, HttpSession session) {
    	
    	User user = users.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	
    	return "addPage.jsp";
    }
    @PostMapping("/pirates")
    public String createPirate(@Valid @ModelAttribute("pirate") Pirate pirate, BindingResult result) {

    	if (result.hasErrors()) {
    		return "addPage.jsp";
    	}
    	
    	pirates.create(pirate);
    	
    	return "redirect:/home";
    }
    @GetMapping("/pirates/{id}")
    public String showPage(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Pirate pirate = pirates.findById(id);
    	model.addAttribute("pirate", pirate);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	
    	return "pirate.jsp";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    @RequestMapping("/delete/{id}")
    public String deletePirate(@PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
    }
    	Pirate pirate = pirates.findById( id);
		pirates.deletePirate(pirate);
		
		return "redirect:/home";
    }
    @GetMapping("/edit/{id}")
	public String editPirate(@PathVariable("id") Long id, @ModelAttribute("pirate") Pirate pirate, Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
    }
    {
		model.addAttribute("pirate", pirates.findById(id));
		return "editPage.jsp";
	}
    }
	@PostMapping("/edit/{id}")
    public String updatePirate(@Valid @ModelAttribute("pirate") Pirate pirate, BindingResult result,@PathVariable("id") Long id, Model model, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
    }
	{
        if (result.hasErrors()) {
            return "editPage.jsp";
        } else {
        	pirates.updatePirate(pirate);
            return "redirect:/home";
        }
    }
}

}
