package com.cardproject.myapp.filter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import org.springframework.web.filter.OncePerRequestFilter;

public class AdminFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        // 세션에서 관리자 여부를 확인
        HttpSession session = request.getSession(false);
        int isAdmin = (int) session.getAttribute("isAdmin");
        if (isAdmin == 0) {
            // 관리자가 아닐 경우 접근 금지
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
            return;
        }
        
        // 필터 체인 계속
        filterChain.doFilter(request, response);
    }
}

