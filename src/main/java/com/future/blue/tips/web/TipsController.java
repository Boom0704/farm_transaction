package com.future.blue.tips.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class TipsController {
	@GetMapping("/tips")
	public String tips() {
		return "tips/main";
	}
	
    @GetMapping("/tips/detail/{id}")
    public String detail(@PathVariable("id") int id) {
        return "tips/detail";
    }
}
