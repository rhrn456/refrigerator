package com.multi.personalfridge;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminInterceptor implements HandlerInterceptor {
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession(false);
        if (session.getAttribute("userAdmin") == null || session.getAttribute("userAdmin").equals(false)
                || session.getAttribute("userAdmin").equals(0)) {
            if(session.getAttribute("userId") == null) {
                if (!response.isCommitted()) {
                    response.sendRedirect("/loginPage");
                    return false;
                }
            }
            if (!response.isCommitted()) {
                response.sendRedirect("/main");
                return false;
            }
        }

        return true;
    }
}